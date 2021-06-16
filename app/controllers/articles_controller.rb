class ArticlesController < ApplicationController
    before_action :require_current_user, only: [:new, :create]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.friendly.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
    end

    private
    def require_current_user
        render file: "#{Rails.root}/public/404.html" unless current_user
    end
end