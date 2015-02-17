
TODOS

#notes history
- better default sort
- user can sort notes history
- don't use a table 
- add "seen" field to notes history (if sendgrid API allows)


#emails
- delivered or open receipt when user gets your note (sendgrid)
- prettier email view


#form
- if logged in user, store previous email addresses used / contact book
- validate email field and numbers field
- add days drop down selector to form and random days as one of the selections


#misc
- add pingdom so my heroku dynos don't sleep



#future
- react to someone's note with emoji/ like
- mobile app
- sms
- images


#DONE
x- add better errors
x- create view for note#show
x- add hash for note#show privacy? 
x- devise user accounts for notes#index to see limited history - make better
x- style views for devise
X if logged in user, don't make me typ emy own email
X prepopluate reply field with recipient email when viewing a note

x- flash message doesn't dismiss (decided i dont care)
x- protect /admin
x-
As a recipeint of a note
When I visit /notes/unique_id
Then I must send a note to read my note

As a recipient of a note
When I send a note at /notes/unique_id
Then I see my note at /notes/different_unique_id

reply_id string
view_id  string
futureapp.me/notes?reply=reply_id
futureapp.me/notes?view=view
x-PICK A BETTER NAME!!!!
x- do i need to add labels to my forms: http://getbootstrap.com/css/
X- switch to and from fields
x- add @recipient email to flash alert (confirmation) "we scheduled your note for katie@katie.com for  feb 28, 2014."
x- change from email address to hello@dearfuture.me
x- set the delivery date on create not save


