class CreateRsses < ActiveRecord::Migration
  def change
    create_table :rsses do |t|
      t.string :sitename
      t.string :url
      t.belongs_to :domain
      t.belongs_to :industry      
      t.timestamps
    end
  end
end
