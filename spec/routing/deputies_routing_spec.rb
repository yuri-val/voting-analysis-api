require "rails_helper"

RSpec.describe DeputiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/deputies").to route_to("deputies#index")
    end

    it "routes to #new" do
      expect(:get => "/deputies/new").to route_to("deputies#new")
    end

    it "routes to #show" do
      expect(:get => "/deputies/1").to route_to("deputies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/deputies/1/edit").to route_to("deputies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/deputies").to route_to("deputies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/deputies/1").to route_to("deputies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/deputies/1").to route_to("deputies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/deputies/1").to route_to("deputies#destroy", :id => "1")
    end

  end
end
