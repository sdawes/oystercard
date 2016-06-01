class Journey

  PENALTY = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station=nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def complete?
    !!@exit_station && !!@entry_station
  end

  def fare
    if complete?
      1
    else
      PENALTY
    end
  end

end
