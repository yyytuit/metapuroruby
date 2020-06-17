'ブロックはオブジェクトではない'
'ブロックを保管しておいてあとで実行することを考える'
'Procはブロックをオブジェクトにしたもの'

inc = Proc.new { |x| x + 1 }
puts inc.call(2) # => 3

dec = lambda {|x| x + 1}
dec.class # Proc
dec.call(2)
# lambdaの別記法
inc2 = ->(x) { x + 1 }
puts inc2.call(2) #=> 1


def my_method(&the_proc)
  the_proc
end

p = my_method {|name| "hello,#{name}!" }
p.class
p.call('bill')
