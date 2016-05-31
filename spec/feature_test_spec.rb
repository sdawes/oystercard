require 'oystercard'

describe "Feature Tests" do
  it "run feature tests" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    Oystercard::MAXIMUM_BALANCE
    oystercard.touch_in
    oystercard.touch_out





  end
end