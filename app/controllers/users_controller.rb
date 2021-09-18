class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users/{userId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /user
  def create
    User.create!(user_params)
    success
  end

  # PATCH /users/{userId}
  def update
    @user.update!(user_params)
    success
  end

  # DELETE /users/{userId}
  def destroy
    @user.destroy!
    success
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :role, :email, :birthday)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
