#Để tạo một đối tượng thì chúng ta phải có lớp, lớp chính là một cái khuôn/bản vẽ/bản thiết kế… để tạo nên các đối tượng.
#Ví dụ khi nói lớp Người thì chúng ta biết rằng một người bao gồm tên, tuổi, màu da, giới tính… có thể ăn, nói, nhảy múa… 
#Còn khi nói đối tượng người thì chúng ta có đối tượng Jack, 23 tuổi, quốc tịch Mỹ, biết hát, đối tượng Jennifer 19 tuổi, quốc tịch Nauy, biết nấu ăn…
class Being
   
end
#Để định nghĩa lớp thì chúng ta dùng cặp từ khóa class...end với tên lớp mà chúng ta muốn đặt sau từ khóa class. 
#Hiện tại lớp này là lớp rỗng, không có gì cả. 
b = Being.new
#Để tạo một đối tượng thuộc lớp Being thì chúng ta ghi tên lớp rồi dùng phương thức new. 
#Phương thức này sẽ trả về địa chỉ tham chiếu đến đối tượng vừa tạo, ở trên chúng ta lưu lại đối tượng này vào biến b.
puts b
#Khi chúng ta gọi phương thức puts lên một đối tượng, phương thức này sẽ gọi phương thức to_s có trong mỗi đối tượng. 
#Trong trường hợp của chúng ta thì do chưa định nghĩa phương thức to_s nên phương thức puts sẽ trả về địa chỉ tham chiếu đến đối tượng.

#--- Phương thức khởi tạo
#Phương thức khởi tạo là một phương thức đặc biệt, phương thức này từ động được gọi khi chúng ta tạo một đối tượng. 
#Phương thức khởi tạo không trả về một giá trị nào cả. 
#Mục đích chính của phương thức khởi tạo chỉ là thiết lập trạng thái cho đối tượng. 
#Tất cả các phương thức khởi tạo trong Ruby đều có tên là initialize.
#vd:
class Being
 
    def initialize
        puts "Being is created"
    end
 
end
 
Being.new
#Trong ví dụ trên chúng ta định nghĩa phương thức khởi tạo. 
#Trong phương thức này chúng ta in một chuỗi string ra màn hình. 
#Khi chúng ta gọi phương thức new, phương thức này sẽ tự động gọi phương thức initialize.
#Để định nghĩa một phương thức thì chúng ta dùng cặp từ khóa def...end với tên phương thức nằm phía sau từ khóa def.

#vd2
class Person
    #nhận vào một biến tham số có tên là name, chúng ta gán giá trị của tham số đó vào biến instance @name.
    def initialize name         
        @name = name
    end
    #trả về giá trị của biến @name. Trong Ruby các biến instance chỉ có thể truy xuất trong các phương thức.
    def get_name
        @name
    end
 
end
 
p1 = Person.new "Jane"          #Để truyền tham số thì chúng ta ghi phía sau tên phương thức khi gọi
p2 = Person.new "Beky"
 
puts p1.get_name
puts p2.get_name
#Thuộc tính của một đối tượng là các biến lưu trữ giá trị của đối tượng đó. Các biến này còn được gọi là biến instance. 
#Mỗi đối tượng đều có thuộc tính của riêng nó, tức là các đối tượng thuộc cùng một lớp thì có các biến instance khác nhau.

#---phuong thuc
#Phương thức thành phần (hay gọi ngắn gọn là phương thức) là các hàm được định nghĩa bên trong một lớp, mục đích của phương thức là thực hiện một công việc nào đó. 
#Thường thì phương thức sẽ làm việc với các thuộc tính của đối tượng. 
#Phương thức rất quan trọng với tính năng đóng gói trong lập trình hướng đối tượng, đóng gói tức là chúng ta không quan tâm phương thức làm những gì mà chỉ quan tâm đến kết quả cuối cùng của phương thức mà thôi.
class Person
 
    def initialize name
        @name = name
    end
 
    def get_name
        @name
    end
 
end
 
per = Person.new "Jane"
 
puts per.get_name           #cách gọi pt 1
puts per.send :get_name     #cách 2

#vd
class Circle
    
    @@PI = 3.141592             #biến class là biến dùng chung cho tất cả các đối tượng.
 
    def initialize
        @radius = 0
    end
 
    def set_radius radius
        @radius = radius
    end
 
    def area
        @radius * @radius * @@PI
    end
 
end
 
c = Circle.new
c2 = Circle.new
c.set_radius 5
c2.set_radius 6
puts c.area
puts c2.area

