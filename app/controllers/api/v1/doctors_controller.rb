class Api::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[show edit update destroy]
  # before_action :authorize_request, only: %i[create update destroy]
  # Skip CSRF protection for all actions in this controller
  skip_before_action :verify_authenticity_token

  # GET /doctors.json
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  # GET /doctors/1.json
  def show
    render json: @doctor
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit; end

  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

   # PATCH/PUT /doctors/1.json
  def update
    if @doctor.update(doctor_params)
      render json: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy

    # respond_to do |format|
    #   format.json { head :no_content }
    # end
    render json: Doctor.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def doctor_params
    params.require(:doctor).permit(:name, :lastname, :speciality, :image, :experience, :consultation)
  end
end
