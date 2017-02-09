#nếu chạy bị lỗi thì cài gem tk, gem install tk
#nếu cài gem bị lỗi thì cài http://www.activestate.com/activetcl/downloads
#tải về, giải nén, dùng lênh sudo ./install.sh để cài
#install lại rbenv/ruby, cài lai gem
#--- app đơn giản
require 'tk'
#tạo root-level frame
root = TkRoot.new { title "Hello, World!";
                     #minsize của app
                    minsize(400,400)  }

TkLabel.new(root) do                            #các widget sẽ là con của root
   text 'Hello, World!'       
   foreground 'red'        #màu text
   background "yellow"
   pack('side'=>'left', 'padx'=>10, 'pady'=>10)                 #vị trí các widget
end
- Ruby/Tk: Frame, Button, Label, Entry, CheckButton, RadioButton, ListBox.
TkButton.new(root) {  
  text "EXIT"  
  command { exit }
  background "red"  
  pack('side'=>'right', 'padx'=>55, 'pady'=>100, 'fill'=>'y')  
}
Tk.mainloop          #main GUI event loop.

#quản lý vị trí các widget
#có 3 cách
#---1/pack
require 'tk'
#tạo root-level frame
root = TkRoot.new { title "Hello, World!";
                     #minsize của app
                    minsize(400,400)  }

TkLabel.new(root) do                            #các widget sẽ là con của root
   text 'Hello, World!'       
   foreground 'red'        #màu text
   background "yellow"
   pack('side'=>'left', 'padx'=>10, 'pady'=>10)                 #vị trí các widget
end

TkButton.new(root) {  
  text "EXIT"  
  command { exit }
  background "red"  
  pack('side'=>'right', 'padx'=>10, 'pady'=>10, 'fill'=>'y', 'expand'=>1)  
}
Tk.mainloop

#các option của pack
#expand: xác định widget có tự fill các khoảng trống không (như canh giữa), 1 là có, defaul là 0
#fill: dàn hết các khoảng trống mà widget có, các option: x, y, both
#side: vị trí theo tọa độ x, y, xác định bởi của sổ cha.

#---2/grid
require 'tk'

top = TkRoot.new {title "Label and Entry Widget"}

#code to add a label widget
lb1=TkLabel.new(top){
   text 'Hello World'
   background "yellow"
   foreground "blue"
   grid('row'=>0, 'column'=>0)
}

#code to add a entry widget
e1 = TkEntry.new(top){
   background "red"
   foreground "blue"
   grid('row'=>1, 'column'=>2)
}
Tk.mainloop
#tạo 1 lưới hàng/cột

#---3/place
#gắn widget vào 1 vị trí xác định, có thể là absolute hoặc relative so với cha.
require 'tk'

top = TkRoot.new {title "Label and Entry Widget"}

#code to add a label widget
lb1=TkLabel.new(top){
   text 'Hello World'
   background "yellow"
   foreground "blue"
   place('x'=>0.0,'y'=>0.0)
}

#code to add a entry widget
e1 = TkEntry.new(top){
   background "red"
   foreground "blue"
   place('relx'=>0.4,'rely'=>0.0)
}

Tk.mainloop

#dùng x/y với absolute, relx/rely với relative

#----- tkClass --------------------------------------
#tkFrame: tạo 1 khung để chứa các widget

require "tk"

f1 = TkFrame.new {
  relief 'sunken'				#kiểu 3-d border
  borderwidth 10
  background "red"
  padx 50
  pady 20
  pack('side' => 'left')
  cursor "watch"				#kiểu con trỏ
}
f2 = TkFrame.new {
  relief 'groove'
  borderwidth 20
  background "yellow"
  padx 10
  pady 10
  pack('side' => 'right')
}

TkButton.new(f1) {
  text 'Button1'
  command {print "push button1!!\n"}
  pack('fill' => 'x')
}
TkButton.new(f1) {
  text 'Button2'
  command {print "push button2!!\n"}
  pack('fill' => 'x')
}
TkButton.new(f2) {
  text 'Quit'
  command 'exit'
  pack('fill' => 'x')
}
Tk.mainloop

#-----tkButton
require 'tk'

def myproc
  puts "The user says OK."
  exit
end

root = TkRoot.new
btn_OK = TkButton.new(root) do
  text "OK"
  borderwidth 5
  underline 0
  state "normal"
  cursor "watch"
  font TkFont.new('times 20 bold')
  foreground  "red"
  activebackground "blue"
  relief      "groove"
  command (proc {myproc})
  height 2
  width 6
  pack("side" => "right",  "padx"=> "50", "pady"=> "10")
