class RemoveMaterialFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :material, :string
  end
end
