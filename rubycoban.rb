#coment dùng # hoặc bao trong =begin/=end.

#--------- BEGIN -------#
# gọi khối lênh trong BEGIN đầu tiên 
puts "This is main Ruby Program"

BEGIN {
   puts "Initializing Ruby Program"
}
#KQ: Initializing Ruby Program
#    This is main Ruby Program
#----------------------#

#-------- END -------------#
puts "This is main Ruby Program"

END {
   puts "Terminating Ruby Program"
}
BEGIN {
   puts "Initializing Ruby Program"
}
#KQ: Initializing Ruby Program
#    This is main Ruby Program
#    Terminating Ruby Program
#----------------------------#

#-----------biến ------------#
tree_name = "pine"      #biến cục bộ, tức là chỉ có hiệu lực ở phạm vi trong từng phương thức, lớp… nhất định.
$car_name = "Peugeot"    #biến đó là biến toàn cục, biến toàn cục có hiệu lực trong toàn bộ code Ruby
@sea_name = "Black sea"  #biến instance, biến này chỉ có hiệu lực trong một đối tượng.
@@species = "Cat"        #biến class, tất cả các đối tượng của một class đều có thể truy xuất biến này.
 
p local_variables       #Biến local_variables là một mảng lưu trữ toàn bộ các biến cục bộ hiện có.
p global_variables.include? :$car_name #biến global_variables lưu toàn bộ các biến toàn cục
p self.instance_variables     #biến này lưu trữ toàn bộ biến instance trong đối tượng hiện tại,
p Object.class_variables      #biến này lưu trữ toàn bộ biến class có trong chương trình

#----------------------------#
#-------- CLASS/biến --------#
class Customer # khai báo class
   @@no_of_customers=0 # '@@' khai báo biến lớp (Class Variables)
   # def/end định nghĩa 1 phương thức  
   def initialize(id, name, addr) #nên dung _id, _name để khai báo biến cục bộ
      @cust_id=id
      @cust_name=name       #'@' khai báo biến Instance
      @cust_addr=addr
   end
end
cust1=Customer.new("1", "John", "Wisdom Apartments, Ludhiya") #tạo đối tượng cust1
#-----------------------#

#------------- biểu thức -----------------#
a, b, c = 10, 20, 30
a, b = b, c  #swap a,b

#Tên                                               Kí hiệu

#Lấy thuộc tính, phương thức                        :: .
#Thao tác mảng                                      [ ] [ ]=
#Lấy lũy thừa                                       **
#Toán tử phủ định, đảo bit, tăng, giảm              ! ~ + -
#Toán tử nhân, chia, chia lấy phần dư               * / %
#Toán tử cộng, trừ                                  + -
#Toán tử dịch bit                                   << >>
#Toán tử thao tác bit AND                           &
#Toán tử thao tác bit OR                            ^ |
#Toán tử so sánh hơn kém                            > >= < <=
#Toán tử so sánh bằng                               <=> == === != =~ !~
#Toán tử logic AND                                  &&
#Toán tử logic OR                                   ||
#Toán tử tạo phạm vi                                .. ...
#Toán tử điều kiện                                  ?:
#Toán tử gán                                        = += -= *= **= /= %= &= |= ^= <<= >>= ||= &&=
#Phủ định                                           not
#Toán tử logic OR, AND                              or and

#toán tử :: lấy hằng số, module hoặc một lớp được định nghĩa bên trong một lớp khác
class MyMath
    Pi = 3.1415926535   
end
 
module People
    Name = "People"
end
 
puts MyMath::Pi
puts People::Name

#toán tử . truy xuất thuộc tính và phương thức của một đối tượng
class Person
     
   def initialize name, age
       @name = name
       @age = age       
   end
    
   def info
       "#{@name} is #{@age} years old"
   end
     
end
 
p = Person.new "Jane", 17
puts p.info

#toán tủ phạm vi 'i..j' lấy phạm vi từ i tới j và lấy cả j
p (1..3).to_a # kq: 123

#toán tủ phạm vi 'i...j' lấy phạm vi từ i tới j không bao gồm j
p (1...3).to_a # kq: 12

