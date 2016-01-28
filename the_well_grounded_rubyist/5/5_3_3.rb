class C
  def initialize (n)
    @n = n
  end

  def n
    @n
  end

  def compare(c)
    p "self is - "
    p self
    if c.n > n
      puts "The other object's n is bigger"
    else
      puts "The other object's n is the same or smaller."
    end
  end
  protected :n
end


