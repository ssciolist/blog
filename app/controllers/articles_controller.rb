class ArticlesController < ApplicationController
    before_action :require_registered_user, only: [:new, :create]

    def index
        @articles = Article.published
    end

    def show
        @article = Article.friendly.find(params[:id])

        @article.published or registered_user ? @article : not_found_404
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        binding.pry
        if @article.save()
            redirect_to @article, notice: "Article created successfully"
        else
            render :new
        end
    end

    private
    def article_params
        params.require(:article).permit(:title, :body, :published)
    end

end