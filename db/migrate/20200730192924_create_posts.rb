class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :describe

      t.timestamps
    end
  end
end