#--------------string ---------------#
#dùng nháy đơn hoặc nháy đôi để tạo 1 string
#kết hợp cả 2 hoặc dấu \ trước nháy để chèn thêm nháy vào chuỗi
puts "There are many stars"
puts "He said, \"Which one is your favourite?\""
 
puts 'There are many stars'
puts 'He said, "Which one is your favourite?"'
#---------- kí tự thoát "\" --------#
puts "one\ntwo\nthree\nfour" #\n có nghĩa là xuống dòng
puts "bbb\raaa"               #\r đưa dấu nháy trên màn hình về vị trí đầu dòng. kq: aaabbb
puts "Joan\b\b\bane"          #\b xóa một kí tự đứng trước nó kq: Jane
puts "Towering\tinferno"      #t các 1 đoạn = tab
#muốn in ra \ thì dùng \\

#lấy phần tử của string
msg = "Ruby language"
 
puts msg["Ruby"]        #tìm trong chuỗi msg có tồn lại chuỗi Ruby hay không, in ra, kq: Ruby
puts msg["Python"]      #không tìm thấy in ra chuỗi rỗng
 
puts msg[0]             #in ra ký tự tại vị trí đó, kq: R
puts msg[-1]            #số âm thì duyệt từ cuối lên, kq e   
 
puts msg[0, 3]          #lấy 3 ký tự từ vị trí 0, kq: Rub
puts msg[0..9]          #lấy về chuỗi kí tự từ vị trí 0 đến vị trí 9, kq:Ruby langu
puts msg[0, msg.length] #kq Ruby language

#truyền biến vào string #{<tên biến>}
name = "Jane"
age = 17
 
puts "#{name} is #{age} years old"  #kq: Jane is 17 years old
#thực hiện biểu thức trong khi truyền biến.
x = 5
y = 6
 
puts "#{x} x #{y} = #{x*y}"         #kq: 5 x 6 = 30

#nối chuỗi
lang = "Ruby" + " programming" + " languge"     #Ruby programming languge
puts lang
 
lang = "Python" " programming" " language"      #Python programming language
puts lang
 
lang = "Perl" << " programming" << " language"  #Perl programming language
puts lang
 
lang = "Java".concat(" programming").concat(" language") #Java programming language
puts lang

#so sánh chuôi
#ngoài cách dùng == có thể dùng phương thức .eql?, trả về true false
puts "Ruby".eql? "Jan"     #kq: false
# dùng toán tử <==> không trả về true false mà trả về 0, 1, -1
#1: chuỗi bên trái lớn hơn chuỗi bên phải
#-1: chuỗi bên trái bé hơn chuỗi bên phải
#0: hai chuỗi bằng nhau

#phương thức trong string
word = "Methods"
 
puts "Size of #{word}: #{word.size}"      # size lấy số lượng kí tự có trong string. kq: 7
 
puts word.include? "tho"      #phương thức include?, phương thức này cho biết chuỗi “tho” có nằm trong chuỗi “Methods” hay không.kq: true            
puts word.include? "od"       #kq: true
 
 
puts word.empty?     #Phương thức empty? cho biết string có rỗng hay không. kq: false   
word.clear           #Phương thức clear xóa string
puts word.empty?     #kq true
#----------------
ruby = "Ruby"
 
puts ruby.upcase           #Phương thức upcase chuyển toàn bộ string thành in hoa. kq RUBY
puts ruby.downcase         #Phương thức upcase chuyển toàn bộ string thành in thuong. ruby
puts ruby.capitalize       #Phương thức capitalize viết hoa chữ cái đầu trong string, còn lại viết thường. kq:Ruby 
puts ruby.swapcase         #Phương thức swapcase chuyển kí tự hoa thành thường và ngược lại. kq: rUBY
#---------------------
str1 = "ruby.com"                
str2 = "python.com"
 
puts str1.start_with? "ruby"     #phương thức start_with? cho biết chuỗi có bắt đầu bằng chuỗi “ruby” hay không. kq:true
puts str2.start_with? "ruby."    #kq: false
 
