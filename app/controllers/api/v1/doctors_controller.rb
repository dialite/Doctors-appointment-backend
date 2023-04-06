class DoctorsController < ApplicationController
  before_action :authorize_request, only: %i[create, update, destroy]
  before_action :set_doctor, only: %i[ show edit update destroy ]

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
  def edit
  end

  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.json { render :show, status: :created, location: @doctor }
      else
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:name, :specialty, :photo)
    end
end
