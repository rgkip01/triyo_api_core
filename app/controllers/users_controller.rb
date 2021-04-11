class UsersController < ApplicationController
  def create
    begin
      if user_params.present?
        @user = User.new(user_params) 
        if @user.save!
          session[:user_id] = @user.id
          render json: @user, status: :created
        end
      end  
    rescue => exception
      render json: {error: exception }, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