puts str1.end_with? ".com"       #phương thức end_with? cho biết chuỗi có kết thúc bằng chuỗi “.com” hay không, kq: true
puts str2.end_with? ".com"       #kq true
#--------------------

msg = "Ruby\nPython"       
 
puts msg            #kq: Ruby
                    #    Python
puts msg.inspect   #Phương thức inspect sẽ in các ký tự thoát ra luôn chứ không dùng để điều khiển chuỗi nữa. kq: "Ruby\nPython"

#----------Định dạng chuỗi
#%[cờ][độ lớn][độ chính xác]<tên đặc tả>
puts "There are %d oranges in the basket." % 12    #There are 12 oranges in the basket.
puts "There are %d oranges and %d apples in the basket." % [12, 10] #There are 12 oranges and 10 apples in the basket.
puts "Speed: %f km/h" % 62.1        #Speed: 62.100000 km/h
puts "Name: %s" % "iPhone 5"        #Name: iPhone 5

#Khi chúng ta đặt %d bên trong chuỗi thì khi dịch Ruby sẽ hiểu là phải đưa một số nguyên vào vị trí đó thay thế cho chuỗi %d. Các tham số sẽ được đưa vào sau dấu % phía sau chuỗi. Ngoài ra chúng ta cũng có thể đưa vào nhiều tham số bằng cách đặt chúng trong cặp dấu [] và ngăn cách nhau bởi dấu phẩy.
#Đặc tả %d hiển thị số nguyên, %f là số chấm động, %s là hiển thị một chuỗi.
#--------------
puts "%d" % 300         #300
puts "%x" % 300         #12c
puts "%o" % 300         #454
puts "%b" % 300         #100101100
puts "%e" % (5/3.0)     #1.666667e+00
#Kiểu số nguyên có thể được hiển thị trên nhiều hệ cơ số khác nhau. Chẳng hạn %d là hệ 10, %x là hệ 16, %o là hệ 8, %b là hệ nhị phân (hệ 2), %e là hiển thị theo kiểu số mũ.
#---------------
puts 'Height: %f %s' % [177.3, 'cm']         #kq: Height: 177.300000 cm
puts 'Height: %.1f %s' % [177.3, 'cm']       #kq: Height: 177.3 cm
 
puts "%d" % 16                               #16
puts "%.5d" % 16                             #00016
 
puts "%s" % "Ruby"                           #Ruby
puts "%.5s" % "Python"                       #Pytho
#Trong ví dụ trên, %.1f tức là hiển thị 1 chữ số sau phần thập phân. Mặc định Ruby hiển thị 6 chữ số sau phần thập phân nên nếu không đủ thì Ruby sẽ tự động chèn thêm các số 0 vào trước.
#Tương tự, mặc định Ruby hiển thị độ chính xác là 1 với số nguyên, nhưng nếu chúng ta thiết lập là %.5d thì Ruby sẽ tự chèn thêm các số 0 vào trước cho đủ 5 chữ số.
#%.5s cũng giống 2 kiểu trên ở chỗ là sẽ chỉ cho phép hiển thị 5 chữ cái, nếu số lượng chữ cái quá nhiều thì các chữ cái sau cùng sẽ bị lược bỏ, nhưng nếu không đủ số lượng thì Ruby cũng chẳng chèn thêm kí tự nào vào.
#---------------
puts "%d" % 1
puts "%d" % 12
puts "%d" % 123
puts "%d" % 1234
puts "%d" % 12345
 
puts "%10d" % 1
puts "%10d" % 12
puts "%10d" % 123
puts "%10d" % 1234
puts "%10d" % 12345
#Tham số độ lớn nằm trước dấu chấm trong chuỗi đặc tả. Nếu dữ liệu không đủ số lượng kí tự thì Ruby sẽ tự động chèn thêm các khoảng trống vào phía trước chuỗi, ngoài ra chúng ta cũng có thể ghi số âm và Ruby sẽ đưa các kí tự khoảng trống vào phía sau chuỗi.
#kq: 
#1
#12
#123
#1234
#12345
#         1
#        12
#       123
#      1234
#     12345
#------------
puts "%010d" % 1
puts "%010d" % 12
puts "%010d" % 123
puts "%010d" % 1234
puts "%010d" % 12345
 
