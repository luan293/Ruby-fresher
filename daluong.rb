#thread
Thread.new {
  # Thread #2 runs this code
}#tạo thread mới

Thread.join #chạy xong thread rồi chạy thread khác

Thread.value #giá trị của khối lệnh sau thread(tác dụng tương tụ join)

Thread.current #trả về luồng hiện thời

Thread.main #trả về đối tượng luồng
def convert_string_to_uppercase str
    sleep(2)
    str.upcase
end

@str1 = "love ruby"
@str2 = "multithreading"
@str3 = "java"

threads = (1..3).map do |i|
  Thread.new(i) do |i|
    strs = instance_variable_get("@str#{i}")
    puts "string#{i} = #{convert_string_to_uppercase(strs)}"
  end
end
threads.each {|t| t.join}

#ngoài cách tạo thread như trên, ta có thể dùng Thread.fork, Thread.start
#không cần khởi chạy thread sau khi tạo, nó tự động khi tài nguyên CPU sẵn sàng
#ngoại lệ
#khi 1 ngoại lệ (exception) xuất hiện trong luồng mà không đc bắt lỗi, 
#luồng sẽ tự động xuất ra thông báo va thoát 
#nếu luồng A thoát vì không bắt lỗi, và luồng B gọi t.join hoặc t.value thì exception ở A sẽ xảy ra ở B
Thread.abort_on_exception = false #default
#kill luồng hiện tại và các luồng còn lại tiếp tục chạy
#nếu muốn trình biên dịch thoát khi có lỗi chưa bắt ở bất cứ luồng nào thì set = true
#- biến luồng
#luồng có thể sử dụng biến cục bộ ở trong block của luồng và biến đó không share cho nơi khác.
#có thể sử dụng Thread.current['tenbien'] để truy cập biến cục bộ của luồng hiện tại
#vd
count = 0
arr = []

10.times do |i|
   arr[i] = Thread.new {
      sleep(rand(0)/10.0)
      Thread.current["mycount"] = count
      count += 1
   }
end

arr.each {|t| t.join; print t["mycount"], ", " }
puts "count = #{count}"

#-thread priority
#hệ số ảnh hưởng đến thread là độ ưu tiên (priority). Thread có priority cao sẽ dc CPU xử lý trc
#có thể set độ ưu tiên của luồng Thread.priority=
#không thể set priority trước khi luồng bắt đầu chạy

#--thread exclusion
#nếu có 2 luồng cùng truy cập 1 data, và ít nhất 1 luồng chỉnh sửa data đó
#sẽ xảy ra Race Conditions (tương tranh)
#vd
class Item
  class << self; attr_accessor :price end
  @price = 0
end

threads = (1..10).map do |i|
  Thread.new(i) do |i|
    item_price = Item.price # Reading value
    sleep(rand(0..2))
    item_price += 10        # Updating value
    sleep(rand(0..2))
    Item.price = item_price # Writing value
  end
end

threads.each {|t| t.join}

puts "Item.price = #{Item.price}"
#kq không chính xác, phải là 100
#để giải quyết ta dùng Mutual Exclusion
class Item
  class << self; attr_accessor :price end
  @price = 0
end

mutex = Mutex.new

threads = (1..10).map do |i|
  Thread.new(i) do |i|
    mutex.synchronize do
      item_price = Item.price # Reading value
      sleep(rand(0..2))
      item_price += 10        # Updating value
      sleep(rand(0..2))
      Item.price = item_price # Writing value
    end
  end
end

threads.each {|t| t.join}

puts "Item.price = #{Item.price}"

#-deadlock
#khi sử dụng mutex cần lưu ý: khi 1 luồng vì 1 lý do gì đó mà không kết thúc
#=> các luồng khác đợi mà không chạy => deadlock
#ta dùng condition variables
#vd
mutex = Mutex.new

cv = ConditionVariable.new
a = Thread.new {
   mutex.synchronize {
      puts "A: I have critical section, but will wait for cv"
      cv.wait(mutex)
      sleep (rand(0..2))
      puts "A: I have critical section again! I rule!"
   }
}

b = Thread.new {
   mutex.synchronize {
      puts "B: Now I am critical, but am done with cv"
      cv.signal
      sleep (rand(0..2))
      puts "B: I am still critical, finishing up"
   }
}
a.join
b.join
#xem thêm các method https://www.tutorialspoint.com/ruby/ruby_multithreading.htm