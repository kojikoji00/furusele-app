require 'rails_helper'

RSpec.describe "CategoryDetails", type: :request do
  describe "GET /category_details" do
    it "works! (now write some real specs)" do
      get category_details_path
      expect(response).to have_http_status(200)
    end
  end
end
