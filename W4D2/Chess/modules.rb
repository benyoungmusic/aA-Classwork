module Slideable
    HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]] #down, up right, left
    DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]] #right-up, left-up, right-down, left-down

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves #generate all possible moves with movedirs
        dirs = self.move_dirs
        moves = []
        dirs.each do |dir|
            moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
        end
        moves
    end

    def move_dirs #should return array of possible directions
    end

    #should probably move from here to moves
    #add dx and dy to current position
    def grow_unblocked_moves_in_dir(dx, dy) #check to see if moves in a direction are unblocked
        keep_going = true
        moves_in_dir = []
        future_pos = @pos
        until !keep_going
            future_pos = [future_pos[0] + dx, future_pos[1] + dy]

            if future_pos[0] > 7 || future_pos[0] < 0 || future_pos[1] > 7 || future_pos[1] < 0
                keep_going = false
                # p "case 1 #{future_pos}"
            elsif @board[future_pos].empty?
                moves_in_dir << future_pos
                # p "case 2 #{future_pos}"
            elsif @board[future_pos].color != self.color #.color needs to be created
                moves_in_dir << future_pos
                keep_going = false
                # p "case 3 #{future_pos}"
            elsif @board[future_pos].color == self.color
                keep_going = false
                # p "case 4 #{future_pos}"
            end
        end
        moves_in_dir
    end


end

module Stepable

    def moves
        dirs = self.move_diffs
        moves = []
        dirs.each do |diff|
            moves << [@pos[0] + diff[0], @pos[1] + diff[1]]
        end
        moves
    end

    def move_diffs
        raise "Move diffs in Stepable needs to be overwritten"
    end

end