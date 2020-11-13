class PolyTreeNode
# # Write a #parent= method which (1) sets the parent property and (2) adds the node to
#  their parent's array of children (unless we're setting parent to nil).

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(value)
        return if @parent == value
        if @parent #old parent exists
            @parent.children.delete(self)
            @parent = value #now our new parent is another node or nil
            unless @parent == nil #new parent not nil
                value.children << self
            end
        else #old parent nil
            @parent = value
            value.children << self
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if self.children.include?(child)
            child.parent = nil
        else
            raise "error: not a child node"
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.value == nil

        self.children.each do |child| 
            sub_result = child.dfs(target_value)
            return sub_result unless sub_result.nil?
        end
        nil
    end

    def bfs(target_value)
        @queue = [self]
        until @queue.empty?
            if @queue.first.value == target_value
                return @queue.first
            else
                @queue.first.children.each do |child|
                    @queue << child
                end
                @queue.shift
            end
        end
        nil
    end
end


