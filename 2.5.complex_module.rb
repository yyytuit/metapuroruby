module Printable
  def print
    p 'a'
  end

  def prepare_cover
    p 'b'
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
    p 'c'
  end

  def format_for_screen
    #...
    p 'd'
  end

  def print
     #...
    p 'e'
  end
end

class Book
  include Document
  include Printable
end
b = Book.new
b.print_to_screen
Book.ancestors
#=> [Book, Printable, Document, Object, Kernel, BasicObject]

'Bookクラスには明示的なスーパークラスがないので暗黙的にObjectクラスを継承'
'BookクラスがKernelモジュールをインクルード、さらにBaiscObjectクラスを継承'
'BookクラスがDocumentモジュールをインクルードするとBookクラスの継承チェーンの真上にDocumentモジュールが追加'
'BookクラスがPrintableモジュールをインクルードすると今度もBookクラスの真上にPrintableモジュールが追加される。Bookクラスの真上にあるものを押し上げるかたちで'
'b.print_to_screenを呼び出すとbが参照するオブジェクトがselfになる'
'rubyはprint_to_screenメソッドをBookクラスで探し、そのあとPrintableモジュールで探し、そしてDocumentモジュールで発見する'
'print_to_screenメソッドの中からprintメソッドを発見'
'レシーバを明示せずに呼び出す場合は全てselfに対する呼び出し'
'メソッド探索が再度Bookクラス(selfのクラス)から開始'
'printメソッドはPrintableモジュールで見つかるのでそれが呼び出される'



