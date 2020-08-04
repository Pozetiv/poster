class CreateSubscribes < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribes do |t|
      t.boolean :approve, default: true
      t.references :user, index: true, foreign_key: true
      t.references :subscible, polymorphic: true, index: true
 
      t.timestamps
    end

    add_index :posts, :community_id
  end
end
