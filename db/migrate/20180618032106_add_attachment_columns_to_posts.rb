class AddAttachmentColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_attachment :posts, :attachment
  end
end
