class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]
  # before_action :authorize_request, only: %i[create update destroy]
  # Skip CSRF protection for all actions in this controller
  skip_before_action :verify_authenticity_token

  # GET /appointments.json
  def index
    @appointments = Appointments.all
    render json: @appointments, status: ok
  end

  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment, status: ok
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit; end

  # POST or /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1.json
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1.json
  def destroy
    @current_user.appointments.destroy(params[:id])
    render json: @current_user.appointments.all, status: ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:city, :doctor_id, :datetime, :user_id)
  end
end
