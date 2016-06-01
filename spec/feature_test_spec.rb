require '~/documents/projects/oystercard/lib/oystercard.rb'  # => true

describe "Feature Tests" do
  it "run feature tests" do
    oystercard = Oystercard.new                                                   # => #<Oystercard:0x007ff6648ac3b8 @balance=0, @in_journey=false, @journey_history=[], @entry_station=nil, @exit_station=nil>
    oystercard.top_up(20)                                                         # => 20
    oystercard.touch_in("Waterloo")                                               # => "Waterloo"
    oystercard.touch_out("Baker Street")                                          # => "Baker Street"
    oystercard.entry_station                                                      # => "Waterloo"
    







  end
end

# ~> NameError
# ~> undefined local variable or method `entry_station' for main:Object
# ~>
# ~> /Users/sdawes/Documents/projects/oystercard/spec/feature_test_spec.rb:10:in `<main>'
