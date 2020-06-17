'ブロックはメソッドに渡す無名引数'
'通常はメソッドのなかでyieldをつかって実行する'
'ただし以下のケースでyieldでは足りない'
'1他のメソッドにブロックを渡したいとき'
'2ブロックをprocに変換したいとき'
'そのときは&をつかってブロックを渡す'

def math(a, b)
  yield(a, b)
end

def do_math(a, b, &block)
  math(a, b, &block)
end

puts do_math(2, 3) { |x, y| x + y } #=> 5


'&をつけるとメソッドに渡されたブロックを受け取って、procに変換したいという意味になる'

# ブロックをprocにする方法
def my_method(&the_proc)
  the_proc
end

p = my_method{|name| "Hello, #{name}!"}
p.class
p.call("Bill")


# Procをブロックに戻す
def my_method(greeting)
  "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" }
puts my_method("Hello", &my_proc) #=> "Hello Bill!"
