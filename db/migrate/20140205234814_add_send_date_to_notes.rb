class AddSendDateToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :send_date, :date
  end
end
