class Piece
    attr_reader :color, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def pos=(val)
        @pos[0], @pos[1] = val[0], val[1]
    end

    def to_s
        symbol.to_s #colorize this?
    end

    def empty?
        false
    end

    def move_into_check?(end_pos) #returns true or false based on if move puts king in check
        # if moves.include?(end_pos) && moves 
    end

end