module ApplicationHelper
  def total_amount(transactions)
    transactions.sum(:amount)
  end
end
