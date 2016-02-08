class Banner
  def initialize(text)
    @text = text
  end
  def to_s
    @text
  end
  def +@
    @text.upcase
  end
  def -@
    @text.downcase
  end
  def !
    reverse
  end
end

class Test
  attr_accessor :word
  def initialize(something)
    self.word = something
  end

#  def to_s
#    word.to_s
#  end
end
