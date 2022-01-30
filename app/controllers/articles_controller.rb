class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
   @collection = Article.user_articles(current_user)
  end

  def new
    @article = Article.new
  end

  def show
    @comments = @article.comments
  end

  def edit; end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path(@article), notice: 'article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        @article.save_user_blog_access(params[:users_access_ids])
        format.html { redirect_to article_path(@article), notice: 'article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit!
  end
end
