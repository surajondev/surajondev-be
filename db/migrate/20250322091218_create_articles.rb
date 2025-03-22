class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :markdown
      t.string :image
      t.string :slug
      t.string :tag
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
