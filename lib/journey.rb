class Journey

  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station= nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
    self
  end

  def complete?
    !!@exit_station && !!@entry_station
  end

  def fare
    if complete?
      1
    else
      PENALTY_FARE
    end
  end

end
