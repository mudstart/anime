require 'spec_helper'

describe "episodes/new" do
  before(:each) do
    assign(:episode, stub_model(Episode,
      :show => nil,
      :name => "MyString",
      :url => "MyText",
      :number => 1
    ).as_new_record)
  end

  it "renders new episode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", episodes_path, "post" do
      assert_select "input#episode_show[name=?]", "episode[show]"
      assert_select "input#episode_name[name=?]", "episode[name]"
      assert_select "textarea#episode_url[name=?]", "episode[url]"
      assert_select "input#episode_number[name=?]", "episode[number]"
    end
  end
end
