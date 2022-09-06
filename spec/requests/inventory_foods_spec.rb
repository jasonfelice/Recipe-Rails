require 'rails_helper'

RSpec.describe "InventoryFoods", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/inventory_foods/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/inventory_foods/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/inventory_foods/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/inventory_foods/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/inventory_foods/create"
      expect(response).to have_http_status(:success)
    end
  end

end
