class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.references :follower
      t.references :following
      t.integer :status
      t.timestamps
    end
  end
end
