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
   	@notes=Note.order("send_date DESC").where(:user_id => @user.id).all
end


end

def show
	@note=Note.find_by(:view_id => params[:id])
	# display the note
	
	@new_note=Note.new(recipient_email: @note.sender_email)

end

def create
    # always create the note
	@user=current_user

 	if @user
 		@email = @user.email
 	else
		@email = params[:sender_email]
	end

    @note=Note.new(:body => params[:body], :recipient_email => params[:recipient_email], :sender_email => @email) 
 	
 	if @user
 	@note.user_id = @user.id
 	end

	@delivery_date = params[:delivery_date]
 	@note.send_date = Date.strptime(@delivery_date, '%m/%d/%Y')
 	
 # 	if params[:surprise_me].present?
	# 	@note.days = Random.rand(30)
	# else
		@note.days = (@note.send_date - Date.today).to_i
 # 	end


	if @note.save

	@recipient_email = params[:recipient_email]
	@days = @note.days

	flash[:success]= "Your message to #{@recipient_email} will be delivered #{@days} days in the future."

	end

# 	# check if reply id is present
# 		if params[:reply_id].present?
# 			#Find the note by reply id
# 			note=Note.find_by(:reply_id => params[:reply_id])

# 	  		# redirect to show
# 	 	 redirect_to note_path(note.view_id)
#     else
# 	  # redirect to index, show a flash message
	  redirect_to root_path
#     end
#   else
#   	render :new
#   end


 end  
end
