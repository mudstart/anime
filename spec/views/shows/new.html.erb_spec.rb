require 'spec_helper'

describe "anime_shows/new" do
  before(:each) do
    assign(:show, stub_model(AnimeShow,
      :url => "MyText",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new show form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", anime_shows_path, "post" do
      assert_select "textarea#show_url[name=?]", "show[url]"
      assert_select "input#show_name[name=?]", "show[name]"
    end
  end
end
