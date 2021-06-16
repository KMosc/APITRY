class PaymentHistory < ApplicationController
    skip_before_action :doorkeeper_authorize!, only: %i[index show]
    def index
        payments = PaymentHistory.where(email: params[:password])
        render json: payments, except: [:created_at, :updated_at]
    end
  
    def show
    end 
end