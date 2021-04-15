class Customers::OrderOfServicesController < ApplicationController
  before_action :authorize_access_request!
  before_action :fetch_user, only: [:create]

  def create 
    begin
      if @user.present?
        @order_of_service = OrderOfService.new(order_params)
        @order_of_service.os_number = SecureRandom.hex(5)
        @order_of_service.user_id = @user.id
  
        if @order_of_service.save!
          render json: @order_of_service, status: :ok
        end
      else
        render json: {message: "não autorizado"}, status: :unprocessable_entity
      end
    rescue => exception
      render json: {error: exception }, status: :unprocessable_entity
    end
  end

  private

  def fetch_user
    @user = User.find_by(id: payload['user_id'])
  end

  def order_params
    params.require(
      :order_of_service
    )
    .permit(
      :reason_called,
      :message,
      :place_of_performance,
      :start_date_os,
      :end_date_os,
      :customer_id
    )
  end
end
