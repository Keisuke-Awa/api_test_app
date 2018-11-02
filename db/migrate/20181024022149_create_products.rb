class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.text :comment
      t.timestamps
    end
  end
end
