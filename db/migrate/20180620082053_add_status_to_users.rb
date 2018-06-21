class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :int, default: 1
  end
end
