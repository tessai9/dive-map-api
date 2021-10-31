# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ResponseConcern

  rescue_from StandardError, with: :internal_server_error
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request
  rescue_from ActionController::RoutingError, with: :not_found
  rescue_from ActionView::Template::Error, with: :not_found
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
end
