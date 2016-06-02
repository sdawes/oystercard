require 'journey_log'

describe JourneyLog do

  let(:start_station) { double :start_station }
  let(:exit_station) { double :exit_station }
  let(:journey_log) {described_class.new}


    it "starts a journey" do
      expect(journey_log.start(start_station)).to eq start_station
    end

    it 'records a journey' do
      journey_log.finish(exit_station)
      expect(journey_log.journey_history).to include journey
    end

  end
