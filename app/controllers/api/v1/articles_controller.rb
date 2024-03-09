class Api::V1::ArticlesController < Api::V1::BaseController
  def index
    articles = Article.published.preload(:user).order(created_at: :desc)
    render json: pagination(articles)
  end

  def show
    article = Article.published.find(params[:id])
    render json: article
  end
end
