require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
    attr_reader :color, :symbol
    include Singleton
    def initialize
        @color = :brown
    end

    def symbol
        @symbol = " "
    end

    def empty?
        true
    end

    def moves
    end

end