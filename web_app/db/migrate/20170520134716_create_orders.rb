class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :total_amount
      t.integer :tip_amount

      t.timestamps
    end
  end
end
