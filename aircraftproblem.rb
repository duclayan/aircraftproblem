# Aircraft.new( cell : 3, passenger: 30, add_to_record: [])
    #cell.new(rows: 4, column: 5)
    class Aircraft
        attr_accessor :cell 
        attr_accessor :passenger

        def initialize (cell, passenger)
            @cell = []
            @passenger = passenger
            @total_column = 0
            @total_row = 0
            @passenger_seat = []
            @add_to_record = []
        end

        def arange_seat_template(cell,passenger)
            index = 0
            cell.each do |rowSize,columnSize| 
                puts "index: #{index}"
                puts "row: #{rowSize}"
                puts "column: #{columnSize}"
                index += 1
                max_columnSize = @total_column + columnSize

                # Records the (W)indow Seat and the (A)isle 
                # Seats are labeled as "1-A", "2-W", and "3-M" for easier sorting
                #Formulas Used: 
                        # 1 => C = 1 assumes first coordinate is always a window chair
                        # columnSize=> takes the last column coordinate as an aisle chair
                        # max_columnSize =>assumes that max_columnSize is the current last column
                        # (@total_column + 1) => @total_column + 1 give the coordinate of the first chair
                        # (@total_column + 2)  => Used to indicate the chair next to the aisle
                        # (max_columnSize - 1) => generate the last chair before the current last column
                for row in 1 .. rowSize
                    if index == 0
                        @add_to_record.push([row, 1, "2-W"], [row, columnSize, "1-A"])
                    elsif index == (cell.length - 1)
                        @add_to_record.push([row, (@total_column + 1), "1-A"], [row, max_columnSize, "2-W"])
                    else
                        @add_to_record.push([row, (@total_column + 1), "1-A"], [row, max_columnSize, "1-A"])
                    end
                end
                # Check item has middle seats
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
            allocate_passenger_seat(passenger)
        end

        def sort_record ()
            # 1. Sort record by row
            # 2. then sort it according to the seat label (W,  M,  A)
            @add_to_record = @add_to_record.sort_by{|row,column,location| [row]}
            @add_to_record = @add_to_record.sort_by{|row,column,location| [location.chars.first.chomp.to_i]}

        end

        def allocate_passenger_seat(passenger_count)
            for i in 0 .. (passenger_count - 1)
                @passenger_seat[i] = @add_to_record[i]
            end
        end

        def show_results
            puts "add to record #{@add_to_record}"
            puts "Passengers: #{@passenger_seat}"
        end

        def show_passenger
            return @passenger_seat
        end
    end

    newFlightPlan = Aircraft.new(4,30)
    newFlightPlan.arange_seat_template([[3,2],[3,4],[4,5],[2,2]],30)
    # newFlightPlan.allocate_passenger_seat()
    newFlightPlan.show_passenger()


    