puts "%-10d" % 1
puts "%-10d" % 12
puts "%-10d" % 123
puts "%-10d" % 1234
puts "%-10d" % 12345
#Cờ 0 sẽ chèn thêm một số lượng số 0 vào trước số thay vì chèn khoảng trống. Cờ dấu trừ “-” sẽ canh lề trái các chữ số.
#0000000001
#0000000012
#0000000123
#0000001234
#0000012345
#1
#12
#123
#1234
#12345
#etc https://blog.udemy.com/ruby-sprintf/
#---------- if/else/..
x=1
if x > 2
   puts "x is greater than 2"
elsif x <= 2 and x!=0
   puts "x is 1"
else
   puts "I can't guess the number"
end
#kq: x is 1
#unless
x=1
unless x>2
   puts "x is less than 2"
 else
  puts "x is greater than 2"
end
#kq x is less than 2
#case
$age =  5
case $age
when 0 .. 2
    puts "baby"
when 3 .. 6
    puts "little child"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "youth"
else
    puts "adult"
end
# kq: little child

#------------------- array
#có thể dùng pt new để tạo mảng (mảng là 1 đối tượng)
arr = Array.new
 
arr.push 1        #Phương thức push sẽ thêm một phần tử vào cuối mảng.
arr.push 2
 
puts arr
#-------------
#Phương thức new có thể nhận một vài tham số khi khởi tạo.
a2 = Array.new 3           #Tham số đầu tiên là số lượng phần tử mảng, sẽ tạo một mảng có 3 phần tử là các đối tượng nil.
a3 = Array.new 6, "coin"   #Tham số thứ 2 là giá trị mặc định, sẽ tạo một mảng có 6 phần tử với mỗi phần tử là một string có giá trị là “coin”.
a4 = Array.new [11]        #khởi tạo các phần tử và giá trị luôn bằng cặp dấu ngoặc vuông []. tạo một mảng có một phần tử là số 11.
#--------------------
#Mỗi phần tử trong Ruby có thể mang bất kì kiểu dữ liệu nào, các phần tử cũng không cần phải có kiểu dữ liệu giống nhau.
arr2 = [1, -1, "big", 3.4, Empty.new, arr1, :two]

#------------
arr = [1, 2, 3, [2, 4, 6, [11, 12]]]
 
puts arr.length      #Phương thức length sẽ trả về 4 vì một mảng lồng trong một mảng khác cũng chỉ tính là một phần tử.
puts arr[0], arr[1]  #Toán tử [] sẽ lấy giá trị của các phần tử mảng tương ứng. Trong dòng code trên chúng ta in ra giá trị của phần tử thứ 0 và thứ 1.
                     #kq: 1 2
puts arr[3][0]       
puts arr[3][1]
#Để lấy giá trị của phần tử nằm trong mảng con bên trong thì chúng ta lại dùng thêm một toán tử [] khác nữa. Ở đây [3][0] tức là lấy phần tử đầu tiên của phần tử thứ 4 trong mảng [2, 4, 6, [11, 12]] (vì chỉ số được đánh từ 0).
#kq 2 4
puts arr[3][3][0]
puts arr[3][3][1]
#kq: 11 12
#------- in mang
puts arr             #in các phần tử mảng trên từng dòng.
puts arr.inspect     #inspect in các phần tử mảng trong cặp dấu [], mỗi phần tử ngăn cách nhau bởi dấu phẩy.
#nhu puts 
arr.each do |e|
    puts e           
