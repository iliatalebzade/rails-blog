class RemoveIsEditedFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :is_edited, :boolean
  end
end
