require "rails_helper"

RSpec.describe "An endpoint to cancel a customer’s tea subscription" do
  before :each do
    Customer.destroy_all
    Tea.destroy_all
    Subscription.destroy_all
    @customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")
    @tea = Tea.create(title: "Peppermint", description: "description", temperature: 80, brew_time: 2)
    @subscription = Subscription.create(title: "Bob's Peppermint Subscription", price: 12.00, status: "active", frequency: "weekly", customer_id: @customer.id, tea_id: @tea.id)
  end

  describe "Happy Paths" do
    it "can sucessfully cancel a customer’s tea subscription" do
      patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}"
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data][:type]).to eq("subscription")
      expect(body[:data][:attributes]).to have_key(:status)
      expect(body[:data][:attributes][:status]).to be_a(String)
      expect(body[:data][:attributes][:status]).to eq("cancelled")
      expect(body[:data][:attributes][:status]).not_to eq("active")
    end
  end
end
