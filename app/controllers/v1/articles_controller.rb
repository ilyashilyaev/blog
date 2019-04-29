class V1::ArticlesController < ApplicationController

  before_action :set_resource, only: %i[show edit update destroy]

  def index
    @articles = policy_scope(Article)

    if params[:q].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:q]}%")
    end

    @articles = @articles.order(id: :desc)                                                  #создание сортировки по рейтингу в обратную сторону
    @articles = @articles.page(params[:page])

    @list_ip = policy_scope(Article).group_by(&:creator_ip_address)
    render json: @article
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
    render json: @article
  end

  def new
    @article = Article.new
    render json: @article
  end

  def edit
    authorize @article
    render json: @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.creator_ip_address = request.remote_ip
    if @tag.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @article

    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end


  def destroy
    authorize @article
    @article = Article.find(params[:id])
    @article.destroy
  end

  def add_to_favorites
    @article = Article.find(params[:id])
    @favorite = @article.favorites.new({user: current_user})
    if @favorite.save
      respond_with do |format|
        format.json { render json: @article }
      end
    else
      render json: "false"

    end
  end

  def delete_to_favorites
    @article = Article.find(params[:id])
    @favorite = @article.favorites.find_by(user: current_user)
    @favorite.destroy
    respond_with do |format|
      format.json { render json: @article }
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :text, :attachment)
  end

  def set_resource
    @article = Article.find(params[:id])
  end

end
