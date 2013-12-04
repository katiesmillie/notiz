class AddDaysToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :days, :integer
  end
end
