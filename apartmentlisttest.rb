require "test/unit"
class Normalizer
  def split_path(s)
    path_array = []
    current_string = ""
    s.each_char do |c|
      if c == "/"
        path_array.push(current_string)
        current_string = ""
      else
        current_string += c
      end
    end
    path_array.push(current_string)
    return path_array
  end
  def normalize(s)
    newline = []
    split_path(s).each do |f|
      if f == ".."
        newline.pop()
      elsif f != "."
        newline.push(f)
      end
    end
    if newline.count == 0
      s
    else
      newline.join("/")
    end
  end
end

class TestApartmentList < Test::Unit::TestCase
 
  def test
    n = Normalizer.new()
    assert_equal("foo/bar", n.normalize("foo/./bar"))
    assert_equal("foo/baz", n.normalize("foo/bar/../baz"))
    assert_equal("/////", n.normalize("/////"))
    assert_equal("", n.normalize(""))
    assert_equal("foo", n.normalize("foo"))
    assert_equal("/bar", n.normalize("/bar"))
    assert_equal("foo/bar/bar", n.normalize("foo/bar/foo/../bar"))
    assert_equal("foo/////", n.normalize('foo/////'))
    
  end
end