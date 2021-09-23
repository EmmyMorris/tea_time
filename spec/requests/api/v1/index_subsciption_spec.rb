require "rails_helper"

RSpec.describe "an endpoint to see all of a customer’s subsciptions (active and cancelled)" do
  before :each do
    Customer.destroy_all
    Tea.destroy_all
    Subscription.destroy_all
    @customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")
    @customer_2 = Customer.create(first_name: "Rob", last_name: "test", email: "test_2@test.com", address: "12345 Main select Street Denver, CO 80014")
    @tea_1 = Tea.create(title: "Peppermint", description: "description", temperature: 80, brew_time: 2)
    @tea_2 = Tea.create(title: "Black", description: "description", temperature: 90, brew_time: 4)
    @subscription_1 = Subscription.create(title: "Bob's Peppermint Subscription", price: 12.00, status: 0, frequency: 1, customer_id: @customer.id, tea_id: @tea_1.id)
    @subscription_2 = Subscription.create(title: "Rob's Peppermint Subscription", price: 12.00, status: 1, frequency: 3, customer_id: @customer.id, tea_id: @tea_2.id)
  end

  describe "Happy Path" do
    it "can sucessfully see all of a customer’s subsciptions" do
      get "/api/v1/customers/#{@customer.id}/subscriptions"
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Array)
      expect(body[:data][0][:type]).to eq("subscription")
      expect(body[:data][0][:attributes]).to be_a(Hash)
      expect(body[:data][0][:attributes]).to have_key(:id)
      expect(body[:data][0][:attributes][:id]).to be_a(Integer)
      expect(body[:data][0][:attributes]).to have_key(:title)
      expect(body[:data][0][:attributes][:title]).to be_a(String)
      expect(body[:data][0][:attributes][:title]).to eq("Bob's Peppermint Subscription")
      expect(body[:data][0][:attributes]).to have_key(:price)
      expect(body[:data][0][:attributes][:price]).to be_a(Float)
      expect(body[:data][0][:attributes]).to have_key(:status)
      expect(body[:data][0][:attributes][:status]).to be_a(String)
      expect(body[:data][0][:attributes][:status]).to eq("active")

      expect(body[:data][1][:type]).to eq("subscription")
      expect(body[:data][1][:attributes]).to be_a(Hash)
      expect(body[:data][1][:attributes]).to have_key(:id)
      expect(body[:data][1][:attributes][:id]).to be_a(Integer)
      expect(body[:data][1][:attributes]).to have_key(:title)
      expect(body[:data][1][:attributes][:title]).to be_a(String)
      expect(body[:data][1][:attributes][:title]).to eq("Rob's Peppermint Subscription")
      expect(body[:data][1][:attributes]).to have_key(:price)
      expect(body[:data][1][:attributes][:price]).to be_a(Float)
      expect(body[:data][1][:attributes]).to have_key(:status)
      expect(body[:data][1][:attributes][:status]).to be_a(String)
      expect(body[:data][1][:attributes][:status]).to eq("cancelled")
    end
  end

  describe "Sad Path" do
    it "Cannot get subscriptions if user doesnt have any" do
      get "/api/v1/customers/#{@customer_2.id}/subscriptions"
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Array)
      expect(body[:data].count).to eq(0)
    end
  end
end
