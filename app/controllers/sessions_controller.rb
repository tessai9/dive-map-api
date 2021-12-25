# frozen_string_literal: true

class SessionsController < ApplicationController
  # POST /login
  def create
    user = User.find_by(email: params[:session][:email])

    unprocessable_entity and return unless user&.authenticate(params[:session][:password])

    @token = token(user.id)
    render formats: :json, handlers: :jbuilder
  end
end
