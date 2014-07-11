class AddAttachmentAvatarToEnterprises < ActiveRecord::Migration
  def self.up
    change_table :enterprises do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :enterprises, :avatar
  end
end
