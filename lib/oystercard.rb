require_relative 'journey_log'

class Oystercard

  DEFAULT_LIMIT = 90
  MIN_BALANCE = 1

  attr_reader :journey, :balance, :journey_log

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(value)
    fail 'Exceeded limit' if balance + value > DEFAULT_LIMIT
    @balance += value
  end

  def touch_in(start_station)
    finish_journey if in_journey?
    fail 'Not enough balance!' if @balance < MIN_BALANCE
    @journey_log.start(start_station)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct
  end


  def deduct
    @balance -= journey_log.journey_history.last.fare
  end

  def finish_journey
    @journey_log.finish(:Incomplete)
    deduct
  end

  def in_journey?
    journey_log.in_journey?
  end

end
