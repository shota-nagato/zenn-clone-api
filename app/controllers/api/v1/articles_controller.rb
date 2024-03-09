class Api::V1::ArticlesController < Api::V1::BaseController
  def index
    pagy, articles = pagy(Article.published.order(created_at: :desc))
    render json: articles
  end

  def show
    article = Article.published.find(params[:id])
    render json: article
  end
end
