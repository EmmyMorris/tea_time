class Api::V1::SubscriptionsController < ApplicationController
  def create
    c = Customer.find(params[:customer_id])
    subscription = c.subscriptions.new(customer_params)

    if subscription.save
      render json: SubscriptionSerializer.new(subscriptions), status: 201
    else
      render json: { error: "More information needed" }, status: 422
    end
  end

  private

  def customer_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end
