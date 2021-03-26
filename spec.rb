require 'minitest/autorun'
require_relative 'aircraftproblem'
describe "Aircraft" do
    # INPUT IS [R,C]
    before do
        @flight = Aircraft.new([[3,2], [4,3], [2,3], [3,4]], 30)
        @seats = @flight.arange_seat_template
    end
    it "001. should not have a nil cell" do
        assert @flight != nil
    end
    it "002. should not have a passenger_count lessthan 0" do
        puts "passenger: #{@flight.passenger}"
        assert @flight.passenger >= 1
    end
    it "003. should result an array" do
        assert @seats.is_a? Array
    end
    it "004. should have equal or more seats than passenger" do
        if (@seats.length >= @flight.passenger)
            assert(true)
        else
            assert(false, "there should be more seats")
        end
    end
end