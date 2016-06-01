require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_history

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(value)
    top_up_fail(value)
    @balance += value
  end

  def touch_in(entry_station)
    fail 'Not enough balance!' if balance < MIN_BALANCE
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    deduct(@journey.fare)
    @journey = Journey.new
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
