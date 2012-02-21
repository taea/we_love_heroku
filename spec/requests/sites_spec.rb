require 'spec_helper'

describe "Sites" do
  describe "GET /sites" do
    it "works! (now write some real specs)" do
      get sites_path
      response.status.should be(200)
    end
  end
  
  describe "GET /sites/pickup" do
    it "works! (now write some real specs)" do
      xhr :get, pickup_sites_path
      response.status.should be(200)
    end
  end
end
