class ArticlesController < ApplicationController
  respond_to :html

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    flash[:notice] = "Artigo criado com sucesso." if @article.save
    respond_with(@article, :location => articles_path)
  end
end
