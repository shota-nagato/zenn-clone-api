require "pagy/extras/headers"

module Paginationable
  extend ActiveSupport::Concern

  LIMIT = 20

  included do
    include Pagy::Backend
  end

  def pagination(items)
    pagy, items = pagy(items, items: LIMIT)
    pagy_headers_merge(pagy)
    items
  end
end
