require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  VALID_POSITIONS = [[0, 0], [0 ,1], [0, 2], [1, 0], [1,1], [1, 2], [2,0], [2, 1], [2, 2]]

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made ONE MOVE after
  # the current move.
  def children
    if @next_mover_mark == :x
      @next_mover_mark = :o
    else @next_mover_mark = :x
    end
    new_moves = []
    VALID_POSITIONS.each do |pos|
      if @board.empty?(pos)
        new_board = @board.dup
        new_board[pos] = @next_mover_mark
        new_moves << TicTacToeNode.new(new_board,@next_mover_mark, pos)
      end
    end
    new_moves
  end

  def losing_node?(mark)
    if @board.over?
      if @board.winner != mark
        return true
      else
        return false
      end
    end
    @children.each do |child|
      if child.losing_node?(mark)
        true
      else
        return false
      end
    end
  end
end
