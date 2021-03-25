
    def get_seat_label(cell, window_seat, aisle_seat, middle_seat, location, total_column, colSize, rowSize)

        max_col = total_column + colSize

        if location == "left_corner"
            for r in 1 .. rowSize            
                window_seat.push([r,1])
                aisle_seat.push([r,colSize])
            end
        elsif location == "right_corner"
            for r in 1 .. rowSize
                window_seat.push([r, max_col])
                aisle_seat.push([r,1])
            end
        elsif location == "middle"
            for r in 1 .. rowSize
                aisle_seat.push([r,(total_column + 1)], [r,max_col])
            end
        end

        if colSize > 2
            for row in 1 .. rowSize
                for column in (total_column + 2) .. (total_column + (colSize - 1 ))
                    middle_seat.push([row,column])
                end
            end
        end

    end


    def order_seats(passenger, passenger_count, window_seat, aisle_seat, middle_seat)
    # middle_seat, window_seat, and aisle_seat are placed batches so passengers can also be placed per batch
    # formula for the following batch = previous_batch + incoming_batch
        first_group_total = aisle_seat.length
        second_group_total = first_group_total + window_seat.length
        third_group_total = second_group_total + middle_seat.length


        for c in 0 .. (passenger_count - 1)
            case c 
            when 0..(first_group_total -1)
                passenger[c]= aisle_seat[c]
            when first_group_total..(second_group_total - 1)
                passenger[c]= window_seat[c - first_group_total]
            when second_group_total..(third_group_total - 1)
                passenger[c] = middle_seat[c - second_group_total]
            end
        end
    end

    puts "Enter the number of Cells in the Aircraft"
    total_cells = gets.chomp.to_i

    puts "Enter Number of Passengers"
    passenger_count = gets.chomp.to_i


    # initialize variables to 0
    total_column = 0
    total_row = 0

    # Create an array to hold window_seat, aisle_seat and middle_seat coordinated
    # passenger will hold the seat coordinates of each passenger
    window_seat = Array.new() { Array.new() }
    aisle_seat = Array.new() { Array.new() }
    middle_seat = Array.new() { Array.new() }
    passenger = Array.new()
    cell = Array.new()

    puts "This is the total_cells : #{total_cells}"
    for i in 1 .. total_cells
        # For each cell user will input the number of row and columns
        puts "Cell #{i}"
        puts "Column Size"
        colSize = gets.chomp.to_i
        puts "Row Size"
        rowSize = gets.chomp.to_i


        cell[i] = Array.new(rowSize) { Array.new(colSize) }

        # check whether the current cell's location
        if i == 1 then
            location = 'left_corner'
        elsif i == total_cells then
            location = 'right_corner'
        else
            location = 'middle'
        end

        # call the function to generate Middle, Aisle and Window Seats
        get_seat_label(cell, window_seat, aisle_seat, middle_seat, location, total_column, colSize, rowSize)

        # update the total column and row count
        total_column += colSize
        total_row = (rowSize > total_row) ? rowSize : total_row
    end

    # Sort each seat row-wise
    middle_seat = middle_seat.sort_by {|r,c| r}
    window_seat = window_seat.sort_by {|r,c| r}
    aisle_seat = aisle_seat.sort_by {|r,c| r}

    order_seats(passenger, passenger_count, window_seat, aisle_seat, middle_seat)

    