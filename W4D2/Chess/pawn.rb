require_relative "piece.rb"

class Pawn < Piece

    def at_start_row?
        if @pos[0] == 1 || @pos[0] == 6
            return true
        end
        false
    end

    def forward_dir
        if @color == :white
            return 1
        end
        -1
    end

    def forward_steps
        forward = []
        forward << [@pos[0] + self.forward_dir, @pos[1]]
        if self.at_start_row?
            forward << [@pos[0] + (2 * self.forward_dir), @pos[1]]
        end
        forward
    end

    def side_attacks
        side_attacks = []
        white1 = [@pos[0] + 1, @pos[1] - 1]
        white2 = [@pos[0] + 1, @pos[1] + 1]
        black1 = [@pos[0] - 1, @pos[1] + 1]
        black2 = [@pos[0] - 1, @pos[1] - 1]

        if white1[0] < 8 && white1[0] >=0 && white1[1] < 8 && white1[1] >=0 && @color == :white && @board[white1].color == :black 
            side_attacks << [@pos[0] + 1, @pos[1] - 1]
        end
        if white2[0] < 8 && white2[0] >=0 && white2[1] < 8 && white2[1] >=0 && @color == :white && @board[white2].color == :black
            side_attacks << [@pos[0] + 1, @pos[1] + 1]
        end
        if black1[0] < 8 && black1[0] >=0 && black1[1] < 8 && black1[1] >=0 && @color == :black && @board[black1].color == :white
            side_attacks << [@pos[0] - 1, @pos[1] + 1]
        end
        if black2[0] < 8 && black2[0] >=0 && black2[1] < 8 && black2[1] >=0 && @color == :black && @board[black2].color == :white
            side_attacks << [@pos[0] - 1, @pos[1] - 1]
        end

        return side_attacks
    end

    def moves
        self.forward_steps + self.side_attacks
    end

    def symbol
        :♟
    end
end