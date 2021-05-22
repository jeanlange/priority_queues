class Node
    include Comparable
    attr_accessor :value, :priority

    def initialize(value="", priority=0)
        @value = value
        @priority = priority
    end

    def <=>(other)
        @priority <=> other.priority
    end
end

class ArraySortPrioritizer
    attr_accessor :nodes
    def initialize
        @nodes = []
    end

    def is_empty?
        @nodes.empty?
    end

    def push(value, priority=0)
        node = Node.new(value, priority)
        @nodes << node
        @nodes = @nodes.sort
    end

    def pop
        node = @nodes.delete_at(-1)
        if node.nil?
            return node
        else
            return node.value
        end
    end
end
