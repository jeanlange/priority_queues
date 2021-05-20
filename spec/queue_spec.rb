require 'array_sort_prioritizer'

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

describe ArraySortPrioritizer do
    let(:my_prioritizer) { ArraySortPrioritizer.new }

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
            expect(best.value).to eql "jean15"
            expect(best.priority).to eql 15
        end

        it "removes the item that was popped" do
            my_prioritizer.push("some value")
            my_prioritizer.pop
            expect(my_prioritizer.is_empty?).to eql true
        end

        it "returns nil if you try to pop an empty queue" do
            best = my_prioritizer.pop
            expect(best).to be nil
        end
    end

    context "a performance test" do
        def big_array(size)
            (1..size).map do
                rand(size)
            end
        end

        let(:bigness) { 5000 }
        let(:values) { big_array(bigness) }
        let(:priorities) { big_array(bigness) }
        # let(:list_prioritizer) { ListArraySortPrioritizer}
        let(:queues) { [ArraySortPrioritizer] }
        # let(:queues) { [ArraySortPrioritizer, ListArraySortPrioritizer] }

        it "can do a bunch of random numbers" do
            queues.each do |q|
                my_queue = q.send(:new)
                start_time = Time.now
                bigness.times do |i|
                    my_queue.push(values[i], priorities[i])
                end
                end_time = Time.now
                puts "Time elapsed for #{bigness} with #{q}: #{end_time - start_time} seconds."
            end
        end

        it "can do a bunch of small to big ordered numbers" do
            queues.each do |q|
                my_queue = q.send(:new)
                start_time = Time.now
                bigness.times do |i|
                    my_queue.push(i, i)
                end
                end_time = Time.now
                puts "Time elapsed for #{bigness} with #{q}: #{end_time - start_time} seconds."
            end
        end

        it "can do a bunch of big to small ordered numbers" do
            queues.each do |q|
                my_queue = q.send(:new)
                start_time = Time.now
                bigness.times do |i|
                    my_queue.push(bigness - i, bigness - i)
                end
                end_time = Time.now
                puts "Time elapsed for #{bigness} with #{q}: #{end_time - start_time} seconds."
            end
        end
    end
end