end
#----- truy xuat
alpha = %w{ a b c d e f g h} # tạo nhanh một mảng chứa các phần tử là chuỗi ,%w{a b} tương đương với ['a', 'b']
puts alpha.first              #lấy phần tử đầu
puts alpha.last               #lấy phần tử cuối
puts alpha.at(3)              #lấy phần tử thứ i
puts alpha[0]                 #dùng toán tử [] để lấy phần tử
puts alpha[-1]                #số âm duyệt từ cuối mảng
puts alpha[0, 3].inspect      # lấy n phần tử từ vị trí i
puts alpha[2..6].inspect      #lấy các phần tử từ vị trí n đến vị trí i
puts alpha.values_at(1, 3, 5).inspect        #phương thức values_at để lấy nhiều phần tử tại những vị trí riêng biệt
puts alpha.slice(0)           #phương thức slice có chức năng và cách dùng y hệt như toán tử [].
#----- một số phuog thức thao tác trên mảng
#eql so sánh 2 mảng và trả về True nếu 2 mảng bằng nhau
#dup để tạo ra một mảng mới copy từ mảng gốc
#empty? cho biết mảng có rỗng hay không
#Phương thức reverse sẽ đảo ngược các phần tử trong mảng
#Phương thức index i trả về chỉ số của phần tử đầu tiên có giá trị i
#Phương thức rindex giống index nhưng duyệt từ cuối mảng
#Phương thức include? cho biết một giá trị có tồn tại trong mảng hay không, phương thức này trả về True nếu có và False nếu ngược lại.
puts arr.join '-' #Phương thức join sẽ tạo một chuỗi string có các phần tử ngăn cách nhau bởi kí tự được truyền vào
#Phương thức uniq! sẽ loại bỏ các phần tử có giá trị giống nhau.
#---------- thêm phần tử
alpha = []
alpha.insert 0, 'E', 'F', 'G'
#Phương thức insert sẽ thêm các phần tử vào vị trí được chỉ định, trong đoạn code trên chúng ta thêm 3 kí tự E, F, G vào vị trí 0 nhưng vì mỗi vị trí chỉ có một phần tử nên F, G sẽ ở vị trí 1 và 2.
alpha.push 'I', 'J', 'K'         #thêm vào cuối mảng
alpha << 'L' << 'M'              #giống push
alpha.unshift 'A', 'B', 'C'      #ngược lại với phương thức push là chèn các phần tử mới vào đầu mảng.
puts alpha.inspect
#------- del phần tử
alpha.pop            #Phương thức pop xóa phần tử cuối cùng của mảng.
alpha.shift          #Phương thức shift xóa phần tử đầu tiên của mảng.
alpha.delete_at(0)   #delete_at(i) sẽ xóa phần tử tại vị trí thứ i
alpha.clear          #clear sẽ xóa toàn bộ mảng
alpha.delete('d')    #Phương thức delete(i) xóa phần tử có giá tị là i.
#-------- sắp xếp mảng
arr = %w{ Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto }
                
puts "#{arr.sort}"               #sắp xếp các phần tử từ bé đến lớn, hoặc theo thứ thự bảng chữ cái nếu các phần tử là kiểu chuỗi.
puts "#{arr.reverse}"            #sắp xếp theo thứ tự ngược lại
puts "#{arr.shuffle}"            #shuffle sẽ xáo trộn vị trí các phần tử một cách ngẫu nhiên

#------------------- hash bảng băm
#Để tạo một đối tượng bảng băm thì chúng ta có thể dùng phương thức new với lớp Hash.
hash = Hash.new
hash[1] = "Jane"
hash.store(2, "Thomas")
#Để tạo các phần tử trong bảng băm thì chúng ta có thể dùng toán tử [] với tên khóa bên trong. 
#Ở trên chúng ta dùng khóa là các số nguyên, nhưng nếu muốn chúng ta có thể dùng khóa là các kí tự. 
#Ngoài ra lớp Hash còn có phương thức store để tạo các phần tử của bảng băm tương tự như toán tử [].
puts hash  #Phương thức puts sẽ in các phần tử của bảng băm ra trong cặp dấu {}. Các phần tử của bảng băm sẽ được in theo dạng <khóa> => <giá trị>.

#Chúng ta có thể tạo nhanh các phần tử của bảng băm bằng theo cú pháp {<khóa>=><giá trị>}.
hash = { "de" => "Germany",
         "sk" => "Slovakia"
       }
puts hash["de"]   #Chúng ta có thể in từng giá trị của từng phần tử nhất định thông qua khóa của chúng với toán tử [].

#------ các thao tác trên bảng băm
hash = Hash.new
 
hash[1] = "Jane"
hash[2] = "Thomas"
hash[3] = "Robert"

