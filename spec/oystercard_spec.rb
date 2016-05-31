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

end