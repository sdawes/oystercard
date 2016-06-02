require '~/documents/projects/oystercard/lib/journey'
require '~/documents/projects/oystercard/lib/station'
require '~/documents/projects/oystercard/lib/oystercard'

card = Oystercard.new
card.top_up(60)

waterloo = Station.new("Waterloo", 1)
brixton = Station.new("Brixton", 2)

card.touch_in(waterloo)
card.touch_out(brixton)
card
