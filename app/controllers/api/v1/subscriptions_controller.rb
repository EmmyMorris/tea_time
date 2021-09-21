class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: 201
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(customer_params)
    subscription.status = "active"
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: "More information needed" }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.status = "cancelled"
    subscription.save
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  private

  def customer_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end
