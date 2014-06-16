class AddGeneratedFlag < ActiveRecord::Migration
  def change
    add_column :links, :generated_custom, :boolean
  end
end
