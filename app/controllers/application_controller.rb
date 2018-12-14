class ApplicationController < ActionController::API
  before_action :authorize

  def encode_token(payload)
    JWT.encode(payload, ENV["decode_key"])
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV["decode_key"], algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def active_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!active_user
  end

  def authorize
    render json: {errors: ['Please log in.']}, status: :unauthorized unless logged_in?
  end

  def get_image_url
    -> (image) do
      begin
        url_for(image)
      rescue Module::DelegationError
        ""
      end
    end
  end

end
