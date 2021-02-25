class Transfer < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true
  validates :amount, presence: true
  validates :user_id, presence: true
  validates :amount, numericality: { only_integer: true }
end
