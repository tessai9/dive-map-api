class UsersController < ApplicationController
  before_action :set_user, only: %i[show update delete]

  # GET /users/{:userId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /user
  def create
    @user = User.new(user_params)

    @user.save
    render formats: :json, handlers: :jbuilder, template: 'shared/result'
  end

  # PATCH /users/{userId}
  def update
    @user.update(user_params)
    success
  end

  # Delete /users/{userId}
  def delete
    @user.destroy
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
