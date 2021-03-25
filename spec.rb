require 'minitest/autorun'
require_relative 'aircraftproblem'

describe 'aircraftproblem' do
    before do
        @ac = get_seat_label(1, 0, 0, 0,'left_corner',0,3,4)
        @cell = 4
        @window_seat = 0
        
    end

    it "should not allow an input < 0" do 
        assert_operator @ac.cell.value, :>=, 1
    end

end