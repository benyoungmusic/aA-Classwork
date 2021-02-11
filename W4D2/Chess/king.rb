require_relative "piece.rb"
require_relative "modules.rb"

class King < Piece
    include Stepable

    def move_diffs
        [[1, 0], [1, 1], [1, -1], [-1, 0], [-1, 1], [-1, -1], [0, 1], [0, -1]]
    end

    def symbol
        :♚
    end
end