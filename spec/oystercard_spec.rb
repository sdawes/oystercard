require 'oystercard'

describe Oystercard do

  subject (:oystercard) { described_class.new }
  let(:maximum_balance) { Oystercard::MAXIMUM_BALANCE }
  let(:minimum_fare) { Oystercard::MINIMUM_FARE }

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

  describe '#touch_in' do
    it '#oystercard.balance >= minimum balance in order to touch_in' do
      expect { oystercard.touch_in }.to raise_error('Balance too low to enter')
    end

    it 'oystercard.in_journey = true after #touch_in' do
      oystercard.top_up(minimum_fare)
      expect { oystercard.touch_in }.to change{ oystercard.in_journey}.to true
    end

  end

  describe '#touch_out' do
    it 'oystercard.in_journey = false after #touch_out' do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in
      expect { oystercard.touch_out }.to change{ oystercard.in_journey}.to false
    end

    it 'deducts minimum fare from balance on touch out' do
      oystercard.top_up(minimum_fare)
      oystercard.touch_in
      expect { oystercard.touch_out }.to change{ oystercard.balance }.by -minimum_fare
    end

  end

end