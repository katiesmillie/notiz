desc "Emails a note!"
task :email_note => :environment do
  Notes.mail_notes
end

