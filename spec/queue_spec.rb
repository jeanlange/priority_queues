require 'array_sort_prioritizer'
require 'sorted_list_prioritizer'
require 'gap_array_prioritizer'
require 'heap_prioritizer'

describe Node do
    it "can be created" do
        node = Node.new
        expect(node.priority).to eql 0
        expect(node.value).to eql ""
    end

    it "can be compared" do
        low_priority_node = Node.new("Jean", 0)
        high_priority_node = Node.new("Jean!", 10)
        expect(low_priority_node).to be < high_priority_node
    end
end

RSpec.shared_examples "queue functionality" do |queue_type|
    let(:my_prioritizer) { queue_type.send(:new) }

    context "#is_empty" do
        it "is true for an empty queue" do
            expect(my_prioritizer.is_empty?).to eql true
        end
        it "is false for a queue with something in it" do
            my_prioritizer.push("jean", 5)
            expect(my_prioritizer.is_empty?).to eql false
        end
    end

    context "#pop" do
        it "returns the highest priority element" do
            my_prioritizer.push("jean3", 3)
            my_prioritizer.push("jean15", 15)
            my_prioritizer.push("jean8", 8)
            best = my_prioritizer.pop
            expect(best).to eql "jean15"
            best = my_prioritizer.pop
            expect(best).to eql "jean8"
        end

        it "removes the item that was popped" do
            my_prioritizer.push("some value",0)
            my_prioritizer.pop
            expect(my_prioritizer.is_empty?).to eql true
        end

        it "returns nil if you try to pop an empty queue" do
            best = my_prioritizer.pop
            expect(best).to be nil
        end
    end
end

RSpec.describe ArraySortPrioritizer do
    include_examples "queue functionality", ArraySortPrioritizer
end

RSpec.describe SortedListPrioritizer do
    include_examples "queue functionality", SortedListPrioritizer
end

# RSpec.describe GapArrayPrioritizer do
#     include_examples "queue functionality", GapArrayPrioritizer
# end

RSpec.describe HeapPrioritizer do
    include_examples "queue functionality", HeapPrioritizer
end

describe "performance comparisons" do
    def big_array(size)
        (1..size).map do
            rand(size)
        end
    end

    let(:bigness) { 5000 }
    let(:values) { big_array(bigness) }
    let(:priorities) { big_array(bigness) }
    let(:queues) {
        [
            ArraySortPrioritizer,
            SortedListPrioritizer,
            GapArrayPrioritizer,
            HeapPrioritizer,
        ]
    }
    let(:format_string) { '%-24s %-18s %s' }
    def title_row
        format_string % ["Prioritizer type", "push time", "pop time"]
    end

    it "can do a bunch of random numbers" do
        puts "sorting #{bigness} random numbers"
        puts title_row
        queues.each do |q|
            my_queue = q.send(:new)
            start_time = Time.now
            bigness.times do |i|
                my_queue.push(values[i], priorities[i])
            end
            end_time = Time.now
            push_time = end_time - start_time

            start_time = Time.now
            bigness.times do
                my_queue.pop
            end
            end_time = Time.now
            pop_time = end_time - start_time
            puts format_string % [q, push_time, pop_time]
        end
    end

    it "can do a bunch of small to big ordered numbers" do
        puts "sorting #{bigness} small to big numbers"
        puts title_row
        queues.each do |q|
            my_queue = q.send(:new)
            start_time = Time.now
            bigness.times do |i|
                my_queue.push(i, i)
            end
            end_time = Time.now
            push_time = end_time - start_time

            start_time = Time.now
            bigness.times do
                my_queue.pop
            end
            end_time = Time.now
            pop_time = end_time - start_time
            puts format_string % [q, push_time, pop_time]
        end
    end

    it "can do a bunch of big to small ordered numbers" do
        puts "sorting #{bigness} big to small numbers"
        puts title_row
        queues.each do |q|
            my_queue = q.send(:new)
            start_time = Time.now
            bigness.times do |i|
                my_queue.push(bigness - i, bigness - i)
            end
            end_time = Time.now
            push_time = end_time - start_time

            start_time = Time.now
            bigness.times do
                my_queue.pop
            end
            end_time = Time.now
            pop_time = end_time - start_time
            puts format_string % [q, push_time, pop_time]
        end
    end
end
