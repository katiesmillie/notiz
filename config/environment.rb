# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Notiz::Application.initialize!

# Configuration for using SendGrid on Heroku
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app20048701@heroku.com'],
  :password       => ENV['hjhunhdh'],
  :domain         => 'heroku.com'
  :enable_starttls_auto => true

}
