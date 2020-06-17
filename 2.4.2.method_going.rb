def my_method
  temp = @x + 1
  my_method(temp)
end
'インスタンス変数@xが所属しているオブジェクトは何か？'
'my_other_methodがよびだされているオブジェクトは何か?'
'@xもmy_other_methodもレシーバに属している。レシーバは最初に呼び出されたオブジェクト'
'メソッド実行時に誰ばレシーバなのか、レシーバの参照を覚えておく必要がある'

'selfキーワード'
'rubyのオブジェクトはカレントオブジェクトとも呼ばれ、その内部で実行される。またカレントオブジェクトはselfとも呼ばれる'
'メソッドのレシーバがselfになる'
'メソッドを呼び出したときから、全てのインスタンス変数はselfのインスタンス変数になる'
'レシーバを明示しないメソッドの呼び出しはすべてselfに対する呼び出しとなる'

class MyClass
  def testing_self
    @var =10
    my_method
    self
  end

  def my_method
    @var = @var + 1
  end
end
obj = MyClass.new
p obj.testing_self

'testing_selfのレシーバはobj'
'objがself だから@valはobjのインスタンス変数'

'トップレベル'
'メソッドを呼び出さないときは誰がself?'

self # main
self.class # Object

'クラス定義とself'
class MyClass
  p self  #MyClass
end
