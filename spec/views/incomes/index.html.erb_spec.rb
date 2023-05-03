require 'rails_helper'

RSpec.describe "incomes/index", type: :view do
  before(:each) do
    assign(:incomes, [
      Income.create!(
        name: "Name",
        amount: 2,
        user: nil
      ),
      Income.create!(
        name: "Name",
        amount: 2,
        user: nil
      )
    ])
  end

  it "renders a list of incomes" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
