class NotesController < ApplicationController

def new
	@note = Note.new
	 @reply_id=params[:reply_id]

  #if there is a reply id
  if params[:reply_id].present?
  #then show a flash alert
	flash[:future]= "Send a note to someone else in the future, and then your note will appear below"
  end

end


def index
 
if current_user
    @user=current_user
   	@notes=Note.where(:user_id => @user.id).all
end


end

def show
	# params = { id: <view_id>}
	@note=Note.find_by(:view_id => params[:id])
	# display the note


end

def create
    # always create the note
	@user=current_user
    @note=Note.new(:body => params[:body], :recipient_email => params[:recipient_email], :sender_email => params[:sender_email])
 	
 	if @user
 	@note.user_id = @user.id
 	end
 	
 	if params[:surprise_me].present?
		@note.days = Random.rand(30)
	else
		@note.days = params[:days]
 	end

	if @note.save

	@recipient_email = params[:recipient_email]
	@days = @note.days

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
  else
  	render :new
  end
end

   
end
