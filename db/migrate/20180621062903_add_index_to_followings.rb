class AddIndexToFollowings < ActiveRecord::Migration[5.2]
  def change
    change_table :followings do |f|
      f.index [:following_id,:follower_id] , unique: true
    end
  end
end