end
Tk.mainloop

#các opt:
#state: có 3 state là normal, active, disabled. 
#-Normal: hiển thị foreground và background option.
#-Active: hiển thị activebackground và activeforeground, active thường dùng khi con trỏ ra khỏi btn
#-Disabled: disable btn.
#width/height: kích cỡ btn

#--- tkLabel
require 'tk'

$resultsVar = TkVariable.new
root = TkRoot.new
root.title = "Window"
Lbl = TkLabel.new(root) do
  textvariable						#biến text
  borderwidth 5
  font TkFont.new('times 20 bold')
  foreground  "red"
  height 100
  width 200
  relief      "groove"
  pack("side" => "right",  "padx"=> "50", "pady"=> "50")
end

Lbl['textvariable'] = $resultsVar
$resultsVar.value = 'New value to display'

Tk.mainloop
#width/height: kích co phan bao txt

#---entry
#ô nhập text (single-line)
require 'tk'

def myproc
  puts "focus"
  exit
end

root = TkRoot.new
root.title = "Window"

entry1 = TkEntry.new(root)
entry2 = TkEntry.new(root) do
     show '*'
     disabledforeground 'blue'
     state 'normal'
    
end

variable1 = TkVariable.new
variable2 = TkVariable.new
entry1.textvariable = variable1
entry2.textvariable = variable2
variable1.value = "Enter any text value"
variable2.value = "Enter any confidential value"

entry1.place('height' => 25,
            'width'  => 150,
            'x'      => 10,
            'y'      => 10)

entry2.place('height' => 25,
            'width'  => 150,
            'x'      => 10,
            'y'      => 40)
puts "#{entry1.get}"
Tk.mainloop

#một số opt cho entry
#show: biến string text thành chuỗi ký tự mong muốn (như * của pw)
#state: có 3 lựa chọn
#-normal
#-readonly: chỉ đọc, con trỏ sẽ mất, không thể thay đổi text bằng command
#-disabled: nhưng readonly, nhưng không chọn được (copy), màu có thể khác (disabledforeground)

#tkCheckbtn
require 'tk'

root = TkRoot.new
root.title = "Window"
$var = TkVariable.new
CkhButton1 = TkCheckButton.new(root) do
  text "Orange"
  indicatoron "true"
  background  "red"
  relief "groove"
  variable $var
  height 2
  width 2
  onvalue 'Orangee'
  offvalue 'eegnarO'
  command {puts "#{$var}"}
  place('height' => 25,'width'  => 100, 'x' => 10, 'y'=> 10)
   selectcolor "blue"   #màu ô select

end
CkhButton2 = TkCheckButton.new(root) do
  text "Banana"
  background  "red"
  relief "groove"
  height 2
  width 2
  variable $var
  onvalue 'Bananaaa'
  offvalue 'aaaanaB'
  place('height' => 25,'width' => 100, 'x' => 10, 'y'=> 40)
  command {puts "#{$var}"}
end

Tk.mainloop

#onvalue: giá trị của button đó khi chon, defaul là 1
#offvalue: giá trị của button đó khi bỏ chon, defaul là 1
#state giống button

#---checkButton
require "tk"

def print_v
  print $v, "\n"
end

$v = TkVariable.new {
	compound 'above'
}

TkRadioButton.new {
  text 'top'
  variable $v
  value 'top'
  anchor 'w'
  pack('side' => 'top', 'fill' => 'x')
}
TkRadioButton.new {
  text 'middle'
  variable $v
  value 'middle'
  anchor 'w'
  pack('side' => 'top', 'fill' => 'x')
}
TkRadioButton.new {
  text 'bottom'
  variable $v
  value 'bottom'
  anchor 'w'
  pack('side' => 'top', 'fill' => 'x')
}

TkButton.new {
  text 'Quit'
  command 'exit'
  pack
}

Tk.root.bind "1", proc{print_v}

Tk.mainloop

#tương tự checkbutton

#---tkListbox
require "tk"

root = TkRoot.new
root.title = "Window"
list = TkListbox.new(root) do
  width 20
  height 10
  activestyle 'underline'
  setgrid 1
  selectmode 'single' 
  pack('fill' => 'x')
end

list.insert 0, "yellow", "gray", "green",
  "blue", "red", "black", "white", "cyan",
  "pink", "yellow", "orange", "gray"
list.bind("ButtonRelease-1") {
   index = list.curselection[0]
   puts list.get index
   
}
Tk.mainloop


