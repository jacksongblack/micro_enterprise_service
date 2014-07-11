class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :url
      t.text   :description
      t.belongs_to :industry
      t.timestamps
    end
  end
end
