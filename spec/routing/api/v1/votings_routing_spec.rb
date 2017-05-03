require "rails_helper"

RSpec.describe Api::V1::VotingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/votings").to route_to("api/v1/votings#index")
    end

    it "routes to #show" do
      expect(:get => "v1/votings/1").to route_to("api/v1/votings#show", :id => "1")
    end

  end
end
