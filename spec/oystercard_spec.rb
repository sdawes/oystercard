require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:maximum_balance) { Oystercard::DEFAULT_LIMIT }
  let(:minimum_balance) { Oystercard::MIN_BALANCE }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  context 'responses' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it { is_expected.to respond_to(:touch_in).with(1).argument }
  end

  context '#top_up' do

    it 'raises an error when a string is input' do
      expect{card.top_up("foo")}.to raise_error("Please input an integer")
    end

    it 'allows money to be added to reach limit' do
      expect{card.top_up(maximum_balance)}.not_to raise_error
    end

    it 'raises an error when exceeding limit of 90' do
      card.top_up(maximum_balance)
      expect{card.top_up(1)}.to raise_error("Exceeded limit")
    end
  end


  context '#touch_in' do

    it 'raises error if not enough balance' do
      expect{card.touch_in(entry_station)}.to raise_error 'Not enough balance!'
    end

  end

  context '#touch_out' do

    it 'deducts balance by minimum charge' do
      card.top_up(10)
      card.touch_in(entry_station)
      expect {card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::MIN_CHARGE)
    end
  end


end
