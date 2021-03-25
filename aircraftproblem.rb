#total_column => tracks and updates the number of column
#total_row => tracks and update number of rows
#passenger_seat => stores the seat location of each passenger
#add_to_record => stores all the available seat

# Seat Labels : [1-A] Aisle Seat, [2-W] Window Seat, [3-M] Middle Seat

class Aircraft

    def initialize ()
        @total_column = 0
        @total_row = 0
        @passenger_seat = []
        @add_to_record = []
    end

    def arange_seat_template(cell,passenger)
        index = 0

        cell.each do |rowSize, columnSize| 

            index += 1
            max_columnSize = @total_column + columnSize

            # Records the (W)indow Seat and the (A)isle 
            for row in 1 .. rowSize
                if index == 0
                    #Left Side : Window and Aisle
                    @add_to_record.push([row, 1, "2-W"], [row, columnSize, "1-A"])
                elsif index == (cell.length - 1) 
                    #Right Side : Window and Aisle
                    @add_to_record.push([row, (@total_column + 1), "1-A"], [row, max_columnSize, "2-W"])
                else
                    #Middle Seats : Aisle
                    @add_to_record.push([row, (@total_column + 1), "1-A"], [row, max_columnSize, "1-A"])
                end
            end

            # This is the algorithm to get the middle Seats
            if columnSize > 2
                for row in 1 .. rowSize
                    for column in (@total_column + 2) .. (max_columnSize - 1 )
                        @add_to_record.push([row,column, "3-M"])
                    end
                end
            end

            sort_record()
            @total_column += columnSize
        end

        #gives each passenger a seat
        self.allocate_passenger_seat(passenger)
        return @passenger_seat
    end

    def sort_record ()
        # 1. Sort record by row
        # 2. then sort it according to the seat label
        @add_to_record = @add_to_record.sort_by{|row,column,location| [row]}
        @add_to_record = @add_to_record.sort_by{|row,column,location| [location.chars.first.chomp.to_i]}
    end

    def allocate_passenger_seat(passenger_count)
        for i in 0 .. (passenger_count - 1)
            @passenger_seat.push(@add_to_record[i])
        end
    end

end

newFlightPlan = Aircraft.new()
seats = newFlightPlan.arange_seat_template([[3,2],[3,4],[4,5],[2,2]], 30)
puts "Seats = #{seats}"


    