require 'rails_helper'

RSpec.describe "skiresorts/new", type: :view do
  before(:each) do
    assign(:skiresort, Skiresort.new(
      name: "MyString",
      ancestry: "MyString",
      address: "MyString",
      latitude: 1.5,
      longitude: 1.5
    ))
  end

  it "renders new skiresort form" do
    render

    assert_select "form[action=?][method=?]", skiresorts_path, "post" do

      assert_select "input[name=?]", "skiresort[name]"

      assert_select "input[name=?]", "skiresort[ancestry]"

      assert_select "input[name=?]", "skiresort[address]"

      assert_select "input[name=?]", "skiresort[latitude]"

      assert_select "input[name=?]", "skiresort[longitude]"
    end
  end
end
