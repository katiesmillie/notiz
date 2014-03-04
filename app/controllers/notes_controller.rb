class NotesController < ApplicationController



def create
	@note=Note.new(:body => params[:body], :recipient_email => params[:recipient_email], :sender_email => params[:sender_email], :days => params[:days])
	@note.save

	@days=params[:days]
	@recipient_email = params[:recipient_email]

	flash[:success]= "Great Scott! Your message to #{@recipient_email} will arrive #{@days} in the future."
	redirect_to root_path
end

   
end