#-- quyền truy cập
#Quyền truy cập tức là phạm vi truy xuất các thuộc tính và phương thức của mỗi đối tượng. 
#Ruby có 3 loại quyền truy cập là public, protected và private. 
#Trong Ruby, tất cả các thuộc tính đều có quyền truy cập là private và không thể thay đổi được, còn các phương thức thì mặc định có quyền truy cập là public nhưng có thể thay đổi được.
#Quyền truy cập loại public cho phép chúng ta truy cập thành phần của đối tượng ở bên trong lẫn bên ngoài lớp. 
#Quyền protected và private giống nhau ở chỗ đều không cho phép truy cập thành phần của đối tượng ở bên ngoài lớp, khác nhau ở chỗ private không gọi được với từ khóa self, còn protected thì được.
#vd1
class Some
     #mac dinh là public    
     def method1
         puts "public method1 called"
     end
 
    public  #hoặc ghi rõ
     
     def method2
         puts "public method2 called" 
     end
      
     def method3
         puts "public method3 called"
         method1        #public nên có thể truy xuất
         self.method1   #có thể xài self
     end         
end
 
s = Some.new
s.method1
s.method2
s.method3

#vd2
class Some
     
    def initialize
        method1         #chỉ có thể gọi pt privte trong pt định nghĩa 
        # self.method1  #không được dùng self
    end
 
    private     #khai báo private
     
     def method1
         puts "private method1 called" 
     end
            
end
 
 
s = Some.new
# s.method1     #không thể gọi từ bên ngoài

#vd3
class Some
     
    def initialize
        method1         #giống private
        self.method1    #nhưng có thể dùng thêm self
    end
 
    protected    
        def method1
            puts "protected method1 called" 
        end

    public
      def method2
            puts " method2 called" 
            self.method1        #dùng self để gọi khi không ở initialize
      end       
end
 
 
s = Some.new
#s.method1  #không thể goi ngoài class
s.method2

#-- thừa kế
#Thừa kế là tính năng cho phép định nghĩa các lớp dựa trên các lớp đã có. 
#Lớp thừa kế từ một lớp khác được gọi là lớp dẫn xuất, lớp được lớp khác thừa kế lại được gọi là lớp cơ sở. 
#Lớp dẫn xuất thừa hưởng các thành phần của lớp cơ sở và có thể có thêm các thành phần của riêng chúng. 
#Tính năng thừa kế cho phép lập trình viên giảm thiểu sự phức tạp của chương trình.
class Being                             #lớp cơ sở
 
    def initialize
        puts "Being class created"
    end
end
 
class Human < Being                     #kế thừa
 
   def initialize
       super                            #gọi đến hàm cùng tên của lớp cha.
       puts "Human class created"
   end
end
 
Being.new
Human.new

#vd2
#Một lớp có thể có nhiều lớp cơ sở. 
#Mỗi lớp trong Ruby mặc định có phương thức ancestors, phương thức này trả về danh sách các lớp cơ sở của lớp đó. 
#Và mặc định tất cả các lớp trong Ruby đều kế thừa từ một lớp gốc có tên là Object và BasicObject trong module Kernel.
class Being 
end
 
class Living < Being 
end
 
class Mammal < Living 
end
 
class Human < Mammal 
end
     
p Human.ancestors
#kq [Human, Mammal, Living, Being, Object, Kernel, BasicObject]
#Lưu ý là tính năng thừa kế trong Ruby hơi khác so với các ngôn ngữ như C++, C#, Java… 
#ở chỗ là trong các ngôn ngữ khác thì các thành phần public và protected đều được truyền lại từ lớp cha đến lớp con 
#còn thành phần private thì không, nhưng trong Ruby thì cả 3 loại public, protected và private đều được truyền lại 
#cho lớp con, tức là tính năng thừa kế trong Ruby không có liên quan gì đến quyền truy cập cả.

#---super
class Base
    
    def show x=0, y=0
        p "Base class, x: #{x}, y: #{y}"
    end
end
 
class Derived < Base
 
    def show x, y
        super           #gọi đến phương thức cùng tên ở lớp cha.
        super x
        super x, y
        super()
    end
end
 
 
d = Derived.new
d.show 3, 3

#---Truy xuất thuộc tính
#mặc định tất cả các thuộc tính trong Ruby đều là private, tức là chúng ta chỉ có thể truy xuất được thông qua phương thức của đối tượng.
#=> mỗi thuộc tính chúng ta sẽ định nghĩa 2 phương thức là getter và setter
#Đối với Ruby thì có sẵn 3 phương thức tương tự là attr_reader, attr_writer và attr_accessor.
#Phương thức attr_reader sẽ tạo các phương thức getter trong khi phương thức attr_writer sẽ tạo các phương thức setter. Phương thức attr_accessor sẽ tạo cả getter, setter và các biến instance.
class Car
    #Để tạo các phương thức getter thì chúng ta ghi tên phương thức đó dưới dạng Symbol phía sau phương thức.
    attr_reader :name, :price   
    attr_writer :name, :price
  
    def to_s
        "#{@name}: #{@price}"
    end
 
end
 
c1 = Car.new
c2 = Car.new
 #gọi các phương thức setter như gọi các phương thức bình thường, rồi dùng toán tử gán "=" để thiết lập dữ liệu.
c1.name = "Porsche"
c1.price = 23500
 
c2.name = "Volkswagen"
c2.price = 9500
 
puts "#{c1.name}: #{c1.price}"
 
p c1
p c2

