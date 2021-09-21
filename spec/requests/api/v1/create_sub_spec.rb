require "rails_helper"

RSpec.describe "An endpoint to subscribe a customer to a tea subscription" do
  before :each do
    Customer.destroy_all
    Tea.destroy_all
  end
  describe "Happy path" do
    it "a customer can successfully create a tea subscription" do
      customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")
      tea = Tea.create(title: "Peppermint", description: "description", temperature: 80, brew_time: 2)
      post "/api/v1/customers/#{customer.id}/subscriptions", params: {
        title: "Bob's Peppermint Subscription",
        price: 12.00,
        status: "active",
        frequency: "weekly",
        customer_id: customer.id,
        tea_id: tea.id
      }
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data][:type]).to eq("subscription")
      expect(body[:data][:attributes]).to be_a(Hash)
      expect(body[:data][:attributes]).to have_key(:id)
      expect(body[:data][:attributes][:id]).to be_a(Integer)
      expect(body[:data][:attributes]).to have_key(:title)
      expect(body[:data][:attributes][:title]).to be_a(String)
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

    it "a customer can successfully create a tea subscription without a status" do
      customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")
      tea = Tea.create(title: "Peppermint", description: "description", temperature: 80, brew_time: 2)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: {
        title: "Bob's Peppermint Subscription",
        price: 12.00,
        frequency: 1,
        customer_id: customer.id,
        tea_id: tea.id
      }
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data][:type]).to eq("subscription")
      expect(body[:data][:attributes]).to be_a(Hash)
      expect(body[:data][:attributes]).to have_key(:id)
      expect(body[:data][:attributes][:id]).to be_a(Integer)
      expect(body[:data][:attributes]).to have_key(:title)
      expect(body[:data][:attributes][:title]).to be_a(String)
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

  describe "Sad Paths" do
    it "a customer cannot create a tea subscription without required attributes" do
      customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")
      tea = Tea.create(title: "Peppermint", description: "description", temperature: 80, brew_time: 2)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: {
        title: "Bob's Peppermint Subscription",
        #no price
        status: "active",
        frequency: "weekly",
        customer_id: customer.id,
        tea_id: tea.id
      }
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(body[:error]).to eq("More information needed")
    end

    it "a customer cannot create a tea subscription without a tea" do
      customer = Customer.create(first_name: "Bob", last_name: "test", email: "test@test.com", address: "12345 Main select Street Denver, CO 80014")

      post "/api/v1/customers/#{customer.id}/subscriptions", params: {
        title: "Bob's Peppermint Subscription",
        price: 12.00,
        status: "active",
        frequency: "weekly",
        customer_id: customer.id,
        tea_id: ""
      }
      body = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(body[:error]).to eq("More information needed")
    end
  end
end
