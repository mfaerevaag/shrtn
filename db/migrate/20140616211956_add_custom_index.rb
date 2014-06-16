class AddCustomIndex < ActiveRecord::Migration
  def change
    add_index :links, :custom
  end
end
