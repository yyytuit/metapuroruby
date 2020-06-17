def my_method
  x = "Goodbye"
  yield("cruel")
end

x = "Hello"
my_method {|y| "#{x}, #{y} world"}
'ブロックにはコードと束縛の集まりの両方'
'ブロックをつくるとxのようなローカル束縛を包み込む'


def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 1
end

top_level_variable # 2
local_to_block #NameError (undefined local variable or method `local_to_block' for main:Object)


'クロージャについてはスコープについて調べる必要がある'
'プログラムがスコープを変更する場所について学ぶ'

v1 = 1
class MyClass
  v2 = 2
  local_variables  #[:v2]
  def my_method
    v3 = 3
    local_variables
  end
  local_variables  #[:v2]
end

obj = MyClass.new
obj.my_method  # [:v3]
obj.my_method  # [:v3]
local_variables # [:obj, :v1]


v1 = 1
class MyClass
  v2 = 2
  local_variables # [:v2]
  def my_method  # スコープゲート :defの入り口
    v3 = 3
    local_variables
  end            # スコープゲート :defの出口
  local_variables
end              # スコープゲート :classの出口

obj = MyClass.new
obj.my_method  # [:v3]
local_variables # [:obj, :v1]
'スコープが変更される場所はclass,module,def'

'スコープのフラット化'
my_var = "成功"
class MyClass
  #my_varをここに表示したい
  def my_method
    #ここにも表示したい
  end
end

'まずはclassのスコープゲート'
'ここにmy_varを直接渡すことはできない'
'classをスコープゲートではない何かに置き換えることはできる'
'それはメソッドの呼び出し'
'classキーワードの代わりにメソッドを呼び出せばmy_barをクロージャに包んでそのクロージャをメソッドに渡せる'
'classと同じ効果のあるメソッドはClass.newである'
'ブロックをClass.newに渡せばクラスにインスタンスメソッドを定義できる'
my_var = "成功"
MyClass = Class.new do
  #my_varを表示できる
  puts "クラスの定義の中は#{my_var}"
  def my_method
    #ここにも表示したい
    #でもここに表示するには?
  end
end

'次にスコープゲートを越えてmy_varを渡すにはキーワードをメソッド呼び出しに置き換えればいい'
'動的メソッドはdefの代わりにModule#define_methodがつかえる'

my_var = "成功"
MyClass = Class.new do
  #my_varを表示できる
  puts "クラスの定義の中は#{my_var}"
  define_method :my_method do
    "メソッドの定義のなかも#{my_var}"
  end
end
puts MyClass.new.my_method

'上記は入れ子構造のレキシカルスコープ'
'スコープのフラット化と呼ばれている'

def define_methods
  shared = 0

  Kernel.send :define_method, :counter do
    shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods

counter
inc(4)
counter

'スコープはclass,module,defといったスコープゲートで区切られている'
'スコープゲートを飛び越えて、束縛にこっそり潜りこみたいときにはブロックが使える'
'ブロックとはクロージャーである'
'classは Class.new、moduleはModule.new、defはModule.define_methodと置き換えることが可能'


