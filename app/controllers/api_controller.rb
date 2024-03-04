class ApiController < ApplicationController
    before_action :http_authenticate
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    private
    def http_authenticate
      authenticate_or_request_with_http_basic do |email, password|
        user = User.find_by(email: email)
        user && user.valid_password?(password)
      end
    end
    def record_not_found
      render json: { error: 'Record not found' }, status: :not_found
    end
  end