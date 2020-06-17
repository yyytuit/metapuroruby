'Module#alias_methodを使うことでRubyのメソッドにエイリアスをつけることができる'

class MyClass
  def my_method; 'my_method()'; end
  alias_method :m, :my_method
end

obj = MyClass.new
obj.my_method
# => "my_method()"
obj.m
# => "my_method()"

class MyClass
  alias_method :m2, :m
end

obj.m2
# => "my_method()"

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

"war and peace".length
#=> "long"

"war and peace".real_length
# => 13

"Hi".length
# => "short"

"Hi".real_length
# => 2
