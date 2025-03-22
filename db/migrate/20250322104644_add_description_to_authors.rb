class AddDescriptionToAuthors < ActiveRecord::Migration[8.0]
  def change
    add_column :authors, :description, :text
  end
end
