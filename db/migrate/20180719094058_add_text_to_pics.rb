class AddTextToPics < ActiveRecord::Migration
  def change
    add_column :pics, :text, :text
  end
end
