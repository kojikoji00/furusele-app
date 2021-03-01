require 'rails_helper'

RSpec.describe "HistoryDetails", type: :request do
  describe "GET /history_details" do
    it "works! (now write some real specs)" do
      get history_details_path
      expect(response).to have_http_status(200)
    end
  end
end
