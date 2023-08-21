module Api
  module SessionsHelper
    def current_user
      return @current_user if @current_user

      header = request.headers['Authorization']
      token = header.split(' ').last if header
      begin
        decoded_token = JWT.decode(token, ENV.fetch('JWT_SECRET_KEY'), true, algorithm: 'HS256')
        @current_user = User.find(decoded_token[0]['user_id'])
      rescue JWT::DecodeError
        nil
      end
    end
  end
end
