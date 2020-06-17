
class String
  def to_alpanumeric
    gsub(/[^\w\s]/, '')
  end
end

require 'test/unit'

class StringExtensionsTest < Test::Unit::TextCase
  def test_strips_non_alpanumeric_characters
    assert_equal '3 the Magic Number', '#3 , the *Magic, Number*?'.to_alpanumeric
  end
end
