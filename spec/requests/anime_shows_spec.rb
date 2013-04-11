require 'spec_helper'

describe "AnimeShows" do
  describe "GET /anime_shows" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get anime_shows_path
      response.status.should be(200)
    end
  end
end
