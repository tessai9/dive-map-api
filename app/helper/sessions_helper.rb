# frozen_string_literal: true

module SessionsHelper
  def logged_in?
    current_user.present?
  end

  def current_user
    token = request.headers['Authorization'].gsub!('Bearer ', '')
    decoded_json = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
    payload = decoded_json.first
    User.find(payload['user_id'])
  end

  def token(user_id)
    # JWT payload
    # {
    #   user_id,
    #   exp,
    #   iss, # 検討中...
    #   sub  # 検討中...
    # }
    payload = {
      user_id: user_id,
      exp: 2.hours.after.to_i
    }
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def hmac_secret
    ENV['JWT_SECRET']
  end
end
