class Company::CustomersController < ApplicationController
  before_action :authorize_access_request!, only: :create

  def create
    begin
      customer = check_customer
      
      unless customer.present? 
        @customer = Customer.new(customer_params)
        
        if @customer.save!
          render json: @customer, status: :created
        end
      else 
        render json: {message: "Cliente já existe"}, status: :unprocessable_entity
      end
    rescue => exception
      render json: {error: exception }, status: :unprocessable_entity
    end
  end
  
  private
  
  def check_customer
    Customer.document_exists?(customer_params[:document])
  end
  
  def customer_params
    params.require(:customer)
      .permit(
        :customer_name,
        :document,
        :customer_type,
        :email,
        :phone
      )
  end
end
