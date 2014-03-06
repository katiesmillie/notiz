class NotesController < ApplicationController

def index
  @reply_id=params[:reply_id]

  #if there is a reply id
  if  @reply_id == params[:reply_id]
  #then show a flash alert
	flash[:alert]= "Send a note to the future, and then your note will arrive"
  end

end

def show
	# params = { id: <view_id>}
	@note=Note.find_by(:view_id => params[:id])
	# display the note


end

def create
    # always create the note
    @note=Note.new(:body => params[:body], :recipient_email => params[:recipient_email], :sender_email => params[:sender_email], :days => params[:days])
	@note.save

	@days=params[:days]
	@recipient_email = params[:recipient_email]

	flash[:success]= "Great Scott! Your message to #{@recipient_email} will arrive #{@days} days in the future."

	# check if reply id is present
	if params[:reply_id].present?
		#Find the note by reply id
		note=Note.find_by(:reply_id => params[:reply_id])

	  # redirect to show
	  redirect_to note_path(note.view_id)
    else
	  # redirect to index, show a flash message
	  redirect_to root_path
    end
end

   
end
