class ArticlesController < ApplicationController

  def index
    @articles = Article

    if params[:q].present?
      @articles = @articles.where("title ILIKE ?", "%#{params[:q]}%")
    end

    @articles = @articles.order(rating: :desc)                                                  #создание сортировки по рейтингу в обратную сторону
    @articles = @articles.all

    @list_ip = Article.all.group_by(&:creator_ip_address)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params.merge!({ user_id: current_user.id, creator_ip_address: request.remote_ip }))
    # @article.user = current_user
    # @article.creator_ip_address = request.remote_ip

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end


    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      respond_with do |format|
        format.json { render json: @article }
      end
    end


  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
