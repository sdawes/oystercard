require '~/documents/projects/oystercard/lib/oystercard'  # => true
require '~/documents/projects/oystercard/lib/station'     # => true
require '~/documents/projects/oystercard/lib/journey'     # => true

# describe 'Feature Tests' do
#   it "Run feature tests" do

    oystercard = Oystercard.new  # => #<Oystercard:0x007feb8913b600 @balance=0, @entry_station=nil, @exit_station=nil, @journey_history=[]>
    oystercard.top_up(20)        # => 20
    oystercard.journey_history   # => []

    waterloo = Station.new(:waterloo, 1)  # => #<Station:0x007feb8913b1f0 @name=:waterloo, @zone=1>
    brixton = Station.new(:brixton, 2)    # => #<Station:0x007feb8913b038 @name=:brixton, @zone=2>

    toby = Journey.new(waterloo)  # => #<Journey:0x007feb8913ae80 @entry_station=#<Station:0x007feb8913b1f0 @name=:waterloo, @zone=1>, @exit_station=nil>
    toby.finish(brixton)          # => #<Station:0x007feb8913b038 @name=:brixton, @zone=2>

    toby.complete?  # => true

    # journey1 = Journey.new(brixton)






#   end
# end