puts "Hash size: #{hash.size}"      #sẽ trả về số lượng phần tử của bảng băm.
 
puts hash.keys.inspect              #sẽ trả về danh sách các khóa 
puts hash.values.inspect            #sẽ trả về danh sách các giá trị 

hash2 = hash.dup                    #sẽ tạo một bảng băm khác có các phần tử giống như bảng băm gốc.
puts hash.eql? hash2                #cho biết 2 bảng băm có các cặp khóa-giá trị giống nhau hay không.
puts hash.empty?                    #cho biết bảng băm có rỗng hay không, dòng code trên sẽ trả về false.
hash.clear                          #xóa toàn bộ bảng băm

#------------------
hash = { :de => "Germany", 
    :sk => "Slovakia",
    :no => "Norway", 
    :us => "United States"
 }
 
puts hash.has_key? :de
puts hash.include? :no
puts hash.key? :me
puts hash.member? :sk
 #Phương thức has_key?, include?, key? và member? đều kiểm tra xem một khóa nào đó có tồn tại trong bảng băm hay không.
puts hash.has_value? "Slovakia"
puts hash.value? "Germany"
#Phương thức has_value? và value? cho biết giá trị nào đó có tồn tại trong bảng băm hay không.
puts hash.fetch :de                 #fetch nhận vào khóa và trả về giá trị.
puts hash[:sk]                      # trả về giá trị với khóa được chỉ định.
puts hash.values_at :de, :no, :us   #sẽ trả về các phần tử có khóa được chỉ định.
#---- duyet bang bam
hash.each { |k, v| puts "Key: #{k}, Value: #{v}" }
#Phương thức each sẽ duyệt qua toàn bộ từng phần tử trong bảng băm, mỗi lần duyệt chúng ta thực thi đoạn lênh bên trong cặp dấu {}. 
#Trong đó |k, v| đại diện cho khóa và giá trị, k và v chỉ là những cái tên thay thế, chúng ta có thể dùng tên bất kì do chúng ta đặt như |key, value|...    
hash.each_key { |key| puts "#{key}" }         #sẽ duyệt qua từng phần tử nhưng chỉ lấy khóa chứ không thể lấy được giá trị của từng khóa.
hash.each_value { |val| puts "#{val}" }      #duyệt qua từng phần tử và lấy giá trị, không lấy khóa.
hash.each_pair { |k, v| puts "Key: #{k}, Value: #{v}" }   #giống each
#---- xóa
hash.delete :de         #xóa phần tử có khóa được chỉ định.
hash.shift              #sẽ xóa phần tử ở vị trí đầu tiên
#---- gộp
hash1 = Hash.new
 
hash1[1] = "Jane"
hash1[2] = "Thomas"
 
hash2 = Hash.new
 
hash2[3] = "Robert"
hash2[4] = "Julia"
 
hash = hash1.merge hash2     
puts hash
 
hash = hash1.update hash2
puts hash
#merge và update se gop 2 bảng băm vào nhau

#----------------------- module
#Một module là một tập các phương thức, lớp, hằng số, do đó module cũng gần giống như lớp vậy, chỉ khác là module không thể tạo các đối tượng và không thể thừa kế.
#Thường thì chúng ta sẽ gộp các lớp, phương thức và hằng số có liên quan với nhau vào một module để tránh xung đột tên. 
#Nếu bạn đã từng làm việc với C# và Java thì có thể nói module trong Ruby tương đương với namespace trong C# và package trong Java vậy.
#Ngoài ra chúng ta còn có thể sử dụng module trong Ruby để thực hiện đa thừa kế nữa.
puts Math::PI
puts Math.sin 2
#Math là một module có sẵn trong Ruby, module này chứa các hằng số và phương thức hỗ trợ thực hiện các phép tính toán học. 
#Ở đoạn code trên chúng ta in ra hằng số PI và dùng phương thức sin.
include Math
puts PI
puts sin 2
#Nếu không muốn ghi tên module ra trực tiếp thì chúng ta có thể sử dụng từ khóa include Math để báo cho Ruby biết là chúng ta sẽ dùng module Math.
#vd
module Forest
  
    class Rock ; end
    class Tree ; end
    class Animal ; end   
     
