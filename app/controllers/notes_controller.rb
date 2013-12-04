class NotesController < ApplicationController

	def index
		@note=Note.create :body => params[:body], :recipient_email => params[:recipient_email], :days => params[:days]
	end

end
