require_relative "piece.rb"
require_relative "nullpiece.rb"
require_relative "pawn"
require_relative "bishop"
require_relative "queen"
require_relative "king"
require_relative "rook"
require_relative "knight"
require "byebug"
require "colorize"

class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8, @null_piece)}
        self.build_board
    end

    def build_board
        # create pawns
        @rows[1].each_with_index {|ele, i| @rows[1][i] = Pawn.new(:white, self, [1, i])}
        @rows[6].each_with_index {|ele, i| @rows[6][i] = Pawn.new(:black, self, [6, i])}
        # #white pieces
        @rows[0][0] = Rook.new(:white, self, [0, 0])
        @rows[0][7] = Rook.new(:white, self, [0, 7])
        @rows[0][1] = Knight.new(:white, self, [0, 1])
        @rows[0][6] = Knight.new(:white, self, [0, 6])
        @rows[0][2] = Bishop.new(:white, self, [0, 2])
        @rows[0][5] = Bishop.new(:white, self, [0, 5])
        @rows[0][3] = King.new(:white, self, [0, 3])
        @rows[0][4] = Queen.new(:white, self, [0, 4])
        #black pieces
        @rows[7][0] = Rook.new(:black, self, [7, 0])
        @rows[7][7] = Rook.new(:black, self, [7, 7])
        @rows[7][1] = Knight.new(:black, self, [7, 1])
        @rows[7][6] = Knight.new(:black, self, [7, 6])
        @rows[7][2] = Bishop.new(:black, self, [7, 2])
        @rows[7][5] = Bishop.new(:black, self, [7, 5])
        @rows[7][4] = King.new(:black, self, [7, 4])
        @rows[7][3] = Queen.new(:black, self, [7, 3])

    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos] #[[0, 0]] [0][0]
        if piece.moves.include?(end_pos)
            add_piece(piece, end_pos)
            self[start_pos] = @null_piece
        else
            raise "That is not a valid move"
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end
    
    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def display
        @rows.each do |row|
            row.each do |piece|
                print piece.to_s
            end
            puts
        end
        puts
    end

end


board = Board.new
board.display
p board[[0, 1]].moves
board.move_piece([0, 1], [2, 2])
board.display

