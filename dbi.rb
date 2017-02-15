#cài gem DBI: gem install dbi
#cài đặt môi trường kết nối đến MySql
# gem install dbd-mysql
# gem install mysql
#ruby 2.4.0 có thể sẽ lỗi, đổi ver thấp hơn (2.3.3)
#tạo database tên myapp_test
#bảng book gồm id, name

#
require "dbi"
 
$database = "myapp_test"
$host = "127.0.0.1"			#local
$port = "3306"
$username = "root"
$password = ""
 
begin
# connect to the MySQL server
  dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)
    row = dbh.select_one("SELECT VERSION()")
    puts "Server version: " + row[0]
  # Process database
rescue DBI::DatabaseError => e
  puts "An error occurred"
  puts "Error code:    #{e.err}"
  puts "Error message: #{e.errstr}"
ensure
  # disconnect from server
  dbh.disconnect if dbh
end

#---- do method (thực thi câu query)
require "dbi"
 
$database = "myapp_test"
$host = "127.0.0.1"			#local
$port = "3306"
$username = "root"
$password = ""
 
begin
# connect to the MySQL server
  dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)
  puts "Connected." if dbh
  # Process database
   
  dbh.do("INSERT INTO books(name) VALUES('a b c')")
  dbh.commit
   
rescue DBI::DatabaseError => e
  puts "An error occurred"
  puts "Error code:    #{e.err}"
  puts "Error message: #{e.errstr}"
ensure
  # disconnect from server
  dbh.disconnect if dbh
end

#---------- prepare và execute method

require "dbi"
 
$database = "myapp_test"
$host = "127.0.0.1"			#local
$port = "3306"
$username = "root"
$password = ""
 
begin
# connect to the MySQL server
  dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)
  puts "Connected." if dbh
  # Process database
   
  sth = dbh.prepare("INSERT INTO books(name) VALUES(?)")
  sth.execute("ross ross ross") # Replace value into parameter `?`
  sth.finish # Release `sth`
  dbh.commit
   
rescue DBI::DatabaseError => e
  puts "An error occurred"
  puts "Error code:    #{e.err}"
  puts "Error message: #{e.errstr}"
ensure
  # disconnect from server
  dbh.disconnect if dbh
end

#----------- Select statement
require "dbi"
 
$database = "myapp_test"
$host = "127.0.0.1"			#local
$port = "3306"
$username = "root"
$password = ""
 
begin
# connect to the MySQL server
  dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)
  puts "Connected." if dbh
  # Process database
   
  sth = dbh.prepare("SELECT * FROM books WHERE id > ?")
  sth.execute('1')
  sth.fetch do |row|
    puts "ID: #{row['id']}; Name: #{row['name']}"
  end
  sth.finish
  # dbh.commit, `cause not update database
   
rescue DBI::DatabaseError => e
  puts "An error occurred"
  puts "Error code:    #{e.err}"
  puts "Error message: #{e.errstr}"
ensure
  # disconnect from server
  dbh.disconnect if dbh
end

#------- Update statement


require "dbi"

$database = "myapp_test"
$host = "127.0.0.1"			#local
$port = "3306"
$username = "root"
$password = ""

begin
     # connect to the MySQL server
     dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)

     sth = dbh.prepare("UPDATE books SET name = ?
                        WHERE id = ?")
     sth.execute('tat den phan 2', '2')
     sth.finish
     dbh.commit
rescue DBI::DatabaseError => e
     puts "An error occurred"
     puts "Error code:    #{e.err}"
     puts "Error message: #{e.errstr}"
     dbh.rollback
ensure
     # disconnect from server
     dbh.disconnect if dbh
end

#-------- Delete statement

require "dbi"

$database = "myapp_test"
$host = "127.0.0.1"			#local
$port = "3306"
$username = "root"
$password = ""

begin
     # connect to the MySQL server
    dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)
    sth = dbh.prepare("DELETE FROM books 
                        WHERE id > ?")
    sth.execute(1)
    sth.finish
    dbh.commit
rescue DBI::DatabaseError => e
    puts "An error occurred"
    puts "Error code:    #{e.err}"
    puts "Error message: #{e.errstr}"
    puts "State string: #{e.state}"
    dbh.rollback
ensure
    # disconnect from server
    dbh.disconnect if dbh
end

#bật/tắt autocommit
#dbh['AutoCommit'] = false hoặc DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",$username, $password, 'AutoCommit' => false)

#----- bắt lỗi
# có 3 Exception objects
#err: return về 1 số int (mã lỗi) nếu có hoặc nil nếu không có lỗi
#errstr: return về 1 chuỗi string lỗi
#state: return về SQLSTATE code nếu lỗi, SQLSTATE là 1 chuỗi 5 kí tự, hầu hết DBD không hỗ trợ cái này (return nil)

#---- Driver-specific Functions và Attributes
#dbh.func(:createdb, db_name) 		tạo database mới
#dbh.func(:dropdb, db_name)			drop database
#dbh.func(:reload)
#dbh.func(:shutdown)				shutdown server
#dbh.func(:insert_id) 				return giá trị AUTO_INCREMENT
#dbh.func(:client_info)
#dbh.func(:client_version)
#dbh.func(:host_info)
#dbh.func(:proto_info) 				return protocol dùng để giao tiếp
#dbh.func(:server_info)
#dbh.func(:stat)					return state hiện tại của db
#dbh.func(:thread_id)				return id luồn hiện tại
require "dbi"

$database = "myapp_test"
$host = "127.0.0.1"         #local
$port = "3306"
$username = "root"
$password = ""

begin
     # connect to the MySQL server
    dbh = DBI.connect("DBI:Mysql:#{$database}:#{$host}:#{$port}",
    $username, $password)
   puts dbh.func(:client_info)
   puts dbh.func(:client_version)
   puts dbh.func(:host_info)
   puts dbh.func(:proto_info)
   puts dbh.func(:server_info)
   puts dbh.func(:thread_id)
   puts dbh.func(:stat)
rescue DBI::DatabaseError => e
    puts "An error occurred"
    puts "Error code:    #{e.err}"
    puts "Error message: #{e.errstr}"
    puts "State string: #{e.state}"
    dbh.rollback
ensure
    # disconnect from server
    dbh.disconnect if dbh
end

#Driver-specific Functions và Attributes: 
#