require 'rails_helper'

RSpec.describe "incomes/show", type: :view do
  before(:each) do
    @income = assign(:income, Income.create!(
      name: "Name",
      amount: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
