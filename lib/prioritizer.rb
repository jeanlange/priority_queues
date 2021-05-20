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

class Prioritizer
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
        @nodes.delete_at(-1)
    end
end
