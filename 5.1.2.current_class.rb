class C
  def m1
    def m2; end
  end
end

class D < C; end
obj = D.new
p obj.m1
p obj.m2
p C.instance_methods(false)

def add_method_to(a_class)
  a_class.class_eval do
    def greet
      puts 'Hello'
    end
  end
end

add_method_to String

'bcd'.greet #=> Hello

# 123.greet
'上記コメントアウトを解くと undefined method greet for 123:Integer (NoMethodError)'
'というエラーになる'
'なのでIngeterでも通るようにデータを渡すと通るようになる'

add_method_to Integer

123.greet #=> Hello



