class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.decimal :price
      t.belongs_to :cart
      t.belongs_to :book
      t.timestamps
      t.index ["book_id", "cart_id"], name: "unique_index_of_line_items", unique: true
    end
  end
end
