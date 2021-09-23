class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: 201
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.new(
                                              title: params[:title],
                                              price: params[:price],
                                              status: params[:status].to_i,
                                              frequency: params[:frequency].to_i,
                                              customer_id: params[:customer_id],
                                              tea_id: params[:tea_id]
                                            )

    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: "More information needed" }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.status = 1
    subscription.save
    render json: SubscriptionSerializer.new(subscription), status: 201
  end
end
