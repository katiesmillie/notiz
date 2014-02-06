desc "Emails a note!"
task :email_note => :environment do
  Note.mail_notes
end

