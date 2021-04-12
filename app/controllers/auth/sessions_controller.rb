class Auth::SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  before_action :authorize_refresh_request!, only: [:destroy_by_refresh]
  
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


  def destroy
    session = JWTSessions::Session.new(
      payload: payload,
      refresh_by_access_allowed: true
    )
    session.flush_by_access_payload
    render json: :ok
  end

  def destroy_by_refresh
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_token(found_token)
    render json: :ok
  end
end
