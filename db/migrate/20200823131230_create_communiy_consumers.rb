class CreateCommuniyConsumers < ActiveRecord::Migration[5.2]
  def change
    create_table :communiy_consumers do |t|
      t.references :user, index: true
      t.references :community
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
