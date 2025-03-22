class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.includes(:author).all
    render json: @articles, include: :author
  end

  # GET /articles/1
  def show
    render json: @article, include: :author
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, include: :author, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    puts "Article Params: #{article_params.inspect}" # Debugging
    puts "Article Object Before Update: #{@article.inspect}" # Debugging

    if @article.update(article_params)
      puts "Article Object After Update: #{@article.inspect}" # Debugging
      render json: @article, include: :author
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  # GET /authors/:author_id/articles
  def by_author
    @articles = Article.where(author_id: params[:author_id]).includes(:author)
    render json: @articles, include: :author
  end

  def show_by_slug
  @article = Article.includes(:author).find_by(slug: params[:slug])

  if @article
    render json: @article, include: :author
  else
    render json: { error: 'Article not found' }, status: :not_found
  end
end


  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(
        :title,
        :description,
        :markdown,
        :image,
        :slug,
        { tag: [] },  # ✅ This fixes the syntax error
        :author_id
      )
    end
end
