module Paginationable
  extend ActiveSupport::Concern

  LIMIT = 20

  included do
    include Pagy::Backend
  end

  def meta(pagy)
    pagy_metadata = pagy_metadata(pagy)
    {
      current_page: pagy_metadata[:page],
      total_pages: pagy_metadata[:pages]
    }
  end
end
