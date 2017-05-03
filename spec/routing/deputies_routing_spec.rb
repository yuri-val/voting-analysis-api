require "rails_helper"

RSpec.describe DeputiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/deputies").to route_to("api/v1/deputies#index")
    end

    it "routes to #show" do
      expect(:get => "v1/deputies/1").to route_to("api/v1/deputies#show", :id => "1")
    end

  end
end
