require 'rails_helper'

RSpec.describe "Deputies", type: :request do
  describe "GET /deputies" do
    it "works! (now write some real specs)" do
      get deputies_path
      expect(response).to have_http_status(200)
    end
  end
end
