class Note < ActiveRecord::Base
	validates_presence_of :body, :recipient_email, :days
	before_create :calculate_send_date

def calculate_send_date
	self.send_date = DateTime.now + self.days.days
end

def self.mail_notes
	Note.all.each do |n|
		if n.send_date == Date.today
			NotesMailer.notes_email(n.recipient_email, n.sender_email, n.body, n.days).deliver
		else
		end
	end
end


end
