class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.integer :owner_id
      t.integer :client_id
      t.integer :order_id
      t.string :status
      t.integer :total_amount
      t.integer :paid_amount

      t.timestamps
    end
  end
end
