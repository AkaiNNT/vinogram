class AddSlugToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :slug, :string
  end
end
