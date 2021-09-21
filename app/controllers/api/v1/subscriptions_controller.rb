class Api::V1::SubscriptionsController < ApplicationController
  def create
    c = Customer.find(params[:customer_id])
    subscriptions = c.subscriptions
    render json: SubscriptionSerializer.new(subscriptions).serialized_json, status: :ok
  end
end
