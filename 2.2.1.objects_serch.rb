class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
p obj.class # MyClass
p obj.my_method # 1
p obj.instance_variables # [:@v]
p obj.methods.grep(/my/) # [:my_method]

#同じメソッドであっても、クラスに着目しているときはインスタンスメソッドと呼び
#オブジェクトに着目しているときはメソッドと呼ぶ

String.instance_methods == "abc".methods #true
String.methods == "abc".methods  #false
