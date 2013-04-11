require 'spec_helper'

describe "anime_shows/new" do
  before(:each) do
    assign(:anime_show, stub_model(AnimeShow).as_new_record)
  end

  it "renders new anime_show form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", anime_shows_path, "post" do
    end
  end
end
