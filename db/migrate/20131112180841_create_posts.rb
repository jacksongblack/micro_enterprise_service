class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text  :description
      t.text :content
      t.string :from
      t.string :url
      t.string :logo
      t.belongs_to :user
      t.belongs_to :domain
      t.belongs_to :industry
      t.timestamps
    end
  end
end
