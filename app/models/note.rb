class Note < ActiveRecord::Base
	validates_presence_of :body, :recipient_email, :days
	before_save :calculate_send_date

def calculate_send_date
	self.send_date = DateTime.now + self.days.days
end

def self.mail_notes
	Note.all.each do |n|
		if n.send_date == Date.now
		NotesMailer.notes_email(n.recipient_email, n.sender_email, n.days)
		else
		end
end
end


end
