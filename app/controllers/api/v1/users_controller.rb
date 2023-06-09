class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token

  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    @users = User.all
    render json: @users
  end

  # GET /users/1/appointments
  def appointments
    @appointments = Appointment.includes(:doctor, :user)
      .where(user_id: current_user.id)
      .select('appointments.*, doctors.name AS doctor_name, doctors.speciality AS doctors_specialization')
    render json: { user: current_user, appointments: @appointments }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:username)
  end
end
