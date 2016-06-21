class Account
  attr_accessor :balance
  def initialize(amount=0)
    self.balance = amount
  end
  def +(x)
    self.balance += x
  end
  def -(x)
    self.balance -= x
  end
  def to_s
    balance.to_s
  end
end
accu = Account.new(20)
accu - 5
puts accu
