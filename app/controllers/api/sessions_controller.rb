module Api
  class SessionsController < Api::ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      user = User.find_by(email: params[:email])
      render json: { error: 'User not found ' }, status: :unauthorized unless user
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: {user_id: user.id, token: token }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

    private

    def encode_token(payload)
      JWT.encode(payload, 'your_secret_key', 'HS256')
    end
  end
end
