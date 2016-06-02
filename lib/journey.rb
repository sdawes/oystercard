require_relative 'station'

class Journey

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  attr_reader :start_station, :exit_station

  def start(start_station)
    @start_station = start_station
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def fare
    complete? ? zone_charge : PENALTY_FARE
  end

  def in_journey?
   !!@start_station && @exit_station.nil?
  end

  def complete?
    ![@start_station, @exit_station].include? :Incomplete
  end

  def zone_charge
    MINIMUM_FARE + (start_station.zone - exit_station.zone).abs
  end




end
