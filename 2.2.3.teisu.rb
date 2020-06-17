'大文字で始まるクラス名やモジュールも全て定数'
'Stringを変更してRubyをぶっ壊すこともできる'
'定数と変数の違い'

module MyModule
  MyConstant = '外側の定数'

  class MyClass
    MyClass = '内側の定数'
  end
end

'モジュール(およびクラス)がディレクトリで、定数がファイル'

module M
  class C
    X = 'ある定数'
  end
  p C::X #ある定数
end

p M::C::X #ある定数

Y = 'ルートレベルの定数'

module M
  Y = 'Mにある定数'
 p Y # Mにある定数
 p ::Y #ルートレベルにある定数
end

'moduleクラスは定数を呼びだすインスタンスメソッドとクラスメソッドを持っている'
'インスタンスメソッドのMoudule#constantsは現在のスコープにある全ての定数を戻す。(ファイルのlsコマンドのようなもの)'
'Module.constantsは現在のプログラムのトップレベル定数を戻す'

p M.constants #[:C, :Y]
p Module.constants.include? :Object #true
p Module.constants.include? :Module #true

'パスが必要であれば Module.nestingを確認する'

 module M
  class C
    module M2
     p Module.nesting # [M::C::M2, M::C, M]
    end
  end
end


'追加'
'オブジェクトとクラスのまとめ'
'オブジェクトはインスタンス変数の集まりにクラスへのリンクがついたもの'
'オブジェクトのメソッドはオブジェクトではなくオブジェクトのクラスに住んでいるクララスのインスタンスメソッド'
'クラスはオブジェクト(Classクラスのインスタンス)ニインスタンスメソッドの一覧とスーパークラスへのリンクがついたもの'
' ClassクラスはModuleクラスのサブクラス。つまりモジュールである'
'Classクラスにはインスタンスメソッドがある。'

