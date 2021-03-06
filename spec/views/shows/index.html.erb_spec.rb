require 'spec_helper'

describe "shows/index" do
  before(:each) do
    assign(:shows, [
      stub_model(AnimeShow,
        :url => "MyText",
        :name => "Name"
      ),
      stub_model(AnimeShow,
        :url => "MyText",
        :name => "Name"
      )
    ])
  end

  it "renders a list of shows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
