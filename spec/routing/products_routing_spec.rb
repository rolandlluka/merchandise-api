require "rails_helper"

RSpec.describe Api::Admin::ProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/admin/products").to route_to("api/admin/products#index")
    end

    it "routes to #show" do
      expect(get: "/api/admin/products/1").to route_to("api/admin/products#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/admin/products").to route_to("api/admin/products#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/admin/products/1").to route_to("api/admin/products#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/admin/products/1").to route_to("api/admin/products#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/admin/products/1").to route_to("api/admin/products#destroy", id: "1")
    end
  end
end
