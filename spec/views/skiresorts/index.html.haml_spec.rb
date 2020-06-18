require 'rails_helper'

RSpec.describe "skiresorts/index", type: :view do
  before(:each) do
    assign(:skiresorts, [
      Skiresort.create!(
        name: "Name",
        ancestry: "Ancestry",
        address: "Address",
        latitude: 2.5,
        longitude: 3.5
      ),
      Skiresort.create!(
        name: "Name",
        ancestry: "Ancestry",
        address: "Address",
        latitude: 2.5,
        longitude: 3.5
      )
    ])
  end

  it "renders a list of skiresorts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Ancestry".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
  end
end
