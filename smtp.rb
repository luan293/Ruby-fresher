#---------
#cài SMTP trên ubuntu sudo apt-get install postfix

#----- send email
require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@fromdomain.com', 
                             'test@todomain.com'
end

#method start có các parameters sau:
#-server - Ip name của SMTP server, default là local
#-port - defaul là 25
#-domain - domain ccuar ng gửi, default là ENV["HOSTNAME"]
#-account - username, default là nil
#-password - password, default là nil
#-authtype - Authorization type, default là cram_md5
#mỗi đối tựng SMTP có 1 phương thức instance là send_message, có 3 parameters
#-source: phần From/To/Subject + nội dung email
#-sender: người gửi
#-recipients: người nhận

#----- send mail với html

require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
MIME-Version: 1.0
Content-type: text/html
Subject: SMTP e-mail test

This is an e-mail message to be sent in HTML format

<b>This is HTML message.</b>
<h1>This is headline.</h1>
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@fromdomain.com', 
                             'test@todomain.com'
end

#cần MIME-Version: 1.0 và Content-type: text/html để hiểu tag HTML

#------ gửi mail với tệp đính kèm 

require 'net/smtp'

directory = "/home/luandt"
file1Content1 = File.read(directory +'/img1.jpg')
file1Content2 = File.read(directory +'/img2.jpg')
file1 = [file1Content1].pack("m")
file2 = [file1Content2].pack("m")
marker = "AUNIQUEMARKER"

body =<<EOF
This is a test email to send an attachement.
EOF

# Define the main headers.
part1 =<<EOF
From: Private Person <me@fromdomain.net>
To: A Test User <test@todmain.com>
Subject: Sending Attachement
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=#{marker}
--#{marker}
EOF

# Define the message action
part2 =<<EOF   
Content-Transfer-Encoding:8bit
Content-Type: text/plain
#{body}
--#{marker}
EOF

# Define the attachment section
part3 =<<EOF
Content-Type: image/jpeg; name="img1-a.jpg"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename="img1-b.jpg"
#{file1}
--#{marker}
EOF

part4 =<<EOF
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename=img2-b.jpg
#{file2}
--#{marker}
EOF
mailtext = part1 + part2 + part3 +part4
# Let's put our code in safe area
begin 
  Net::SMTP.start('localhost') do |smtp|
     smtp.sendmail(mailtext, 'me@fromdomain.net',
                          ['luan29394@gmail.com'])
  end
rescue Exception => e  
  print "Exception occured: " + e  
end  

#-------- gửi mail = gmail
require 'net/smtp'

message = <<MESSAGE_END
From: <email_nguoi_gui@gmail.com>
To: <email_nguoi_nhan@gmail.com>
Subject: SMTP e-mail testttt

This is a test e-mail message.
MESSAGE_END

smtp = Net::SMTP.new 'smtp.gmail.com', 587 #cấu hình cho gmail
smtp.enable_starttls
smtp.start('gmail.com', 'email_nguoi_gui@gmail.com', 'password', :login) do
   smtp.send_message(message, 'email_nguoi_gui@gmail.com', 'email_nguoi_nhan@gmail.com')
end


