# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users/{userId}
  def show
    render formats: :json, handlers: :jbuilder
  end

  # POST /user
  def create
    User.create!(permitted_attributes(User))
    success
  end

  # PATCH /users/{userId}
  def update
    @user.update!(permitted_attributes(User))
    success
  end

  # DELETE /users/{userId}
  def destroy
    @user.destroy!
    success
  end

  private

  def set_user
    @user = policy_scope(User).find(params[:id])
  end
end
