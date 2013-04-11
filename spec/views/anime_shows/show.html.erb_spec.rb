require 'spec_helper'

describe "anime_shows/show" do
  before(:each) do
    @anime_show = assign(:anime_show, stub_model(AnimeShow))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
