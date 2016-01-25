module M
  class C
    X = 2
    class D
      module N
        X = 1
      end
    end
  end
end

#puts M::C::D::N::X
#puts M::C::X

class Violin
  class String
    attr_accessor :pitch
    def initialize(pitch)
      @pitch = pitch
    end
  end

  @e = String.new("E")
  @history = ::String.new("violins were invented in the 1500's")
  p @history
end

hofner = Violin.new




