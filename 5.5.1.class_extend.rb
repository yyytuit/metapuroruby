module MyModule
  def self.my_method; 'Hello';end
end

class MyClass
  include MyModule
end
MyClass.my_method
# NoMethodError (undefined method `my_method' for MyClass:Class)

module MyModule
  def my_method; 'hello'; end
end

class MyClass
  class << self
    include MyModule
  end
end

MyClass.my_method #=> "hello"

'クラスメソッドとinclude'
module MyModule
  def my_method; 'hello'; end
end

obj = Object.new

class << obj
  include MyModule
end

obj.my_method
# => "hello"
obj.singleton_methods
# => [:my_method]
