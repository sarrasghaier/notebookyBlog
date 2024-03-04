class ArticlesController < ApplicationController

  def contact
  end
  def profile
  end
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, flash: { success: 'Article created successfully!' }
    else
      flash.now[:error] = 'Failed to create the article.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, flash: { success: 'Article updated successfully!' }
    else
      flash.now[:error] = 'Failed to update the article.'
      render :edit, status: :unprocessable_entity
    end
  end

  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to @article, flash: { success: 'Article deleted successfully!' }
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image, :status)
  end
end
