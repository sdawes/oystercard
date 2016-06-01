
class Oystercard

  attr_reader :balance, :entry_station,:exit_station, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def top_up(value)
    top_up_fail(value)
    @balance += value
  end

  def touch_in(entry_station)
    fail 'Not enough balance!' if balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MIN_CHARGE)
    @exit_station = exit_station
    @journey_history << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
  end

  def in_journey?
    !!(@entry_station)
  end

  private

  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1
  MIN_CHARGE = 1

  def deduct(value)
    fail "Please input an integer" unless is_number?(value)
    @balance -= value
  end

  def top_up_fail(value)
    integer_error(value)
    fail 'Exceeded limit' if limit?(value)
  end

  def integer_error(value)
    fail "Please input an integer" unless is_number?(value)
  end

  def limit?(value)
    (@balance + value ) > DEFAULT_LIMIT
  end

  def is_number?(value)
    value.is_a? Integer
  end
end
