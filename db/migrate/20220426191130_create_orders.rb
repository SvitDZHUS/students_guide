class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :cart
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
