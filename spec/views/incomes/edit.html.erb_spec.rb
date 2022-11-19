require 'rails_helper'

RSpec.describe "incomes/edit", type: :view do
  before(:each) do
    @income = assign(:income, Income.create!(
      name: "MyString",
      amount: 1
    ))
  end

  it "renders the edit income form" do
    render

    assert_select "form[action=?][method=?]", income_path(@income), "post" do

      assert_select "input[name=?]", "income[name]"

      assert_select "input[name=?]", "income[amount]"
    end
  end
end
