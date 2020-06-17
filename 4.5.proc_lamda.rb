'lambdaとprocの違いはreturnのキーワードが意味がちがう'
'returnは単にlambdaからもどるだけ'

def double(callable_object)
  callable_object.call * 2
end

l = lambda{ return 10 }
double(l)


'Procの場合はreturnの動作が違う。
Procから戻るのではなくProcから定義されたスコープから戻る'

def another_double
  p = Proc.new {return 10}
  result = p.call
  return result * 2
end
another_double  # 10


def another_double(callable_object)
  callable_object.call * 2
end

s = Proc.new {return 10}
another_double(s)  # LocalJumpError (unexpected return)


def another_double(callable_object)
  callable_object.call * 2
end

s = Proc.new{10}
another_double(s) # 20



'lambdaとprocの違いのもう一つは項数'
'項数は引数のこと'

p = Proc.new {|a,b| [a,b]}
p.arity

'一般的にlambdaのほうがProcよりも引数の扱いに厳しい'
'違った引数でlambdaを呼び出すとargumenterrorになる'
'procは引数列を期待に合わせてくれる'

p = Proc.new {|a, b| [a,b]}
p.call(1,2,3) # [1, 2]
p.call(1) # [1, nil]


