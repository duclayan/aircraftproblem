require 'minitest/autorun'
require_relative 'aircraftproblem'

describe "Aircraft" do
    # INPUT IS [R,C]

    before do
        @flight = Aircraft.new()
        @flight.passenger = 30
        @seats = @flight.arange_seat_template([[3,2], [4,3], [2,3], [3,4]], @flight.passenger)
    end
    
    it "001. should not have a nil cell" do
        assert @flight != nil
    end

    it "002. should not have a passenger_count lessthan 0" do
        puts "passenger: #{@flight.passenger}"
        assert @flight.passenger >= 1
    end

    it "003. should result an array" do
        assert @seats == [[1, 3, "1-A"], [1, 4, "1-A"], [1, 7, "1-A"], [1, 8, "1-A"], [1, 9, "1-A"], [1, 10, "1-A"], [2, 3, "1-A"], [2, 4, "1-A"], [2, 7, "1-A"], [2, 8, "1-A"], [2, 9, "1-A"], [2, 10, "1-A"], [3, 4, "1-A"], [3, 7, "1-A"], [3, 8, "1-A"], [3, 9, "1-A"], [3, 10, "1-A"], [4, 10, "1-A"], [1, 1, "2-W"], [1, 12, "2-W"], [2, 1, "2-W"], [2, 12, "2-W"], [3, 12, "2-W"], [4, 12, "2-W"], [1, 2, "3-M"], [1, 5, "3-M"], [1, 6, "3-M"], [1, 11, "3-M"], [2, 2, "3-M"], [2, 5, "3-M"]]
    end

    it "004. should have equal or more seats than passenger" do
        if (@seats.length >= @flight.passenger)
            assert(true)
        else
            assert(false, "there should be more seats")
        end
    end
end