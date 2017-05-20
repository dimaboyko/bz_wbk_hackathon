class AddNameToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :name, :string
  end
end
