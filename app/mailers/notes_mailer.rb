class NotesMailer < ActionMailer::Base

  def notes_email(recipient_email, sender_email, message, days)
    @recipient_email = recipient_email
    @sender_email = sender_email
    @message = message
    @days = days
    mail(:to => recipient_email, :from => sender_email, :subject => "You receieved a note from the past")
  end

end
