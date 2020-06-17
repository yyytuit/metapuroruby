class MyClass
  def my_method; end
end
obj = MyClass.new
obj.my_method
def obj.my_singleton_method; end
def MyClass.my_class_method; end

class << an_object
  p "hello"
end

obj = Object.new

singleton_class = class << obj
  self
end

singleton_class.class


`メソッド探索のおさらい`

class C
  def a_method
    'C#a_method()'
  end
end


class D < C; end
obj = D.new
obj.a_method

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end
obj.singleton_class.superclass # D
obj.a_method
# => "C#a_method()"


class C
  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end
C.singleton_class
#<Class:C>
D.singleton_class
#<Class:D>
D.singleton_class.superclass
#<Class:C>
C.singleton_class.superclass
#<Class:Object>

 'クラスの構文'
 'クラスメソッドはクラスの特異クラスにある特異メソッドなので、定義方法は３つある'

def MyClass.a_class_method; end

class MyClass
  def self.another_class_method;end
end

class MyClass
  class << self
    def yet_another_class_method; end
  end
end
'ただし上記方法はクラス名が重複しているので否定的'

'特異クラスとinstance_eval'

'class_evalではinstance_evalはselfを変更し、class_evalはselfとカレントクラスの両方を変更すると学んだ。'
'だが、instance_evalもカレントクラスを変更する。カレントクラスをレシーバの特異クラスに変更する'

s1, s2 = "abc", "def"
s1.instance_eval do
  def swoosh!; reverse; end
end
s1.swoosh!
#=> "cba"
s2.respond_to?(:swoosh!)
 #=> false

 class MyClass
  attr_accessor :a
 end

 obj = MyClass.new
 obj.a = 2
 obj.a
# => 2
'attr_accessorはオブジェクトのアトリビュートを生成するもの'
'ではクラスのアトリビュートを生成したいときはどうすればいいのだろう'

class MyClass; end
class Class
  attr_accessor :b
end
MyClass.b  = 42
MyClass.b
#=> 42

'これでクラスのアトリビュートはできている。ただ、これでは全てのアトリビュートが追加されてしまう。'
String.b = 30
String.b
#=> 30

'MyClassだけにアトリビュートを追加するには別の方法が必要になる'

class MyClass
  class << self
    attr_accessor :c
  end
end
MyClass.c = 'It works!'
MyClass.c
# => "It works!"
String.c = 30
# NoMethodError (undefined method `c=' for String:Class)

'この書き方は以下のように書くのと一緒'

def MyClass.c=(value)
  @c = value
end
def MyClass.c
  @c
end
