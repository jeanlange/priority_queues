class SortedListPrioritizer
    def initialize
        @first = OrderedNode.new
    end
    def is_empty?
        @first.nil? || (!@first.get(0) && !@first.next)
    end
    def push value, priority
        @first.add value, priority
    end
    def [] index
        @first.get index
    end
    def pop
        if @first == nil
            return nil
        end
        value = @first.get 0
        @first = @first.next
        return value
    end
    def print
        node = @first
        output = ""
        while node
            output << node.value + ", "
            node = node.next
        end
        output
    end
end

class OrderedNode
    attr_reader :priority
    attr_reader :next
    attr_reader :value

    def initialize
        @value = nil
        @priority = nil
        @next = nil
    end

    def add value, priority
        if @value == nil # if I am empty, I should add to myself
            @value = value
            @priority = priority
            return
        end
        if priority > @priority # if I am the first node, what if a more important number is inserted?
            newNode = OrderedNode.new
            newNode.add @value, @priority
            newNode.link @next
            @next = newNode
            @value = value
            @priority = priority
            return
        end
        if @next == nil # if my next is empty, I should create it then call add
            @next = OrderedNode.new
            @next.add value, priority
            return
        end
        if @next.priority < priority # the next one in the chain is less important, I should go here
            newNode = OrderedNode.new
            newNode.add value, priority
            newNode.link @next
            @next = newNode
            return
        end
        @next.add value, priority
    end

    def link node
        @next = node
    end

    def get index 
        if index > 0
            if @next == nil
                return nil
            end
            return @next.get(index - 1)
        else
            return @value
        end
    end
end
