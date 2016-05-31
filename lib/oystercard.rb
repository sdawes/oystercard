class Oystercard

attr_reader :balance

MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "balance cannot exceed #{MAXIMUM_BALANCE}" if exceed(money)
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

private

def exceed(money)
  money + balance > MAXIMUM_BALANCE
end


end