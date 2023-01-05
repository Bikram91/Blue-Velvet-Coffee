class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :product_type
      t.text :description, null: false
      t.float :price, null: false
      t.string :product_size
      t.timestamps
    end
    add_index :products, :name
    
  end
end
