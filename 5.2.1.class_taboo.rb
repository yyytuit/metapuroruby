class MyClass < Array
  def my_method
    'Hello!'
  end
end
a = MyClass.new
p a.my_method
p a.class.superclass

c = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

