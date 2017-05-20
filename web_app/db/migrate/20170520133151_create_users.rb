class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :available_amount, default: 500
      t.string :integer

      t.timestamps
    end
  end
end
