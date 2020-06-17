

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def mouse
    info = @data_source.get_mouse_info(@id)
    price = @data_source.get_mouse_price(@id)
    result = "Mouse: #{[info]} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def cpu
    info = @data_source.get_cpu_info(@id)
    price = @data_source.get_cpu_price(@id)
    result = "Cpu: #{info} ($#{price}"
    return "* #{result}" if price >= 100
    result
  end

  def keyboard
    info = @data_source.get_keyboard_info(@id)
    price = @data_source.get_keyboard_price(@id)
    result = "keyboard: #{info} ($#{price})"
    return "* #{result}" if price >= 100
  end
end


'上記の重複を排除する方法'
'1、動的メソッド'
'2、method_missing'

class MyClass
  def my_method(my_arg)
    my_arg*2
  end
end

obj = MyClass.new
obj.my_method(3) # 6

obj.send(:my_method, 3) # 6

'sendの第一引数はメソッド名 メソッド名にはシンボル、もしくは文字列が使える'

'sendを使うと動的ディスパッチを使える'


class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end
obj = MyClass.new
obj.my_method(2) # 6
'上記のdefine_methodはMyClassのなかで実行される'
'my_methodはMyClassはインスタンスメソッドとして定義'
'実行時にメソッドを定義する技法を動的メソッドと呼ぶ'

'いよいよ一番上のコードをリファクタリング'
'まずはdefキーワードではなくModule#define_method'

'動的ディスパッチを追加する'
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def mouse
    compornent :mouse
  end

  def cpu
    compornent :cpu
  end

  def keyboard
    compornent :keyboard
  end

  def compornent(name)
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    result = "#{name.capitalize}: #{info}($#{price})"
    return "*#{result}" if price >= 100
    result
  end
end

my_computer = Computer.new(42, DS.new)
my_computer.cpu  # Cpu: 2.16 Ghz($220)


'メソッドを動的に生成する'

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.capitalize}: #{info}($#{price})"
      return "*#{result}" if price >= 100
      result
    end
  end

  define_component :mouse
  define_component :cpu
  define_component :keyboard
end

'コードにイントロダクションをふりかける'
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/){Computer.define_component $1}
  end

  def self.define_component(name)
    define_method(name) do
      #
    end
  end
end


'method_missing'

class Lawyer; end
nick = Lawyer.new
nick.talk_simple #NoMethodError (undefined method `talk_simple' for #<Lawyer:0x00007f831a093dd8>)
nick.send :method_missing, :my_method #NoMethodError (undefined method `my_method' for #<Lawyer:0x00007f831a093dd8>)

'method_missingのオーバーライド'
'method_missingをオーバーライドして不明なメッセージを途中で捉えることができる'
'method_missingの受付までたどり付いたメッセージは呼び出されたメソッドの名前を持っている'
'引数とブロックがあればそもれらも持っている'
class Lawyer
  def method_missing(method, *args)
    puts "呼び出した: #{method}(#{args.join(', ')})"
    puts "(ブロックも渡した)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
  # ブロック
end


'ゴーストメソッド'
'method_missingで処理されたメッセージは、呼び出し側からは通常の呼び出しのように見える'
'だがレシーバ側には対応するメソッドが見当たらない'
'これをゴーストメソッドと呼ぶ'

require 'hashie'
icecream = Hashie::Mash.new
icecream.flavor = "strawberry"
icecream.flavorn #  "strawberry"


'method_missingをつかってComputerクラスのリファクタリング'

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "*#{result}" if price >= 100
    result
  end
end






