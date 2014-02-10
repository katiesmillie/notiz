class NotesController < ApplicationController



def create
	@note=Note.new(:body => params[:body], :recipient_email => params[:recipient_email], :sender_email => params[:sender_email], :days => params[:days])
	@note.save

	@days=params[:days]

	flash[:success]="your message has been scheduled to be sent!"
	redirect_to root_path
end

   
end
