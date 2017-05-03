require "rails_helper"

RSpec.describe Api::V1::VotingSummariesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/voting_summaries").to route_to("api/v1/voting_summaries#index")
    end

    it "routes to #show" do
      expect(:get => "v1/voting_summaries/1").to route_to("api/v1/voting_summaries#show", :id => "1")
    end
  end
end
