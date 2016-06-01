class Oystercard

attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history

MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @journey_history = []
  end

  def top_up(money)
    fail "balance cannot exceed #{MAXIMUM_BALANCE}" if exceed(money)
    @balance += money
  end

  def touch_in(entry_station)
    fail 'Balance too low to enter' if low_balance
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @in_journey = false
    deduct
    @exit_station = exit_station
  end

  def in_journey?
    @in_journey
  end

  private

  def exceed(money)
    money + balance > MAXIMUM_BALANCE
  end

  def low_balance
    balance < MINIMUM_FARE
  end

  def deduct
    @balance -= MINIMUM_FARE
  end

end
