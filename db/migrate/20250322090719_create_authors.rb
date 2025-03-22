class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :username
      t.string :profile_pic

      t.timestamps
    end
  end
end
