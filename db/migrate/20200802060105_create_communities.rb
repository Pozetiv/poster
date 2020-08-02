class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :title, null: false
      t.boolean :private, default: false
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
