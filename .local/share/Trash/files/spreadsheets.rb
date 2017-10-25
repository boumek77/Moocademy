require "google_drive"

# Creates a session. This will prompt the credential via command line for the
# first time and save it to config.json file for later usages.
# See this document to learn how to create config.json:
# https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
session = GoogleDrive::Session.from_config("config.json")

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# Or https://docs.google.com/a/someone.com/spreadsheets/d/pz7XtlQC-PYx-jrVMJErTcg/edit?usp=drive_web
ws = session.spreadsheet_by_key("pz7XtlQC-PYx-jrVMJErTcg").worksheets[0]

# Gets content of A2 cell.
p ws[2, 1]  #==> "hoge"

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
ws[2, 1] = "foo"
ws[2, 2] = "bar"
ws.save

# Dumps all cells.
(1..ws.num_rows).each do |row|
  (1..ws.num_cols).each do |col|
    p ws[row, col]
  end
end

# Yet another way to do so.
p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# Reloads the worksheet to get changes by other clients.
ws.reload
{
  "type": "service_account",
  "project_id": "charged-chain-183110",
  "private_key_id": "b02cbdbe64866b53ca20799e60aa65d3b14f79f8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCvnMNKeV4rKBWH\npe/9+XD49pSmcSCV3xYciRYdBkyyf31dQHJbspJggrNSHn6U23yUbJTsuVhjFd3t\niwIjZ2jwp3mN6TpzL/9x/n0ThoMJRs+KdRoTXBjMiqSHUDPI+0ClJhagGXha744U\n1jXThNoZqJfOmNAUh31Lk2flEAg4RvLmR9kHI1BXonWn26l9sLMizVl9aMWVU7jx\nnsbDSfWSUuE89VzddcTHGsXppCB1/aS8aWZj+Rdj+o1RtU8oAfIRg1XndvmeJtzw\nkkhR3GV93w/KMFGR+LF+rDG4wY+pIN+cWO2sfGzaP/GqiP+HPMmjEK5HvU/TK5wi\n3O7JUZxNAgMBAAECggEAHwuJy7Xqg5sduUIIy/+HrP+cdlMr9Uq/pDJI5j8pmmmm\n3jApN1Q5g9W/QT5yVrr5ilyqtDGs8jFYryiCq4MZvmeA+ek4A8qBsGOStXuzWRW7\nVWkPv8npeWluHhy71uUx/7Ac0ldGW18boUvgLqE/FEeldKi3qlVsfUqVFJ3Rsi7u\n9dPYDHIskgw/ZrTUvKJdTPTCvkmAvqYVdyLUVsOz6ymyC4CUHJMg0g65N7BTOFfT\n/iaNY3xajXopEw1zwJrbwguSznvKn8fPi4KI0QAKA5R+xAa9UvxrB/ao6kaUDBqh\nBKpKTPNqb3DAfPZOGBGfzs9W2Z2oNDZPRkLRQ+AYkQKBgQD1ineEEOf+LJZXEIYt\nFSA/icM9JltdSahapJ0/xpj5sDjk8egOBg0L+lWaFTY1Nimn1S+1uXiVcJ4IuyLJ\nQOIZNF70kHHscUUlWXeMDQDzOrZDJy6B6pe0D0G1sXksihOxuwUVfFYoQ2k86SMZ\nNb28k43NH7VaG6o44ii185g3EQKBgQC3F8BFT7dOsbR+M7gzm6owfvK6hmjyAwKY\ng3/flyRo8nHQHmHIzv8HBu0alfI3RGxJ+ZSortao1RzV9qPfcMZzBPww0Mt0oLHC\n6yDv7c0+Zm+EDlr6T5dYlZPGFFd6K0WyyCL8N0r0nCjje+eiwFCDiS4jLM2+/6pd\ngCxMFl0pfQKBgQDrys/g9DdE395zt3uSWYJBYfMqiuYcHLreaMxVTUrkJHVObnvQ\n08C9quV/dTU8PkocUN5jHbwNjjtE2SibqYI2gBNbukacr12ec18ZD/fEm7IhpMPF\noNmT4T7R058wxVwKRjWon2FBgxLRmnTJJdGSAQSgYf3OjViXDZ/YsxeOcQKBgBoQ\nxYyYhq4rWljFICootRfmWsP3MqWRjCMORXwdVk+ihFVundkqrt/fOo4YXr1Dfm8h\nmupQybqLbGmBjV7X/UiOoyCH+Q8HeYcYVj4SCrAhgSq5qHYOMqunz7vZVYLM+kUz\nfNePP5qHSMLp9tYSruOq+eiEDl5so2JgRu4mGOk5AoGAEQvDnlbrPHuU8hdeh7lS\nsHMlwIJcgLMfixv9iQqf1eQmiIAj8X0yF/X4rE4+uj6OZS0r08u9MiexHERSfn1h\njV3M79Cnr/BndXgBZwVzjNPE+T3Vz61tAWiRzxAhk7LY4y8Hkk90xUWTCTVbQ2+l\nrTM9nvnJhvv3ENFcpcI7LVo=\n-----END PRIVATE KEY-----\n",
  "client_email": "legislators@charged-chain-183110.iam.gserviceaccount.com",
  "client_id": "112964898003664712281",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://accounts.google.com/o/oauth2/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/legislators%40charged-chain-183110.iam.gserviceaccount.com"
}
