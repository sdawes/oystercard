require 'oystercard'

describe Oystercard do

  subject (:oystercard) { described_class.new }
  let(:maximum_balance) { Oystercard::MAXIMUM_BALANCE }

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

  describe '#deduct' do
    it 'should deduct specified amount from the balance' do
      expect{ oystercard.deduct(3) }.to change{ oystercard.balance }.by(-3)
    end
  end

  describe '#touch_in' do

    it 'oystercard.in_journey = true after #touch_in' do
      expect { oystercard.touch_in }.to change{ oystercard.in_journey}.to true
    end
  end

  describe '#touch_out' do
    it 'oystercard.in_journey = false after #touch_out' do
      oystercard.touch_in
      expect { oystercard.touch_out }.to change{ oystercard.in_journey}.to false
    end
  end

end