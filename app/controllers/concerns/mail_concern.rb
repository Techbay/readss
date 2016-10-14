# module MailConcern
#   def send_without_template(subject, users, content, html = nil)
#     client = SendGrid::Client.new(api_key: 'test_key')
#     mail = SendGrid::Mail.new do |m|
#       m.to = users
#       m.from = 'test@techbay.com'
#       m.subject = subject
#       m.text = content
#       m.html = html if html
#     end
#     res = client.send(mail)
#   end
# end
