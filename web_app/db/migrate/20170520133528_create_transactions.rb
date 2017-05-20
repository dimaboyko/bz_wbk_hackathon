class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :user_id
      t.string :integer
      t.string :contract_id
      t.string :integer
      t.integer :amount

      t.timestamps
    end
  end
end
