class AddRecipientEmailToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :recipient_email, :string
  end
end
