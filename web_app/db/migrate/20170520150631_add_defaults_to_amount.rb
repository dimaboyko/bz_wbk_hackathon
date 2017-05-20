class AddDefaultsToAmount < ActiveRecord::Migration[5.0]
  def reversible
    change_column :users, :available_amount, :integer, default: 0

    change_column :transactions, :amount, :integer, default: 0

    change_column :contracts, :total_amount, :integer, default: 0
    change_column :contracts, :paid_amount, :integer, default: 0

    change_column :orders, :total_amount, :integer, default: 0
    change_column :orders, :tip_amount, :integer, default: 0

    change_column :order_items, :amount, :integer, default: 0
  end
end
