require 'oystercard'

describe "Feature Tests" do
  it "run feature tests" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    Oystercard::MAXIMUM_BALANCE
    oystercard.deduct(3)


  end
end