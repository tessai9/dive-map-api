class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      token = token(user.id)
      response.set_header('Authorization', token)
    else
      unprocessable_entity and return
    end

    # return success response
    success
  end
end
