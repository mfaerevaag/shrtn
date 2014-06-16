class RemoveCustomUniqueIndex < ActiveRecord::Migration
  def change
    remove_index :links, :name => 'index_links_on_custom'
  end
end
