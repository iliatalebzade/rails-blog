class AddIsEditedToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :is_edited, :boolean
  end
end
