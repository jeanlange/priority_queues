class GapArrayPrioritizer
    def initialize
        @base = []
        @index = nil
    end
    def push value, priority
        if @base[priority] == nil
            @base[priority] = []
        end
        @base[priority] << value
        if @index == nil || @index < priority
            @index = priority
        end
    end
    def pop
        if(@index == nil || @base[@index] == nil || @base[@index].length == 0)
            return nil
        end
        value = @base[@index].delete_at(0)
        @index = get_next
        return value
    end
    def get_next
        @base.reverse_each.with_index do |value, index|
            if value != nil && value.length > 0
                return index
            end
        end
        return nil
    end
    def is_empty?
        return @index == nil
    end
end

