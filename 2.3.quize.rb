class MyClass; end
obj1 = MyClass.new
obj2 = MyClass.new
p MyClass.superclass # Object
p MyClass.superclass.superclass # BasicObject
p Class.superclass # Module
p Class.superclass.superclass # Object
obj3 = MyClass.new
obj3.instance_variable_set("@x", 10) # 10
