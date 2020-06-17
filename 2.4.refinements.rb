class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

'上記のコードはstringを全て壊してしまう'



module StringExtensions
  refine String do
    def to_alphanumeric
      gsub(/[^\w\s]/,'')
    end
    def reverse
      'esrever'
    end
  end
end

module StringErro
  puts 'my *1st* refinment!'.to_alphanumeric  #NoMethodError (undefined method `to_alphanumeric' for "my 1st refinment!":String)
end

module StringStuff
  using StringExtensions
  puts 'my *1st* refinment!'.to_alphanumeric #my 1st refinment
  puts 'my_string'.reverse #=> esrever
end

puts 'my_string'.reverse #=> gnirts_ym

class MyClass
  def my_method
    "original my_method"
  end

  def another_method
    my_method
  end
end

module MyClassRefinements
  refine MyClass do
    def my_method
      "refined my_method"
    end
  end
end

using MyClassRefinements
MyClass.new.my_method
MyClass.new.another_method
