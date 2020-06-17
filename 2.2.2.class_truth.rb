"hello".class # String
String.class #class

'オブジェクトのメソッドはそのクラスのインスタンスメソッド、
クラスのメソッドはClassクラスのインスタンスメソッド'

p Class.instance_methods(false) #[:new, :allocate, :superclass]

Array.superclass #object
Object.superclass #BasicObject
BasicObject.superclass #nil

'つまり配列はオブジェクト'

Class.superclass #Module

'つまりすべてのクラスはモジュール'
'正確に表現するとクラスはオブジェクトの生成やクラスを継承するために
3つのインスタンスメソッド(new,allocate,superclass)を追加したモジュール'

class MyClass; end
obj1 = MyClass.new
obj2 = MyClass.new
