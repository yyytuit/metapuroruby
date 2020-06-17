class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  puts self #=> <MyClass:0x007ff9f89dcde0>
  puts @v #=> 1
end

v= 2
obj.instance_eval { @v }  # 1
obj.instance_eval { @v = v} # 2
obj.instance_eval { @v }  # 2



class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_exec do
  puts self #=> <MyClass:0x007ff9f89dcde0>
  puts @v #=> 1
end

v= 2
obj.instance_exec { @v }  # 1
obj.instance_exec { @v = v} # 2
obj.instance_exec { @v }  # 2
