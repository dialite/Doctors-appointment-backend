class Api::V1::AppointmentsController < ApplicationController
  before_action :authorize_request, only: %i[create update destroy]
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments.json
  def index
    @appointments = Doctor.find(params[:doctor_id]).appointments.all
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
    @appointment = @current_user.appointments.new(appointment_params)

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
    params.fetch(:appointment).permit(:city, :doctor_id, :datetime)
  end
end
