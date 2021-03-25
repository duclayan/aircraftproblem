require 'minitest/autorun'
require_relative 'aircraftproblem'

describe "Aircraft" do
    
    before do
        @flight = Aircraft.new(:cell => 4,:passenger =>30)
    end

    # it "" do
    #     assert_operator @flight.add_to_record.must_be_instance_of Array
    # end

    it "should not allow an input < 0" do 
        assert_operator @flight.cell, :>=, 1
    end

    

end