class Api::V1::UsersController < ApplicationController
  # GET /users.json
  def index
    render json: User.all
  end

  # GET /users/1.json
  def show
    render json: @user
  end
end
