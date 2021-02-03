module TransfersHelper
  def total_amount(transactions)
    transactions.sum(:amount)
  end
end
