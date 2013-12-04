class AddBodyToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :body, :string
  end
end
