class Note < ActiveRecord::Base
	validates_presence_of :body, :recipient_email, :days
	validate :email_does_not_belong_to_user
	before_create :calculate_send_date
	before_create :generate_unique_ids


	belongs_to :user

def calculate_send_date
	self.send_date = DateTime.now + self.days.days
end

def generate_unique_ids
	self.reply_id = Digest::SHA256.hexdigest(body + recipient_email + sender_email + Time.now.to_s)	
	self.view_id = Digest::SHA256.hexdigest(body + recipient_email + sender_email + days.to_s + Time.now.to_s)
end


def self.mail_notes
	Note.all.each do |n|
		if n.send_date == Date.today
			NotesMailer.notes_email(n.recipient_email, n.sender_email, n.body, n.days, n.view_id).deliver
		else
		end
	end
end


def self.attach_notes_to_users

	# For each note, find notes without user_id
	Note.all.each do |note|
		if !note.user
			user = User.where(:email => note.sender_email).first
			note.user = user
			note.save
		end
	end
end

def email_does_not_belong_to_user
	if User.where(:email => sender_email)
	  self.errors[:sender_email] = "Sender email already exists"
	end
end

end
