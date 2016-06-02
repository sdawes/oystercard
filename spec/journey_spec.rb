require 'journey'

describe Journey do

  subject(:journey) { Journey.new(entry_station) }
  let(:start_station) { double :start_station, zone: 1}
  let(:exit_station) { double :exit_station, zone: 1}

  it 'confirms that journey is NOT complete' do
    expect(journey.complete?).to eq false
  end

  it 'returns itself when exiting a journey' do
    expect(journey.finish(exit_station)).to eq(journey)
  end

  context 'ENTRY Station' do
    it 'has an ENTRY station' do
      expect(journey.entry_station).to eq entry_station
    end

    it 'returns a penalty fare if no exit station is given' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'EXIT Station' do
    it 'calculates #fare' do
      journey.finish(exit_station)
      expect(journey.fare).to eq 1
    end

    it 'confirms that journey IS complete' do
      journey.finish(exit_station)
      expect(journey.complete?).to be true
    end
  end





























  # it 'has an entry station (journey start)' do
  #   journey.start(entry_station)
  #   expect(journey.entry_station).to eq entry_station
  # end
  #
  # it 'has an exit station (journey end)' do
  #   journey.finish(exit_station)
  #   expect(journey.exit_station).to eq exit_station
  # end
  #
  # it 'calculates a fare for a completed journey' do
  #   journey.start(entry_station)
  #   journey.finish(exit_station)
  #   expect(journey.fare).to eq Journey::MINIMUM_FARE
  # end
  #
  # it 'calculates a fare for an INcompleted journey' do
  #   journey.start(entry_station)
  #   journey.finish()
  #   expect(journey.fare).to eq Journey::PENALTY_FARE
  # end

end
