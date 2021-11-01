module Searchable

    def dfs(target)
        return self if self.value == target
        children.each do |child|
            result = child.dfs(target)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            this_node = queue.shift
            return this_node if this_node.value == target
            this_node.children.each { |child| queue << child }
        end
        nil
    end
    
end

class PolyTreeNode
    include Searchable
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if !@parent.nil?
            @parent.children.delete(self)
        end
        @parent = node
        if !node.nil? && !node.children.include?(self)
            node.children << self
        end
    end

    def add_child(node)
        if !@children.include?(node)
            @children << node
            node.parent = self
        end
    end

    def remove_child(node)
        if !@children.include?(node)
            raise ArgumentError.new('Node is not a child.')
        end
        node.parent = nil
        @children.delete(node)
    end
end


