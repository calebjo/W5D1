class PolyTreeNode
    #include Searchable
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent = node
        
    end

    def add_child(node)
        if !@children.include?(node)
            @children << node
            node.parent = self
        end
    end

    def remove_child(node)
        if !@children.include?(node)
            raise 'Node is not a child.'
        end
        node.parent = nil
        @children.delete(node)
    end
end