require 'spec_helper'

describe "anime_shows/edit" do
  before(:each) do
    @anime_show = assign(:anime_show, stub_model(AnimeShow))
  end

  it "renders the edit anime_show form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", anime_show_path(@anime_show), "post" do
    end
  end
end
