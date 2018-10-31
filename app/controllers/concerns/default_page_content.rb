module DefaultPageContent
  extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Portfolio | Wojtek Kostański"
    @seo_keywords = 'Wojtek Kostanski Ruby on Rails portfolio'
  end
end
