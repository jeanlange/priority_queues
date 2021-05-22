require 'array_sort_prioritizer.rb'

class HeapPrioritizer
    def initialize
        @nodes = []
    end

    def is_empty?
        @nodes.empty?
    end

    def swim(current_position)
        swippy_swappy = true
        while current_position > 0 && swippy_swappy
            parent_position = (current_position - 1) / 2
            if @nodes[current_position] > @nodes[parent_position]
                @nodes[current_position], @nodes[parent_position] = @nodes[parent_position], @nodes[current_position]
            else
                swippy_swappy = false
            end
        end
    end

    def push(value, priority=0)
        @nodes << Node.new(value, priority)
        current_position = @nodes.length - 1
        swim(current_position)
    end

    def has_children?(position)
        !!@nodes[left_child(position)]
    end

    def left_child(position)
        position * 2 + 1
    end

    def right_child(position)
        position * 2 + 2
    end

    def pop
        best = @nodes[0]
        current_position = 0
        while has_children? current_position
            left = @nodes[left_child current_position]
            right = @nodes[right_child current_position]
            if right && right > left
                @nodes[current_position] = right
                current_position = right_child current_position
            else
                @nodes[current_position] = left
                current_position = left_child current_position
            end
        end

        # put the last node in the newly empty spot
        if current_position == @nodes.length - 1
            @nodes.delete_at(-1)
        else
            @nodes[current_position] = @nodes.delete_at(-1)
            swim(current_position)
        end

        if best.nil?
            return best
        else
            return best.value
        end
    end
end