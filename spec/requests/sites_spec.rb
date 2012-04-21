require 'spec_helper'

describe "Sites" do
  describe "GET /sites" do
    it "works! (now write some real specs)" do
      get sites_path
      response.status.should be(200)
    end
  end
end
