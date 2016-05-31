require 'oystercard'

describe Oystercard do

  subject (:oystercard) { described_class.new }
  let(:maximum_balance) { Oystercard::MAXIMUM_BALANCE }
  let(:minimum_fare) { Oystercard::MINIMUM_FARE }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe '#balance' do

    it { is_expected.to respond_to(:balance) }

    it "should have a balance at initialization" do
      expect(oystercard.balance).to eq 0
    end

  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should increase the balance by the amount given' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end

    it "should raise error if #top_up makes balance > 90" do
      expect { oystercard.top_up(maximum_balance + 1) }.to raise_error("balance cannot exceed #{maximum_balance}")
    end

  end

  describe '#touch_in(entry_station)' do
    it '#oystercard.balance >= minimum balance in order to touch_in' do
      expect { oystercard.touch_in(entry_station) }.to raise_error('Balance too low to enter')
    end

    it 'oystercard.in_journey = true after #touch_in' do
      oystercard.top_up(minimum_fare)
      expect { oystercard.touch_in(entry_station) }.to change{ oystercard.in_journey}.to true
    end

    it 'records entry station upon #touch in' do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(entry_station)
      expect(oystercard.touch_in(entry_station)).to eq entry_station
    end



  end

  describe '#touch_out(exit_station)' do
    it 'oystercard.in_journey = false after #touch_out(exit_station)' do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_out(exit_station) }.to change{ oystercard.in_journey}.to false
    end

    it 'deducts minimum fare from balance on touch out' do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(entry_station)
      expect { oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by -minimum_fare
    end

    it 'records #exit station upon #touch out' do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in(entry_station)
      expect(oystercard.touch_out(exit_station)).to eq exit_station
    end

  end

end
