class NotesMailer < ActionMailer::Base
	default :from => "hello@dearfuture.me"

  def notes_email(recipient_email, sender_email, message, days, view_id)
    @recipient_email = recipient_email
    @sender_email = sender_email
    @message = message
    @days = days
    @view_id = view_id
    mail(:to => recipient_email, :subject => "Someone sent you a note from the past")
  end

end
