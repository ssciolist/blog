class ArticlesController < ApplicationController
    before_action :require_current_user, only: [:new, :create]

    def index
        @articles = Article.published
    end

    def show
        @article = Article.friendly.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save()
            redirect_to @article, notice: "Article created successfully"
        else
            render :new
        end
    end

    private
    def require_current_user
        render file: "#{Rails.root}/public/404.html" unless current_user
    end

    def article_params
        params.require(:article).permit(:title, :body)
    end
end