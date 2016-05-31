require 'oystercard'

describe "Feature Tests" do
  it "run reature tests" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    Oystercard::MAXIMUM_BALANCE


  end
end