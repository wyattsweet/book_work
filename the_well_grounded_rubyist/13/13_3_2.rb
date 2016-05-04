class Lister < BasicObject
  attr_reader :list
  def initialize
    @list = ""
    @level = 0
  end

  def indent (string)
    " " + @level + string.to_s
  end

  def method_missing(m, &block)
    
