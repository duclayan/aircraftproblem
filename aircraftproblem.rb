# Aircraft.new( cell : 3, passenger: 30, add_to_record: [])
    #cell.new(rows: 4, column: 5)
    class Aircraft
        attr_accessor :cell 
        attr_accessor :passenger

        def initialize (cell, passenger)
            @cell = cell
            @passenger = passenger
            @total_column = 0
            @total_row = 0
            @passenger_seat = []
            @add_to_record = []
        end

        def arange_seat_template(location,columnSize, rowSize)
            max_columnsize = @total_column + columnSize

                for row in 1 .. rowSize
                    # Records the (W)indow Seat and the (A)isle 
                    if location == 'left'
                        @add_to_record.push([row, 1, "2-W"], [row, columnSize, "1-A"])
                    elsif location == 'right'
                        @add_to_record.push([row, (@total_column + 1), "1-A"], [row, max_columnsize, "2-W"])
                    elsif location == "middle"
                        @add_to_record.push([row, (@total_column + 1), "1-A"], [row, max_columnsize, "1-A"])
                    end
                end
                    # Check item has middle seats
                    if columnSize > 2
                        for row in 1 .. rowSize
                            for column in (@total_column + 2) .. (@total_column + (columnSize - 1 ))
                                @add_to_record.push([row,column, "3-M"])
                            end
                        end
                    end
            sort_record()
            @total_column += columnSize
        end

        def sort_record ()
            @add_to_record = @add_to_record.sort_by{|row,column,location| [ row]}
            @add_to_record = @add_to_record.sort_by{|row,column,location| [ location.chars.first.chomp.to_i]}

        end

        def allocate_passenger_seat
            sort_record()
            for i in 0 .. (@passenger - 1)
                @passenger_seat[i] = @add_to_record[i]
            end
        end

        def show_results
            puts "add to record #{@add_to_record}"
            puts "Passengers: #{@passenger_seat}"
        end
    end

    newFlight = Aircraft.new(4, 30)
    newFlight .arange_seat_template('left',3,2)
    newFlight .arange_seat_template('middle',4,3)
    newFlight .arange_seat_template('middle',2,3)
    newFlight .arange_seat_template('right',3,4)
    newFlight .allocate_passenger_seat()
    newFlight.show_results()    




    