class ApplicationController < ActionController::Base
  before_action :set_default_format, only: [:authorize_request]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']&.split&.last
    @decoded = JsonWebToken.decode(header) if header
    @current_user = User.find_by(id: @decoded[:user_id]) if @decoded
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end

  def set_default_format
    request.format = :json
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end
end
