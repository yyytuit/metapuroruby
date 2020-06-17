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


