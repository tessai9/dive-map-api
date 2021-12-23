# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])

    unprocessable_entity and return unless user&.authenticate(params[:session][:password])

    token = token(user.id)
    response.set_header('Authorization', token)

    success
  end
end
