class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :url
      t.text   :introduction
      t.text   :services
      t.timestamps
    end
  end
end
