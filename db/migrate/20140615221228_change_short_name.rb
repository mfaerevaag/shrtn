class ChangeShortName < ActiveRecord::Migration
  def change
    rename_column :links, :short, :custom
  end
end
