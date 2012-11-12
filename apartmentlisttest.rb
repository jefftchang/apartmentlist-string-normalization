require "test/unit"
class Normalizer

  def normalize(s)
    newline = []
    s.split('/',-1).each do |f|
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