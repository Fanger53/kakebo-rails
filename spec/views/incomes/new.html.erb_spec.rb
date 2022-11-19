require 'rails_helper'

RSpec.describe "incomes/new", type: :view do
  before(:each) do
    assign(:income, Income.new(
      name: "MyString",
      amount: 1
    ))
  end

  it "renders new income form" do
    render

    assert_select "form[action=?][method=?]", incomes_path, "post" do

      assert_select "input[name=?]", "income[name]"

      assert_select "input[name=?]", "income[amount]"
    end
  end
end