#---Hằng số lớp
#Các hằng số được định nghĩa bên trong một lớp có tác dụng giống như biến class vậy, 
#tức là chúng được dùng chung bởi tất cả các đối tượng thuộc lớp đó, chứ không có lớp nào có biến riêng cả.
class MMath
    PI = 3.141592       #Hằng số được đặt tên bắt đầu bằng chữ cái in hoa.
end

puts MMath::PI          #truy xuất giá trị của hằng số thì chúng ta dùng toán tử :: theo sau tên lớp

#--Phương thức to_s
#Tất cả các đối tượng trong Ruby đều có phương thức to_s, phương thức này được kế thừa từ lớp Object gốc trong Ruby. 
#Phương thức trả về một chuỗi string mô tả về đối tượng đó, khi chúng ta dùng phương thức 
#puts để in ra một đối tượng thì phương thức puts sẽ gọi đến phương thức to_s của đối tượng đó.
class Being
    #Nếu chúng ta không định nghĩa lại phương thức to_s thì phương thức puts sẽ gọi phương thức to_s của lớp Object gốc, 
    #mà phương thức to_s gốc sẽ in ra địa chỉ bộ nhớ của đối tượng.
    def to_s
        "This is Being class"
    end
end
 
b = Being.new
puts b.to_s
puts b

#--Operator Overloading: Quá tải toán tử
class Circle
    
    attr_accessor :radius
     
    def initialize r
        @radius = r
    end
   #định nghĩa lớp Circle có toán tử +,  tham số trong cặp dấu ().
    def +(other)
        Circle.new @radius * other.radius
    end
     
    def to_s
        "Circle with radius: #{@radius}"
    end
end
 
#toán tử + có chức năng nhân 2 bán kính của 2 hình tròn.
c1 = Circle.new 5
c2 = Circle.new 6
c3 = c1 + c2
 
p c3

#----Phương thức class
#Các phương thức trong Ruby có 2 loại là phương thức class và phương thức instance, giống như biến cũng có biến class và biến instance vậy. 
#Và chức năng của 2 loại phương thức này cũng giống hệt như đối với biến. 
#Tức là phương thức instance là phương thức của riêng từng đối tượng, trong khi phương thức class là phương thức dùng chung, 
#tất cả các đối tượng được tạo từ cùng một lớp sẽ dùng chung một phương thức class.
#Phương thức class không thể truy xuất các biến instance mà chỉ có thể truy xuất các biến class.
class Circle
     
    def initialize x
        @r = x
    end
    #Phương thức class được định nghĩa bằng cách thêm từ khóa self vào trước tên phương thức.
    def self.info
       "This is a Circle class"
    end
     #đây là phương thức instance vì không chứa từ khóa self
    def area
        @r * @r * 3.141592
    end
 
end
 
 
p Circle.info       #gọi từ tên lớp chứ không gọi từ tên đối tượng.
c = Circle.new 3
p c.area
#Để gọi phương thức instance thì chúng ta phải tạo một đối tượng rồi gọi từ tên đối tượng đó như trước giờ chúng ta vẫn làm.
#-cách định nghĩa pt class khác
class Wood
      
    def self.info       #dùng từ khóa self
       "This is a Wood class"
    end
end
 
class Brick
    #khai báo phần định nghĩa trong khối class << self...end.  
    class << self
        def info
           "This is a Brick class"
        end
    end
end
 
class Rock
      
end
#thay vì dùng từ khóa self thì chúng ta dùng luôn tên lớp 
def Rock.info
   "This is a Rock class"
end
 
p Wood.info
p Brick.info
p Rock.info

#------------đa hình
#Tính đa hình là tính năng cho phép chúng ta thực thi toán tử hay phương thức với nhiều kiểu dữ liệu khác nhau. 
#Khi một lớp thừa kế từ một lớp khác thì lớp con ngoài việc kế thừa lại những gì có ở lớp cha thì có thể định nghĩa lại 
#hoặc mở rộng thêm nữa. Nói một cách tổng quát thì đa hình là tính năng cho phép định nghĩa lại các phương thức ở lớp con.
 
class Animal
     
    def make_noise 
        "Some noise"
    end
 
    def sleep 
        puts "#{self.class.name} is sleeping."
    end
   
end
 
class Dog < Animal
     
    def make_noise 
        'Woof!'        
    end
     
end
 
class Cat < Animal 
     
    def make_noise 
        'Meow!'
    end
end
 
[Animal.new, Dog.new, Cat.new].each do |animal|
  puts animal.make_noise
  animal.sleep
end

#Việc định nghĩa lại phương thức được kế thừa ở lớp cha còn được gọi là override. 
#Ở đây phương thức make_noise được override lại ở 2 lớp Dog và Cat, trong khi ở lớp cơ sở có phương thức sleep nữa nhưng không được override lại.
#Khi chúng ta gọi phương thức make_noise ở lớp con thì Ruby sẽ tìm trong lớp con đó có phương thức đó hay không, 
#nếu có thì dùng phương thức ở lớp con, nếu không thì gọi lên phương thức đó ở lớp cha.