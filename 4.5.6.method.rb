class MyClass
  def initialize(value)
    @x = value
  end

  def my_method
    @x
  end
end

object = MyClass.new(1)
m = object.method :my_method
m.call


module MyModule
  def my_method
    42
  end
end

unbound = MyModule.instance_method(:my_method)
unbound.class # UnboundMethod

String.send :define_method, :another_method, unbound
"abc".another_method # 42

'ブロック:定義されたスコープで評価される'
'proc: procクラスのオブジェクトだが通常のprocとは微妙に異なる。'
'lambda: procクラスのオブジェクトだが通常のprocとは微妙に異なる。
procと同じくクロージャであり、定義されたスコープで評価される'
'メソッド: オボジェクトに束縛され、オブジェクトのスコープで評価される
オブジェクトのスコープから引き離し、ほかのオブジェクトに束縛することもできる'

