class RatingsController < ApplicationController

  def new
    @rating = Rating.new
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])                              #http://localhost:3000/articles/1/ratings/new
    @rating = Rating.new(rating_params)
    @rating.ratingable = @article
    @rating.user = current_user
    if @rating.save
    # делаю вывод среднее арифметического рейтинга

      avg = @article.ratings.average(:mark).round
      @article.update_columns(rating: avg)

      redirect_to articles_path
      else
      render 'new'
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:mark)
  end
end
