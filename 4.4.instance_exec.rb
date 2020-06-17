class C
  def initialize
    @x = 1
  end
end

class D
  def twisted_method
    @y = 2
    C.new.instance_eval { "@x : #{@x}, @y : #{@y}" }
  end
end

puts D.new.twisted_method #=> @x : 1, @y :

class E
  def twisted_method
    @y = 2
    C.new.instance_exec (@y) { |y| "@x : #{@x}, @y : #{y}" }
  end
end

puts E.new.twisted_method #=> @x : 1, @y : 2

'もしevalに引数を渡すとerrorになる'

class F
  def twisted_method
    @y = 2
    C.new.instance_eval (@y) { "@x : #{@x}, @y : #{@y}" }
  end
end

puts F.new.twisted_method #=> @x : 1, @y :

`ArgumentError (wrong number of arguments (given 1, expected 0))`

