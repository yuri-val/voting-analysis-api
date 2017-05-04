require "rails_helper"

RSpec.describe Api::V1::VotingRowsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/voting_rows").to route_to("api/v1/voting_rows#index")
    end

    it "routes to #show" do
      expect(:get => "v1/voting_rows/1").to route_to("api/v1/voting_rows#show", :id => "1")
    end

  end
end
