class NotesController < ApplicationController

def index
end


def create
	@note=Note.new :body => params[:body], :recipient_email => params[:recipient_email], :sender_email => params[:sender_email], :days => params[:days]
	@note.save

	NotesMailer.notes_email(params[:recipient_email], params[:sender_email], params[:body], params[:days]).deliver

	flash[:success]="Your message was sent!"
	redirect_to root_path
end

   
end
