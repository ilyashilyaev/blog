class ReportsController < ApplicationController

  def new
    @report = Report.new
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @report = @article.reports.new(report_params)
    @report.user = current_user
    if @report.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show


  end

  def destroy
    @article = Article.find(params[:article_id])
    @report = @article.reports.find(params[:id])
    @report.destroy
    respond_with @report
  end


  private
  def report_params
    params.require(:report).permit(:text)
  end
end
