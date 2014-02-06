class NotesMailer < ActionMailer::Base
  default from: "hello@notiz.me"

  def notes_email(recipient_email, sender_email, message, days)
    @recipient_email = recipient_email
    @sender_email = sender_email
    @message = message
    @days = days
    mail(:to => recipient_email, :subject => "You receieved a note from the past")
  end

end
