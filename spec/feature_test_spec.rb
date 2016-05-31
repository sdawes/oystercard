require '~/documents/projects/oystercard/lib/oystercard.rb'  # => true

# describe "Feature Tests" do
#   it "run feature tests" do
    oystercard = Oystercard.new           # => #<Oystercard:0x007fed6c814b18 @balance=0, @in_journey=false>
    oystercard.top_up(20)                 # => 20
    oystercard.touch_in("Waterloo")       # => "Waterloo"
    oystercard.touch_out("Baker Street")  # => "Baker Street"
    journey1 = {}                         # => {}
    journey_list = []                     # => []
    






#   end
# end
