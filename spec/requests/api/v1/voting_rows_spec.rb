require 'rails_helper'

RSpec.describe "VotingRows", type: :request do
  describe "GET /v1/voting_rows" do
    it "works! (now write some real specs)" do
      get v1_voting_rows_path
      expect(response).to have_http_status(200)
    end
  end
end
