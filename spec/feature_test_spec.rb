require '~/documents/projects/oystercard/lib/oystercard.rb'

# describe "Feature Tests" do
#   it "run feature tests" do
    oystercard = Oystercard.new
    oystercard.top_up(20)
    oystercard.touch_in("Waterloo")
    oystercard.entry_station






#   end
# end
