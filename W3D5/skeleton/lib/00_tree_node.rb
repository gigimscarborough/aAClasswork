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

    def add_child
        
    end
end