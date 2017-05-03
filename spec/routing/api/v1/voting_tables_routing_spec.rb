require "rails_helper"

RSpec.describe Api::V1::VotingTablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "v1/voting_tables").to route_to("api/v1/voting_tables#index")
    end

    it "routes to #show" do
      expect(:get => "v1/voting_tables/1").to route_to("api/v1/voting_tables#show", :id => "1")
    end

  end
end