#activestyle: kiểu chọn, có 3 kiểu là none, underline, dotbox
#selectmode: kiểu chọn, có 4 kiểu là single, browse, multiple, extended
#thường sử dụng browse cho chon 1 phần tử, extended cho nhiều phần tử
#state: 2 kiểu là disabled, normal. Khi ở trạng thái disabled listbox không thể thếm xóa dữ liệu

#thao tác với listbox
#curselection: return về chỉ số của các phần tử được chọn
#insert idx item: thêm items
#delete item: xóa item
#get item: lấy content của item đó
#size: return số lượng item

#sử dụng listvariable để thêm vào listbox
#vd
require "tk"

$names = %w{ yellow gray green
              blue red black white cyan
              pink yellow orange gray}
$colornames = TkVariable.new($names)

root = TkRoot.new
root.title = "Window"

list = TkListbox.new(root) do
  width 20
  height 10
  setgrid 1
  listvariable $colornames
  pack('fill' => 'x')
end

Tk.mainloop

#kết hợp với scrollbar
require "tk"

$names = %w{ yellow gray green
              blue red black white cyan
              pink yellow orange gray}
$colornames = TkVariable.new($names)

root = TkRoot.new
root.title = "Window"

list = TkListbox.new(root) do
  listvariable $colornames
  pack('fill' => 'x')
end

list.place('height' => 150,
           'width'  => 100,
           'x'      => 10,
           'y'      => 10)

scroll = TkScrollbar.new(root) do
    orient 'vertical'
    place('height' => 150, 'x' => 110)
end

list.yscrollcommand(proc { |*args|
  scroll.set(*args)
})

scroll.command(proc { |*args|
  list.yview(*args)
}) 

Tk.mainloop


#----tkCombobox
#kết hợp giữa tkentry và tklistbox
require 'tk'
require 'tkextlib/bwidget'

root = TkRoot.new
root.title = "Window"

combobox = Tk::BWidget::ComboBox.new(root)
combobox.values = [1, 2, 3, 4]
combobox.place('height' => 25,
               'width'  => 100,
               'x'      => 10,
               'y'      => 10)

Tk.mainloop


#----- tkMessagebox
require 'tk'

root = TkRoot.new
root.title = "Window"

msgBox = Tk.messageBox(
  'type'    => "ok",  
  'icon'    => "info", 
  'title'   => "This is title",
  'message' => "This is message"
)
Tk.mainloop

#type: các opt  abortretryignore, ok, okcancel, retrycancel, yesno, or yesnocancel.
#type quyết định btn nào sẽ show
#icon: error, info, question, or warning.
#details: mô tả chi tiết
#mesage: mô tả
#title: tiêu đề

#------ TkScrollbar
require "tk"
root = TkRoot.new
root.title = "Window"
list = scroll = nil

list = TkListbox.new(root) {
  yscroll proc{|*idx|
   scroll.set *idx
  }
  width 20
  height 16
  setgrid 1
  pack('side' => 'left', 'fill' => 'y', 'expand' => 1)
}
scroll = TkScrollbar.new(root) do
   orient 'vertical'
   command proc{|*idx|
   list.yview *idx
  }

  pack('side' => 'left', 'fill' => 'y', 'expand' => 1)
end

for f in Dir.glob("*")
  list.insert 'end', f
end

Tk.mainloop

#------- tkScale
require "tk"

$scale = TkScale.new {
  orient 'vertical'
  length 280
  from 10
  to 400
  digits 2
  command (proc {printheight})
  tickinterval 40
  pack
  label 'sdasdds adsads '
  resolution 11
  showvalue false
  sliderlength 30
  sliderrelief 'sunken'
}

def printheight
  height = $scale.get()
  a = coords(10)
  b = identify(2, 2)
  print height, "\n"
  puts a
  puts b
end

Tk.mainloop

#form: bắt đầu khoảng (range)
#to: kết thúc khoảng
#label: nếu scale là vertical thì lebel sẽ nằm bên phải trên cùng của scale
#nếu là horizontal sẽ nằm phía trên ngoài cùng bên trái của scale
#length: độ dài của scale
#resolution: giá trị thay đổi mỗi lần
#vd: 1 khaongr 10-50, resolution 5, mỗi lần kéo giá trị sẽ nhảy 5 giá trị
#showvalue: ẩn hiện giá trị khi kéo scale, mặc định là true
#sliderlength: độ dài của slider (cục để kéo trên scale)
#sliderrelief: kiểu hiển thi của slider như là sunken, raised
#state: normal, active,disabled
#tickinterval: khoảng giữ 2 số, nếu 0 thì sẽ không hiển thị trên scale

