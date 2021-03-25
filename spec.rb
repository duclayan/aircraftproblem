require 'minitest/autorun'
require_relative 'aircraftproblem'

describe "Aircraft" do
    
    before do
        @flight = Aircraft.new( 4,30)
        @passenger_seat =[]
    end

    # it "" do
    #     assert_operator @flight.add_to_record.must_be_instance_of Array
    # end

    it "should not allow an input < 0" do 
        assert_operator @flight.cell, :>=, 1
    end

    it "is not valid without cell" do
        # @newFlight = Aircraft.new(nil,nil)
        assert @flight != nil
    end

    it "should be an array" do
        newFlightPlan = Aircraft.new(4, 30)
        Aircraft.new([[3,2],[3,4],[4,5],[2,2]], 30).arrange_seat
        input = [[3,2],[3,4],[4,5],[2,2]]

        newFlightPlan.arange_seat_template('left',3,2)
        newFlightPlan.arange_seat_template('middle',4,3)
        newFlightPlan.arange_seat_template('middle',2,3)
        newFlightPlan.arange_seat_template('right',3,4)

        newFlightPlan.allocate_passenger_seat()
        assert newFlightPlan.show_passenger() == [[1, 3, "1-A"], [1, 4, "1-A"], [1, 7, "1-A"], [1, 8, "1-A"], [1, 9, "1-A"], [1, 10, "1-A"], [2, 3, "1-A"], [2, 4, "1-A"], [2, 7, "1-A"], [2, 8, "1-A"], [2, 9, "1-A"], [2, 10, "1-A"], [3, 4, "1-A"], [3, 7, "1-A"], [3, 8, "1-A"], [3, 9, "1-A"], [3, 10, "1-A"], [4, 10, "1-A"], [1, 1, "2-W"], [1, 12, "2-W"], [2, 1, "2-W"], [2, 12, "2-W"], [3, 12, "2-W"], [4, 12, "2-W"], [1, 2, "3-M"], [1, 5, "3-M"], [1, 6, "3-M"], [1, 11, "3-M"], [2, 2, "3-M"], [2, 5, "3-M"]]
    end

    it "returns and error when input not valid" do 
        @invalid_id = -1
        assert_raises RuntimeError do
            @flight = Aircraft.new(@invalid_id, 20)
        end
    end


end
