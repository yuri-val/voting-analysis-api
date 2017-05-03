require 'rails_helper'

RSpec.describe "VotingTables", type: :request do
  describe "GET /v1/voting_tables" do
    it "works! (now write some real specs)" do
      get v1_voting_tables_path
      expect(response).to have_http_status(200)
    end
  end
end
