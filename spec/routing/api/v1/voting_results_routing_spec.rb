require "rails_helper"

RSpec.describe Api::V1::VotingResultsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/voting_results").to route_to("api/v1/voting_results#index")
    end

    it "routes to #show" do
      expect(:get => "v1/voting_results/1").to route_to("api/v1/voting_results#show", :id => "1")
    end

  end
end
