require 'gmail'

username = 'enformation42@gmail.com'
password = 'combslaville'

gmail = Gmail.connect(username, password)
# play with your gmail...

email = gmail.compose do
  to "enformation42@gmail.com"
  subject "Having fun in Puerto Rico!"
  body "bonjour mehdi"
end
email.deliver! # or: gmail.deliver(email)
  

gmail.logout