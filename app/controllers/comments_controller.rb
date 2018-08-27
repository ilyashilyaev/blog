class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params.merge!({user: current_user}))
    if @repost.save
    else
      render 'reports/new'
    end
    # respond_with @comment
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    respond_with @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
