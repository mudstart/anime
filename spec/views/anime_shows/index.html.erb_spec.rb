require 'spec_helper'

describe "anime_shows/index" do
  before(:each) do
    assign(:anime_shows, [
      stub_model(AnimeShow),
      stub_model(AnimeShow)
    ])
  end

  it "renders a list of anime_shows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
