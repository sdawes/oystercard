class Oystercard

attr_reader :balance, :in_journey

MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "balance cannot exceed #{MAXIMUM_BALANCE}" if exceed(money)
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail 'Balance too low to enter' if low_balance
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

private

def exceed(money)
  money + balance > MAXIMUM_BALANCE
end

def low_balance
  balance < MINIMUM_FARE
end

end