end
 
module Town
     
   class Pool ; end
   class Cinema ; end
   class Square ; end
   class Animal ; end
         
end
 
 
p Forest::Tree.new
p Forest::Rock.new
p Town::Cinema.new
 
p Forest::Animal.new
p Town::Animal.new
#Để truy xuất một đối tượng trong một module thì chúng ta dùng toán tử ::
#Như bình thường thì chúng ta không thể định nghĩa 2 lớp có tên giống nhau trong một file được. 
#Nhưng ở đây chúng ta sử dụng thêm cả module nữa nên có thể định nghĩa 2 lớp có tên giống nhau trong một file.

#vd2

module Device
    def switch_on ; puts "on" end   
    def switch_off ; puts "off" end
end
 
module Volume
    def volume_up ; puts "volume up" end   
    def vodule_down ; puts "volume down" end
end
 
module Pluggable
    def plug_in ; puts "plug in" end   
    def plug_out ; puts "plug out" end
end
 
class CellPhone
    include Device, Volume, Pluggable
    
    def ring
        puts "ringing"
    end   
end
 
cph = CellPhone.new
cph.switch_on
cph.volume_up
cph.ring

#Đa thừa kế tức là một lớp có thể thừa kế từ nhiều lớp khác, chúng ta có thể sử dụng module của Ruby để thực hiện đa thừa kế.
#do đã include cả 3 module nên khi không cần gội ten của module đó khi gọi phương thức

#---- Exception lỗi ngoại lệ
#vd
x = 35
y = 0
 #Những câu lệnh mà có khả năng giải phóng exception sẽ được đặt trong cặp từ khóa begin...end.
begin
    z = x / y
    puts z
rescue => e
    puts "Error: #{e}"
end
#Để có thể bắt lỗi thì chúng ta dùng từ khóa rescue theo sau là dấu => rồi đến tên tham số đối tượng exception. 
#Các đối tượng exception sẽ chứa một chuỗi mô tả về tên lỗi exception đã xảy ra. Chúng ta có thể dùng phương thức puts để in đoạn chuỗi đó ra.

#vd2
age = 17
 
begin
    if age < 18
        raise "Under 18 is not allowed"  #Chúng ta có thể tự giải phóng một lỗi exception bằng cách dùng từ khóa raise.
    end
 
    puts "Allowed"
rescue => e
    puts e  #chỉ in đoạn chuỗi mô tả lỗi 
    p e    #in cả tên lớp exception và đoạn chuỗi mô tả.
ensure
    exit 0  #
end
#Theo sau từ khóa raise chúng ta đưa vào tham số là một chuỗi, Ruby sẽ tạo một đối tượng RuntimeException và truyền vào đó chuỗi này. 
#Khi một exception được giải phóng, chương trình sẽ bị ngắt ngay tại đó.
#Nếu không có câu lệnh rescue để bắt lỗi thì chương trình sẽ thoát luôn, còn ở đây chúng ta có câu lệnh bắt lỗi nên chương trình sẽ tiếp tục thực thi những gì có trong câu lệnh này.
#những câu lệnh nằm sau từ khóa ensure sẽ được thực thi cho dù có xảy ra lỗi hay không. Từ khóa ensure có tác dụng giống như từ khóa finally trong các ngôn ngữ như C#, Java…
#--- tự định nghĩa lớp exception
class NotOver18Exception < StandardError
end
#Một lớp exception phải được kế thừa từ lớp StandardError, trong ví dụ này chúng ta định nghĩa lớp NotOver18Exception kế thừa từ lớp StandardError.
raise NotOver18Exception, "Under 18 is not allowed"
#Để giải phóng lỗi thì chúng ta đưa thêm tên lớp vào sau từ khóa raise, rồi đến đoạn chuỗi mô tả lỗi.

