class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.decimal :price
      t.references :user
      t.timestamps
    end
  end
end
