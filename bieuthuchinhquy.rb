#Biểu thức chính quy là một công cụ hỗ trợ thực hiện tìm kiếm chuỗi hoặc các thao tác phức tạp với chuỗi, 
#thường được tích hợp trong các công cụ soạn thảo văn bản, ngôn ngữ lập trình… và tất nhiên là Ruby cũng không ngoại lệ.
#Thành phần chủ chốt của biểu thức chính quy là các chuỗi tìm kiếm (tiếng Anh là search pattern hoặc pattern không cũng được) dùng để thực hiện so sánh trên các chuỗi thật. 
#Các chuỗi tìm kiếm này được xây dựng dựa trên các kí tự bình thường và các kí tự đặc biệt.
#Đây là danh sách các kí tự đặc biệt:
# 	. 		Tìm bất kì ký tự nào
# 	* 		Tìm kí tự đứng trước đó 0 hoặc nhiều lần
# 	[ ] 	Tìm bất kì kí tự đứng trong cặp dấu []
# 	[^ ] 	Tìm bất kì kí tự nào không nằm trong cặp dấu []
# 	^ 		Tìm tại điểm bắt đầu của chuỗi
# 	$ 		Tìm tại điểm kết thúc của chuỗi
# 	| 		Toán tử OR

#Để tạo các chuỗi tìm kiếm thì chúng ta dùng lớp Regexp, ở dòng trên chúng ta tạo một đối tượng Regexp với chuỗi tìm kiếm là “Jane”.
re = Regexp.new 'Jane'
p "Jane is a girl".match re 		#trả về một đối tượng MatchData nếu tìm thấy hoặc nil nếu không tìm thấy,
p "Jane is a girl" =~ /Jane/		#sẽ trả về chỉ số của chuỗi con được tìm thấy đầu tiên hoặc nil nếu không tìm thấy
p "Jane is a girl".match %r{Jane}

#--Tìm bất kì ký tự nào
#Như đã mô tả trong bảng các kí tự đặc biệt ở trên, kí tự dấu chấm “.” sẽ tìm bất kì một kí tự nào. Ví dụ:
p "PhoCode".match /.Code/		#<MatchData "oCode">
p "Code".match /.Code/			#nill
p "MiCode".match /.Code/		#<MatchData "iCode">
p "Phode".match /.Code/			#nill
p "Code".match /.?Code/			#thêm dấu chấm hỏi “?” sau kí tự chấm “.” để báo cho Ruby biết rằng kí tự đó có thể có hoặc không có cũng đượ

#Một số biến đặc biệt
puts "Her name is Jane" =~ /name/
 
