  class Api::V1::ArticlesController < ApiController
    before_action :set_article, only: [:show, :update, :destroy]
    before_action :http_authenticate
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def index
      articles = Article.all
      render json: articles
    end
    def show
      render json: @article
    end
    def create
      articles = Article.new(article_params)
      if articles.save
        render json: articles, status: :created
      else
        render json: Article.errors, status: :unprocessable_entity
      end
    end
    def update
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      head :no_content
    end
    private
    def set_article
      @article = Article.find_by(id: params[:id])
      unless @article
        render json: { error: 'article not found' }, status: :not_found
      end
    end
    def article_params
        params.require(:article).permit(:title, :body, :status)
    end
end