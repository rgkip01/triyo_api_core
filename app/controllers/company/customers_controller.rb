class Company::CustomersController < ApplicationController
  before_action :authorize_access_request!,
   only: [:index, :create, :details, :destroy]
  before_action :set_customer,
   only: [:details, :update, :destroy]

  def index
    @customers = Customer.all.order(created_at: :desc)

    if @customers
      render json: @customers, status: :ok
    else
      render json: [], status: :ok
    end
  end

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

  def details
    render json: @customer ||= {}, status: :ok
  end

  def update
    if @customer
      @customer.update!(customer_params)

      render json: {
        message: "Atualizado com sucesso!"
      }, 
      status: :ok
    else
      render json: {
        message: "Cliente não atualizado!"
      }, 
      status: :unprocessable_entity
    end
  end
  
  def destroy
    if @customer
      @customer.destroy! 
  
      render json: {
        message: "Excluído com sucesso!"
      },
      status: :ok
    else
      render json: {
        message: "Não encontrado!"
      },
      status: :ok
    end
  end

  private
  
  def check_customer
    Customer.document_exists?(customer_params[:document])
  end

  def set_customer
    @customer = Customer.find_by(id: params[:id])
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
