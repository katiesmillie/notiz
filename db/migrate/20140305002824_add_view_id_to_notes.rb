class AddViewIdToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :view_id, :string
  	add_column :notes, :reply_id, :string
  end
end
