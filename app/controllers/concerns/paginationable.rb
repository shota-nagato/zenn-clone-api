require "pagy/extras/headers"

module Paginationable
  extend ActiveSupport::Concern

  DEFAULT_PAGINATION_LIMIT = 20
  MAX_PAGINATION_LIMIT = 200

  included do
    include Pagy::Backend
  end

  def pagination(items)
    pagy, items = pagy(items, items: limit)
    pagy_headers_merge(pagy)
    items
  end

  private

  def limit
    [
      params.fetch(:limit, DEFAULT_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end
end
