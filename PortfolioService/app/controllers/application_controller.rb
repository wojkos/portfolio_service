class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  protected
  def resource_not_found
  end
end