p $`		#lưu chuỗi nằm phía trước chuỗi được tìm thấy
p $&		#lưu chính chuỗi được tìm thấy
p $'		#lưu chuỗi nằm phía sau chuỗi được tìm thấy.

#Anchor
sen1 = "Programming Ruby"
sen2 = "Ruby programming language"
 
p sen1.match /^Ruby/ 
p sen2.match /^Ruby/ 
 
p sen1.match /Ruby$/ 		# tìm chuỗi con tại vị trí đầu trong chuỗi gốc
p sen2.match /Ruby$/ 		# khi kí tự $ sẽ tìm chuỗi con bắt đầu từ cuối chuỗi.

#vd2
text = "The cat also known as the domestic cat is a small, 
usually furry, domesticated, carnivorous mammal."
 
p text.scan /cat/ 			# scan sẽ tìm tất cả những chuỗi con có nội dung là “cat” trong chuỗi gốc, ở đây 
#thêm kí tự \b vào trước và sau chuỗi tìm kiếm cần tìm, Ruby sẽ tìm chuỗi con đứng một mình chứ không tìm chuỗi con lẫn trong các chuỗi khác lớn hơn. 
p text.scan /\bcat\b/

#Gom nhóm các kí tự
#Chúng ta có thể gộp các kí tự cần kiểm tra lại với nhau vào bên trong cặp dấu ngoặc vuông []. 
#Ví dụ /[ab]/ sẽ tìm bất kì kí tự a hoặc b nào, còn /ab/ sẽ tìm bất kì kí tự ab nào, tức là /ab/ phải có cả kí tự a lẫn kí tự b,
#còn /[ab]/ chỉ là tìm xem có kí tự a hoặc b hay không thôi.		
words = %w/ sit MIT fit fat lot pad /
 
pattern = /[fs]it/				#chuỗi tìm kiếm có dạng /[fs]it/ tức là khớp với chuỗi fit hoặc sit.
 
words.each do |word|
   if word.match pattern
       puts "#{word} matches"
   else
       puts "#{word} does not match"
   end
end

#vd2
p "car".match %r{[abc][a][rs]}
p "car".match /[a-r]+/	# dùng dấu gạch nối “-“ để biểu diễn một khoảng giá trị. thay vì viết [abcdefghijklmnopqrstuvwxyz] để tìm một kí tự từ a đến z, thì ở đây chúng ta chỉ cần ghi là [a-z] 
# tìm một kí tự có nhiều khoảng giá trị khác nhau 
p "23af 433a 4ga".scan /\b[a-f0-9]+\b/		#a-f 0-9

#vd3
p "ABC".match /[^a-z]{3}/ #dấu ^ để chỉ định cho Ruby tìm những kí tự không thuộc khoảng giá trị đó.
p "abc".match /[^a-z]{3}/	#Ngoài ra sẽ tìm một chuỗi có đúng 3 kí tự, thay vì dùng dấu + như trước là lặp lại vô số lần.

#Chỉ định số lượng kí tự cần tìm
# 	?     - có hoặc không có
# 	*     - lặp lại 0 hoặc nhiều lần
# 	+     - lặp lại 1 hoặc nhiều lần
# 	{n}   - Xuất hiện chính xác n lần
# 	{n,}  - Xuất hiện n lần hoặc nhiều hơn
# 	{,n}  - Xuất hiện ít hơn hoặc bằng n lần
# 	{n,m} - Xuất hiện từ n đến m lần
#vd
p "Code open source is the future".scan /\w{3}/
p "Code open source is the future".scan /\b\w{3}\b/
#\w là tìm một kí tự chữ cái, tức là tương đương với [a-zA-Z], thêm {3} vô nghĩa là tìm chuỗi có 3 kí tự chữ cái
#thêm \b tức là chỉ tìm những chuỗi con có đúng 3 chữ cái.
p "Code open source is the future".scan /\b\w{2,4}\b/
#tìm chuỗi con từ 2 đến 4 chữ cái
p "color colour colors colours".scan /colou?rs/		#["colors", "colours"]
p "color colour colors colours".scan /colou?rs?/	#["color", "colour", "colors", "colours"]
#giog OR ["color", "colour", "colors", "colours"]
p "color colour colors colours".scan /\bcolor\b|\bcolors\b|\bcolour\b|\bcolours\b/

p "Jane".match /JANE/i  	#thêm i để không phân biệt HOA hay thường

#---Email
#một mảng emails lưu các chuỗi email mẫu để kiểm tra.
emails = %w/ admin@example.com jane@gmail.com ioah2423^as f3444@gmail.com /
     
pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/ #chuỗi Regex
 
emails.each do |email| 
 
    if email.match pattern
        puts "#{email} matches"
    else
        puts "#{email} does not match"
    end
     
end

#phân tích
#[a-zA-Z0-9._-]+@  tìm chuỗi có ký tự 'a-z A-Z 0-9 . _ -' và theo sau là '@'. Đây là phần đầu mail
#[a-zA-Z0-9]+\. 	tìm chuỗi có ký tự 'a-z A-Z 0-9' và theo sau phải là '.' (do dấu . là lấy bất kỳ ký tự nên phải thêm '\')
#[a-zA-Z.]{2, 5} 	tìm 1 chuỗi có 2 đến 5 ký tự 'a-z A-Z .'. Có dấu chấm sau cùng vì có thể là .com.vn, .co.uk...

#xem them các pattern https://www.tutorialspoint.com/ruby/ruby_regular_expressions.htm