class Note < ActiveRecord::Base
	validates_presence_of :body, :recipient_email, :days
end
