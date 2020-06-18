require 'rails_helper'

RSpec.describe "skiresorts/edit", type: :view do
  before(:each) do
    @skiresort = assign(:skiresort, Skiresort.create!(
      name: "MyString",
      ancestry: "MyString",
      address: "MyString",
      latitude: 1.5,
      longitude: 1.5
    ))
  end

  it "renders the edit skiresort form" do
    render

    assert_select "form[action=?][method=?]", skiresort_path(@skiresort), "post" do

      assert_select "input[name=?]", "skiresort[name]"

      assert_select "input[name=?]", "skiresort[ancestry]"

      assert_select "input[name=?]", "skiresort[address]"

      assert_select "input[name=?]", "skiresort[latitude]"

      assert_select "input[name=?]", "skiresort[longitude]"
    end
  end
end
