class ChangeTagToArrayInArticles < ActiveRecord::Migration[7.0]
  def change
    # Use USING to explicitly cast the existing data to an array
    change_column :articles, :tag, :string, array: true, default: [], using: "(string_to_array(tag, ','))"
  end
end