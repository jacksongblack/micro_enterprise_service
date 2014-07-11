class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :description 
      t.belongs_to :industry
      t.belongs_to :enterprise
      t.timestamps
    end
  end
end
