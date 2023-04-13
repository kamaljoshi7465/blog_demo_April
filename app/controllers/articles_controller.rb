class ArticlesController < ApplicationController
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
    @article = Article.create(article_params);
    if @article.save!
      redirect_to @article
    else
      redirect_to new_article_path
    end
  end 
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update 
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    if @article.destroy
    redirect_to articles_path
    else 
      # redirect_to @article
      puts "destroy ERROR"
    end
  end

  private 
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
