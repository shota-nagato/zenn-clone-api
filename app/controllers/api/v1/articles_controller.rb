class Api::V1::ArticlesController < Api::V1::BaseController
  def index
    articles = Article.published.preload(:user).order(created_at: :desc)
    pagy, items = pagy(articles, items: LIMIT)
    render json: items, meta: meta(pagy), adapter: :json
  end

  def show
    article = Article.published.find(params[:id])
    render json: article
  end
end