#---tkText
require 'tk'

root = TkRoot.new
root.title = "Window"

text = TkText.new(root) do
  width 30
  height 20
  borderwidth 1
  spacing1 5
  tabs 'right'
  font TkFont.new('times 12 bold')
   pack("side" => "right",  "padx"=> "5", "pady"=> "5")
end
text.insert 'end', "Hello!\n\ntext widget example"
Tk.mainloop

#spacing1: khoảng cách phía trên mỗi dong text (enter)
#spacing2: khoảng cách giữa các dong text line warps (dài quá text xuống hàng)
#spacing3: khoảng cách phía dưới mỗi dòng text (enter), nếu là line warps từi chỉ sẽ có tác dụng với line cuối
#state: normal, disabled
#warp: hiển thị text line khi quá dài, có 3 opt
#-none: không tự xuống hàng
#-word: xuống cả từ
#-char: chỉ xuống char

#----- tkToplevel
require 'tk'

def make_win
  begin
	$win.destroy
  rescue
  end
  $win = TkToplevel.new
  TkButton.new($win) {
	text 'Window Dismiss'
	command "$win.destroy"
	pack
  }
end

TkButton.new {
  text 'make Window'
  command 'make_win'
  pack('fill' => 'x')
}

Tk.mainloop

#------ tkSpinbox
require 'tk'

root = TkRoot.new
root.title = "Window"
sb = TkSpinbox.new(root) do
  to 10000
  from 500
  increment 4

  buttoncursor "bottom_tee"
  buttondownrelief "raised"
  pack("side" => "left",  "padx"=> "50", "pady"=> "50")
end
sb.bind("1"){
   sb.delete(1, 2)
   puts sb.get()
}
Tk.mainloop

#buttoncursor: đổi icon con trỏ vd: based_arrow_down, bottom_tee
#xem thêm https://www.tcl.tk/man/tcl8.4/TkCmd/cursors.htm
#from/to: bắt đầu/ kết thúc range
#increment: số đơn vị mỗi lần tăng
#state: normal, disabled, readonly
#values: hiển thị khi vừa load, default là form
#delete(index1, index2): xóa ở trong khoảng index1-index2
#get: return về giá trị của spinbox
#insert(index, string): thêm string vào trước char có index dc truyền vào

#------- ProgressBar

require 'tk'
require 'tkextlib/bwidget'

root = TkRoot.new
root.title = "Window"
$var = 10
variable = TkVariable.new

progressBar = Tk::BWidget::ProgressBar.new(root)
progressBar.variable = variable
progressBar.maximum = 100
progressBar.place('height' => 25,
                  'width'  => 100,
                  'x'      => 10,
                  'y'      => 10)
root.bind("1"){
   $var = $var + 1 
   variable.value = $var
   puts variable.value
}
Tk.mainloop

#------Standard Dailog Box 
#Tk.getOpenFile: cửa sổ open file.

#Tk.getSaveFile: cửa sổ save file.

#Tk.chooseDirectory: cửa sổ chọn đường dẫn.

#Tk.chooseColor: cửa sổ chọn màu.
require 'tk'

root = TkRoot.new
root.title = "Window"

button_click = Proc.new {
  Tk.chooseColor
}

button = TkButton.new(root) do
  text "button"
  pack("side" => "left",  "padx"=> "50", "pady"=> "50")
end

button.comman = button_click

Tk.mainloop

#----- tkNotebook
#nhiều tab trên 1 frame
require 'tk'
require 'tkextlib/tile'

root = TkRoot.new
root.title = "Window"

n = Tk::Tile::Notebook.new(root)do
  height 110
  place('height' => 100, 'width' => 200, 'x' => 10, 'y' => 10)
end

f1 = TkFrame.new(n)

f2 = TkFrame.new(n)

f3 = TkFrame.new(n)

n.add f1, :text => 'One', :state =>'disabled'
n.add f2, :text => 'Two'
n.add f3, :text => 'Three'

button_getOpenFile = Proc.new {
  Tk.getOpenFile
}

button_chooseDirectory = Proc.new {
  Tk.chooseDirectory
}

button1 = TkButton.new(f2) do
  text "getOpenFile"
  pack
end

button2 = TkButton.new(f3) do
  text "chooseDirectory"
  pack
end

button1.comman = button_getOpenFile
button2.comman = button_chooseDirectory

Tk.mainloop

#add: thêm frame mới
#text: tiêu đề của tab
#state: normal, disabled, hidden

