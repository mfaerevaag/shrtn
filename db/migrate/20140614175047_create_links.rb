class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :short
      t.integer :hits
      t.datetime :last_hit_at

      t.timestamps
    end
    add_index :links, :short, unique: true
  end
end
