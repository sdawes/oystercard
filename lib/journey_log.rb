require_relative 'journey'

class JourneyLog

  attr_reader :journey_history, :current_journey

  def initialize(journey = Journey.new)
    @journey_history = []
    @current_journey = journey
  end

  def start(start_station)
    finish(:Incomplete) if in_journey?
    @current_journey.start(start_station)
  end

  def finish(exit_station)
    in_journey? ? complete_journey(exit_station) : incomplete_journey(exit_station)
    new_journey
  end

  def new_journey(journey = Journey.new)
    @journey_history << current_journey
    @current_journey = journey
  end

  def in_journey?
    @current_journey.in_journey?
  end

  def complete_journey(exit_station)
    @current_journey.finish(exit_station)
  end

  def incomplete_journey(exit_station)
    @current_journey.start(:Incomplete)
    @current_journey.finish(exit_station)

  end
end
