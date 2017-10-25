require 'gmail'

username = 'enformation42@gmail.com'
password = 'combslaville'

gmail = Gmail.connect(username, password)
# play with your gmail...

gmail.deliver do
  to "enformation42@gmail.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Text of plaintext message."
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
  add_file "/path/to/some_image.jpg"

end

gmail.logout