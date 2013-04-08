require 'spec_helper'

describe "episodes/edit" do
  before(:each) do
    @episode = assign(:episode, stub_model(Episode,
      :show => nil,
      :name => "MyString",
      :url => "MyText",
      :number => 1
    ))
  end

  it "renders the edit episode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", episode_path(@episode), "post" do
      assert_select "input#episode_show[name=?]", "episode[show]"
      assert_select "input#episode_name[name=?]", "episode[name]"
      assert_select "textarea#episode_url[name=?]", "episode[url]"
      assert_select "input#episode_number[name=?]", "episode[number]"
    end
  end
end
