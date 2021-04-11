class Auth::SessionsController < ApplicationController

  def create
    user = User.find_by!(email: params[:email])

    if user.authenticate(params[:password])

      payload = { user_id: user.id }

      session = JWTSessions::Session.new(
        payload: payload,
        refresh_by_access_allowed: true
      )

      tokens = session.login
     
      response.set_cookie(
        JWTSessions.access_cookie,
        value: tokens[:access],
        httponly: true,
        secure: Rails.env.development?
        # secure: Rails.env.production?
      )

      render json: {
        logged: true,
        csrf: tokens[:csrf],
        access: tokens[:access],
        user: {
          id: user.id,
          email: user.email
        }
      }
    else
      not_authorized
    end
  end
end
