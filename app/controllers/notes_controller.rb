class NotesController < ApplicationController



def create
	@note=Note.new(:body => params[:body], :recipient_email => params[:recipient_email], :sender_email => params[:sender_email], :days => params[:days])
	@note.save

	@days=params[:days]
	@recipient_email = params[:recipient_email]

	flash[:success]= "Your message to #{@recipient_email} will be delivered in #{@days}"
	redirect_to root_path
end

   
end
