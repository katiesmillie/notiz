class AddSenderEmailToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :sender_email, :string
  end
end
