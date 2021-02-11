require_relative "piece.rb"
require_relative "modules.rb"

class Knight < Piece
    include Stepable

    def move_diffs
        [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    end

    def symbol
        :♞
    end
end