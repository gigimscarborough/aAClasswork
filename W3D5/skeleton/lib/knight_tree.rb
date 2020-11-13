require_relative "00_tree_node"

class KnightPathFinder

    def initialize(position)
        @position = position
        @considered_positions = [@position]
    end

    def self.root_node(position)
        PolyTreeNode.new(position)
    end


    def self.valid_moves(pos)
        row, col = pos
        @possible_moves = [
            [row+2, col+1],
            [row+2, col-1],
            [row+1, col+2],
            [row+1, col-2],
            [row-2, col+1],
            [row-2, col-1],
            [row-1, col+2],
            [row-1, col-2]
        ]
        @possible_moves.reject { |moves| moves[0] < 0 && moves[0] > 7 || moves[1] < 0 && moves[1] > 7}
    end

    def new_move_positions(pos)
        new_positions = self.class.valid_moves(pos).reject do |move| 
            @considered_positions.include?(move)
        end
        new_positions.each { |move| @considered_positions << move }
        new_positions #or @considered positions??? worded weird
    end

    def build_move_tree
        move_tree = self.new_move_positions.map { |move| self.class.root_node(move) }
        move_tree.each do |position| 
            


    end
end