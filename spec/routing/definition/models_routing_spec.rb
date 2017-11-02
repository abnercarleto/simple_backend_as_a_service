require "rails_helper"

RSpec.describe Definition::ModelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/definition/models").to route_to("definition/models#index")
    end


    it "routes to #show" do
      expect(:get => "/definition/models/1").to route_to("definition/models#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/definition/models").to route_to("definition/models#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/definition/models/1").to route_to("definition/models#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/definition/models/1").to route_to("definition/models#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/definition/models/1").to route_to("definition/models#destroy", :id => "1")
    end

  end
end
