#-------- setup cgi và apache chạy local
#cài apache2: sudo apt-get install apache2
#enabled module cgi
#$ cd /etc/apache2/mods-enabled
#$ sudo ln -s ../mods-available/cgi.load
#$ sudo service apache2 reload
#/usr/lib/cgi-bin  --- nơi chứa file cgi
#/var/www/      --- nới chưa file html
#dùng lệnh chmod để set permission cho thư mục
#vd sudo chmod -R o+rw /var/www
#dùng lệnh 'sudo chmod +x /usr/lib/cgi-bin/file-can-executable.rb' để file có thể thực thi

#---- demo helloword
#tạo file test.rb ở /usr/lib/cgi-bin

#!/usr/bin/ruby

require 'cgi'

cgi = CGI.new
puts cgi.header
puts "<html><body>This is a test</body></html>"

#chạy url http://127.0.0.1/cgi-bin/test.rb
#nhớ có hashbang #!/usr/bin/ruby
#nếu lỗi 500 hoặc 404, xem lại url hoặc chạy lênh để executable cho file

#---- truyền params
#-file cgi 
#vd1

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new
puts cgi.header
puts cgi['FirstName']
puts cgi['LastName']

#vd2
#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new
puts cgi.header
puts k = cgi.keys
puts h = cgi.params  
puts h['FirstName']
puts h['LastName']


#h = cgi.params => hash of all the key and values
#k = cgi.keys  => tất cả các key
#note: nếu có nhiều trường trùng tên, sẽ return về 1 array
#nếu dùng cgi['name'] chỉ trả về 1 giá trị đầu của array
#vd
cgi = CGI.new
cgi['name']        # => "Zara"
cgi.params['name'] # => ["Zara", "Huma", "Nuha"]
cgi.keys           # => ["name"]
cgi.params         # => {"name"=>["Zara", "Huma", "Nuha"]}


#-file html
<html>
<body>
<form method="POST" action="cgi-bin/test.rb">
First Name :<input type="text" name="FirstName" value="" />
<br />
Last Name :<input type="text" name="LastName" value="" /> 

<input type="submit" value="Submit Data" />
</form>
</body>
</html>

/#note: get và set dc ruby xử lý tự động, không có cách làm khác nhau giữa 2 method

#-tạo html với cgi 
#!/usr/bin/ruby

require "cgi"
cgi = CGI.new("html4")
cgi.out{
   cgi.html{
      cgi.head{ "\n"+cgi.title{"This Is a Test"} } +
      cgi.body{ "\n"+
         cgi.form{"\n"+
            cgi.hr +
            cgi.h1 { "A Form: " } + "\n"+
            cgi.textarea("get_text") +"\n"+
            cgi.br +
            cgi.submit
         }
      }
   }
}

#quote chuỗi
#dùng CGI.escape va CGI.unescape.
#hoặc CGI.escapeHTML với tag html
#các method của class CGI: https://www.tutorialspoint.com/ruby/ruby_cgi_methods.htm

#---cookie
#-tạo cookie

#!/usr/bin/ruby
require "cgi"
cgi = CGI.new("html4")
cookie = CGI::Cookie.new('name' => 'mycookie',
                         'value' => 'Zara Ali',
                         'expires' => Time.now + 3600)
cgi.out('cookie' => cookie) do
   cgi.head + cgi.body { "Cookie stored" }
end

#name: tên cookie (key)
#value: giá trị (là 1 array)
#expires: thời gian sống của cookie
#secure: true if secure cookie
#path: cookie's path
#domain

#- lấy cookie

#!/usr/bin/ruby
require "cgi"
cgi = CGI.new("html4")
cookie = cgi.cookies['mycookie']
cgi.out('cookie' => cookie) do
   cgi.head + cgi.body { cookie[0] }
end

#---- session
#!/usr/bin/ruby

require "cgi"
require "cgi/session"

cgi = CGI.new("html4")
sess = CGI::Session.new( cgi, "session_key" => "rubyweb", 
                          "session_id"  => "9650",      
                          "new_session" => true,      
                          "prefix" => "web-session.")
sess["CustID"] = 123
sess["Part"] = "ABC"

cgi.out{
  cgi.head + cgi.body{
    "\nHTML content here"
  }
}
#session_key: Key name ID. Default _session_id.
#new_session: nếu là true sẽ tạo mới session id, 
#nếu false, sử dug session cũ xác định bởi session_id
#nếu không ghi method này sẽ bỏ qua nếu session đã tồn tại, tạo mới nếu chưa.
#sess[key]=value


#khi user vào lại web với params, trong vd này là rubyweb=9650
#http://127.0.0.1/cgi-bin/test.rb?rubyweb=9650
#!/usr/bin/ruby

require "cgi"
require "cgi/session"

cgi = CGI.new("html4")
sess = CGI::Session.new( cgi, "session_key" => "rubyweb",
                               "prefix" => "web-session.")
cgi.out{
  cgi.head + cgi.body{
    "\nCustomer #{sess['CustID']} orders an #{sess['Part']}"
  }
}


