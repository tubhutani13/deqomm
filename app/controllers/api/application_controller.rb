module Api
  class ApplicationController < ActionController::API
    include Api::SessionsHelper
    before_action :authorize_request

    private

    def authorize_request
      return if current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
