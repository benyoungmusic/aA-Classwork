require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"

class Display

    def initialize
        @cursor = Cursor.new([0, 0], board)
    end

end

    # def display
    #     @rows.each do |row|
    #         row.each do |piece|
    #             print piece.to_s
    #         end
    #         puts
    #     end
    #     puts
    # end