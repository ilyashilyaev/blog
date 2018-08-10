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

      redirect_to articles_path
    end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end