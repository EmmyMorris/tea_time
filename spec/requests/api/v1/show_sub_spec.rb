require "rails_helper"

RSpec.describe "an endpoint to see all of a customer’s subsciptions (active and cancelled)" do
  before :each do
    Customer.destroy_all
    Tea.destroy_all
    Subscription.destroy_all
    @customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")
    @tea = Tea.create(title: "Peppermint", description: "description", temperature: 80, brew_time: 2)
    @subscription_1 = Subscription.create(title: "Bob's Peppermint Subscription", price: 12.00, status: "active", frequency: "weekly", customer_id: @customer.id, tea_id: @tea.id)
    @subscription_2 = Subscription.create(title: "Bob's Peppermint Subscription", price: 12.00, status: "cancelled", frequency: "weekly", customer_id: @customer.id, tea_id: @tea.id)
  end
  describe "Happy Path" do
    it "can sucessfully see all of a customer’s subsciptions" do
      get "/api/v1/customers/#{@customer.id}/subscriptions"

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data][:type]).to eq("subscription")
      expect(body[:data][:attributes]).to be_a(Hash)
      expect(body[:data][:attributes]).to have_key(:id)
      expect(body[:data][:attributes][:id]).to be_a(Integer)
      expect(body[:data][:attributes]).to have_key(:title)
      expect(body[:data][:attributes][:title]).to be_a(String)
      expect(body[:data][:attributes][:title]).to eq("Bob's Peppermint Subscription")
      expect(body[:data][:attributes]).to have_key(:price)
      expect(body[:data][:attributes][:price]).to be_a(Float)
      expect(body[:data][:attributes]).to have_key(:status)
      expect(body[:data][:attributes][:status]).to be_a(String)
      expect(body[:data][:attributes]).to have_key(:frequency)
      expect(body[:data][:attributes][:frequency]).to be_a(String)
      expect(body[:data][:attributes]).to have_key(:customer_id)
      expect(body[:data][:attributes][:customer_id]).to be_a(Integer)
      expect(body[:data][:attributes]).to have_key(:tea_id)
      expect(body[:data][:attributes][:tea_id]).to be_a(Integer)
    end
  end

  describe "Sad Path" do
    it "Cannot get subscriptions if user doesnt have any" do
      @customer_2 = Customer.create(first_name: "Rob", last_name: "test", email: "test_2@test.com", address: "12345 Main select Street Denver, CO 80014")

      get "/api/v1/customers/#{@customer.id}/subscriptions"
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Hash)
    end
  end
end
