require '~/documents/projects/oystercard/lib/oystercard'  # => true
require '~/documents/projects/oystercard/lib/station'     # => true
require '~/documents/projects/oystercard/lib/journey'     # => false

card = Oystercard.new  # => #<Oystercard:0x007fb5738488b8 @balance=0, @journey=#<Journey:0x007fb573848868 @entry_station=nil, @exit_station=nil>>

waterloo = Station.new("Waterloo", 1)         # => #<Station:0x007fb573848610 @name="Waterloo", @zone=1>
brixton = Station.new("Brixton", 2)           # => #<Station:0x007fb573848480 @name="Brixton", @zone=2>
bakerstreet = Station.new("Baker Street", 1)  # => #<Station:0x007fb5738482c8 @name="Baker Street", @zone=1>
uxbridge = Station.new("Uxbridge", 6)         # => #<Station:0x007fb573848110 @name="Uxbridge", @zone=6>

card.top_up(10)           # => 10
card.touch_in(brixton)    # => #<Journey:0x007fb573843e30 @entry_station=#<Station:0x007fb573848480 @name="Brixton", @zone=2>, @exit_station=nil>
card.touch_out(waterloo)  # ~> RuntimeError: Please input an integer

# ~> RuntimeError
# ~> Please input an integer
# ~>
# ~> /Users/sdawes/documents/projects/oystercard/lib/oystercard.rb:35:in `deduct'
# ~> /Users/sdawes/documents/projects/oystercard/lib/oystercard.rb:24:in `touch_out'
# ~> /Users/sdawes/Documents/projects/oystercard/lib/feature_test_spec.rb:14:in `<main>'
