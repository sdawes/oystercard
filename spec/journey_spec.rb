require 'journey'

describe Journey do
  let(:journey) { described_class.new(entry_station) }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  it 'initializes with an entry station' do
    expect(journey.entry_station).to eq entry_station
  end

  describe '#finish' do
    it 'records exit_station' do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

  describe '#complete?' do

    it 'knows if a journey is not complete' do
      expect(journey.complete?).to eq false
    end

    it 'knows if a journey is complete' do
      journey.finish(exit_station)
      expect(journey.complete?).to eq true
    end

  end

  describe '#fare' do
    it 'if journey completes calculates fare' do
      journey.finish(exit_station)
      expect(journey.fare).to eq 1
    end

    it 'journey is incomplete charge penalty' do
      expect(journey.fare).to eq Journey::PENALTY
    end
  end










end
