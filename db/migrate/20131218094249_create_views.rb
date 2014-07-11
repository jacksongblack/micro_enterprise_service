class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.belongs_to :post
      t.belongs_to :enterprise
      t.belongs_to :product
      t.belongs_to :user
      t.belongs_to :technology
      t.timestamps
    end
  end
end
