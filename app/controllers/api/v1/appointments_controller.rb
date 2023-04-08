class Api::V1::AppointmentsController < ApplicationController
  before_action :authorize_request, only: %i[create update destroy]
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments or /appointments.json
  def index
    @appointments = Doctor.find(params[:doctor_id]).appointments.all
    render json: @appointments, status: 200
  end

  # GET /appointments/1 or /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment, status: 200
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit; end

  # POST /appointments or /appointments.json
  def create
    @appointment = @current_user.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.json { render :show, status: :created, location: @appointment }
      else
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      render json: { message: 'Appointment has been successfully deleted' }
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.fetch(:appointment).permit(:appointment_date, :appointment_time, :doctor_id,
                                      :description)
  end
end
