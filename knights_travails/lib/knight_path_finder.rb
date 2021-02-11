require_relative "00_tree_node.rb"

class KnightPathFinder
  attr_accessor :considered_positions
  attr_reader :root_node
  def initialize(pos)
      @pos = pos
      @root_node = PolyTreeNode.new(pos)
      @considered_positions = [pos]
      self.build_move_tree
  end

  def build_move_tree 
      #bfs self refers to root node
      # start with the root node
      # use pos from root node to generate new_move_positions
      # while loop, end it when queue is empty
      # look at first item in queue, removing it, adding its children (new_move_positions)
      queue = [@root_node]
      until queue.empty?
        parent = queue.shift
        new_moves = new_move_positions(parent.value)
        new_moves.map! {|pos| PolyTreeNode.new(pos)}
        new_moves.map {|node| node.parent = parent}
        queue += new_moves
      end
  end

  def new_move_positions(pos) #returns an array of positions
      new_moves = KnightPathFinder.valid_moves(pos).select do |move|
          !@considered_positions.include?(move)
      end
      @considered_positions += new_moves
      new_moves
  end

  def self.valid_moves(pos) #this should add2 and 1 to both sides of pos respectively in every direction, and filter out negative results
    moves = []
    moves << [pos[0] + 2, pos[1] + 1]
    moves << [pos[0] + 1, pos[1] + 2]

    moves << [pos[0] - 2, pos[1] + 1]
    moves << [pos[0] - 1, pos[1] + 2]

    moves << [pos[0] + 2, pos[1] - 1]
    moves << [pos[0] + 1, pos[1] - 2]

    moves << [pos[0] - 2, pos[1] - 1]
    moves << [pos[0] - 1, pos[1] - 2]

    # moves.each do |move|
    #   moves.delete(move) if move[0] < 0 || move[1] < 0 || move[0] > 7 || move[1] > 7
    # end
    moves.select! do |move|
      move[0] >= 0 && move[1] >= 0 && move[0] <= 7 && move[1] <= 7
    end
    moves
  end

  def find_path(end_pos)
    node_end = @root_node.dfs(end_pos)
    return KnightPathFinder.trace_path_back(node_end)
  end

  def self.trace_path_back(node_end)
    arr = [node_end.value]
    node = node_end
    while node.parent != nil
      node = node.parent
      arr.unshift(node.value)
    end
    arr
  end

end

game = KnightPathFinder.new([0, 0])
# p game
p game.find_path([7, 6])