class PolyTreeNode
  attr_reader :parent, :children, :value
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent != nil
      @parent.children.delete(self)
    end
    if node != nil
      @parent = node
      node.children << self if !node.children.include?(self) 
    else
      @parent = nil
    end
  end

  def add_child(child)
    #self.children << child if !self.children.include?(child)
    child.parent = self
  end

  def remove_child(child)
    if child.parent == nil
        raise "not a child"
    else
        child.parent = nil
    end
  end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            var = child.dfs(target)
            return var if var != nil
        end
        nil
    end

    def bfs(target)
      queue = [self]
      while queue != [] && queue[0].value != target
        queue += queue.shift.children
      end
      return queue[0]
    end


end