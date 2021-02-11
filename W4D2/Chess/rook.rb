require_relative "piece.rb"
require_relative "modules.rb"

class Rook < Piece
    include Slideable

    def move_dirs
        horizontal_dirs
    end

    def symbol
        :♜
    end

end