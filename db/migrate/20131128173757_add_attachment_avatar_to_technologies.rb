class AddAttachmentAvatarToTechnologies < ActiveRecord::Migration
  def self.up
    change_table :technologies do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :technologies, :avatar
  end
end
