'インスタンス変数はオブジェクトに住んでいる'
'レシーバと継承チェーン my_string.reverse であればmy_stringがレシーバ'
'継承チェーンはそのクラスを見て、そのスーパークラスのスーパークラスそして、BasicObjectまで続ける'
'今通った道筋が継承チェーン'
'つまりメソッドの探索はrubyがレシーバのクラスに入り、メソッドを見つけるまで継承チェーンをあげること'
'ちなみにsuperclassメソッドで結びついている'

class MyClass
  def my_method; 'my_method()'; end
end
class MySubclass < MyClass
end

obj = MySubclass.new
obj.my_method() # "my_method()"
'rubyはレシーバのobjからMySubclassに向かって右に進む'
'そこでmy_methodが見つからないので、rubyはMyClassにむかって上にメソッドを探す'
'最後にメソッドを発見する'
MySubclass.ancestors
#=> [MySubclass,MyClass,Object,JSON::Ext::Generator::GeneratorMethods::Object,PP::ObjectMixin,Kernel,BasicObject]

module M1
  def my_method
    'M1#my_method()'
  end
end

module M2
  def my_method_second
    'M2#my_method_second()'
  end
end

class C
  include M1
  prepend M2
end

class D < C; end

# 継承関係を見るメソッド
puts D.ancestors.to_s # => [D, M2, C, M1, Object, Kernel, BasicObject]

'Kernel'
p Kernel.private_instance_methods.grep(/^pr/) #[:proc, :printf, :print]

'Awesom Print'
'gemでインデントやカラーリングなどの装飾をつけてRubyのオブジェクトを画面に印字するもの'
require "awesome_print"
local_time = {:city => "Rome", :now => Time.now }
ap local_time, :indent => 2
# -> { :city => "Rome"
#      :now => 2020-04-22 12:50:03 +0100
#     }
'apはkenelメソッドなのでどこからでも呼び出せる'
