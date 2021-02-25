class AddFieldsToTransfers < ActiveRecord::Migration[6.1]
  def change
    add_reference :transfers, :group, foreign_key: true
  end
end
