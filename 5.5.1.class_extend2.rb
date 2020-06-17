module MyModule
  def my_method; 'hello'; end
end

obj = Object.new
obj.extend MyModule
obj.my_method
#=> "hello"

class MyClass
  extend MyModule
end

MyClass.my_method
#=> "hello"

a = MyClass.new
a.my_method
# undefined method `my_method' for #<MyClass:0x00007fec4f16d6c0>)

class MyClass2
  include MyModule
end
MyClass2.my_method
# NoMethodError (undefined method `my_method' for MyClass2:Class)

a = MyClass2.new
a.my_method
# => "hello"
