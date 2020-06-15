require "rails_helper"

RSpec.describe SkiresortsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/skiresorts").to route_to("skiresorts#index")
    end

    it "routes to #new" do
      expect(get: "/skiresorts/new").to route_to("skiresorts#new")
    end

    it "routes to #show" do
      expect(get: "/skiresorts/1").to route_to("skiresorts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/skiresorts/1/edit").to route_to("skiresorts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/skiresorts").to route_to("skiresorts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/skiresorts/1").to route_to("skiresorts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/skiresorts/1").to route_to("skiresorts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/skiresorts/1").to route_to("skiresorts#destroy", id: "1")
    end
  end
end