#---------- i/o
#---- xuất
#Hai phương thức print và puts là 2 phương thức xuất dữ liệu là các chuỗi text ra màn hình, trong đó phương thức puts sẽ in chuỗi rồi xuống dòng còn phương thức print thì không.
p "Lemon"
#Phương thức p sẽ gọi phương thức inspect của đối tượng. Phương thức inspect là một phương thức của lớp Object, thường thì phương thức này sẽ in ra tên lớp cùng các thông tin liên quan.
printf "There are %d apples\n", 3
#Phương thức printf in chuỗi và cho phép truyền tham số vào trong chuỗi.
putc 'K'
putc 0xA
#Phương thức putc chỉ đơn giản là in một kí tự ra màn hình. Giá trị 0xA là giá trị của kí tự xuống dòng trong bảng mã ASCII. Tức thay vì ở đây chúng ta dùng putc "\n" thì chúng ta có thể in 0xA thay thế.
#neu thêm nhiều ký tự putc vẫn in ra 1 ký tự đầu

#--- nhập
print "Enter a string: "
str = gets
puts "String size: #{str.size}"
#Phương thức gets sẽ nhận một chuỗi nhập vào từ bàn phím. Khi chạy chương trình, đến đoạn gọi phương thức gets thì chương trình sẽ dừng lại chờ chúng ta gõ một chuỗi nào đó rồi bấm ENTER thì chuỗi đó sẽ được truyền vào biến name.
#nếu str là 'abc' thì kq sẽ là 4 do đếm luôn ENTER
#Để loại bỏ kí tự ENTER này ra khỏi chuỗithì chúng ta dùng phương thức chomp.
str = gets.chomp

#---- file
#- ghi
#vd
f = File.open('C:\\output.txt', 'w') #mở file với chế độ là w (write)
f.puts "The Ruby tutorial"
f.close

#vd2
File.open('C:\\output.txt', 'w') do |f|
    
    f.puts "Ruby"
    f.write "Java\n"
    f << "Python\n"
     
end
#Nếu chúng ta mở file trong khối lệnh File.open()...end thì sau khi kết thúc chúng ta không cần phải đóng file nữa mà Ruby sẽ tự đóng cho chúng ta.
#--- một số phương thức hỗ trợ
puts File.exists? 'C:\\tempfile'          #kiểm tra xem một file có tồn tại hay không.
 
f = File.new 'C:\\tempfile', 'w'          #new sẽ tạo một file mới trên đĩa cứng.
puts File.mtime 'C:\\tempfile'            #mtime lấy thời gian chỉnh sửa file lần cuối cùng.
puts f.Size                               # trả về kích thước của file.
 
File.rename 'C:\\tempfile', 'C:\\tempfile2'  #rename sẽ đổi tên file.
 
f.close

#- đọc
f = File.open("C:\\input.txt")      #không đưa vào tham số chế độ mở là vì mặc định Ruby sẽ mở file theo chế độ đọc.
 
while line = f.gets do
    puts line
end
 
f.close
#Phương thức gets sẽ đọc từng dòng dữ liệu trong file, chúng ta lưu dữ liệu đó trong biến line, 
#vòng lặp while có tác dụng kiểm tra xem biến line có rỗng hay không, tức là trong khi file vẫn còn dữ liệu để đọc thì chúng ta thực hiện đoạn code bên trong vòng lặp.

file = 'C:\\input'
 
File.readlines(file).each do |line|
    puts line
end
#Ngoài phương thức gets có chức năng đọc từng dòng thì còn có phương thức readlines sẽ đọc tất cả các dòng trong file và lưu vào một mảng.

#----- thư mục
Dir.mkdir "tmp"            #Phương thức mkdir sẽ tạo một thư mục mới.    
puts Dir.exists? "tmp"     #Phương thức exists? kiểm tra xem một thư mục có tồn tại hay không.
 
puts Dir.pwd            #Phương thức pwd in ra đường dẫn đến thư mục hiện tại. Đây là thư mục chứa file code Ruby mà chúng ta đang viết.
Dir.chdir "tmp"         #chdir thay đổi thư mục hiện tại thành thư mục khác
puts Dir.pwd
 
Dir.chdir '..'          #dấu ".." tức là lùi về thư mục cha.
puts Dir.pwd
Dir.rmdir "tmp"         #rmdir sẽ xóa một thư mục.
puts Dir.exists? "tmp"
