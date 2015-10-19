class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def count
    if @head.nil?
      return 0
    else
      counter = 1
      if @head.next_node.nil?
        return counter
      else
        current_node = @head
        counter = 1
        until current_node.next_node.nil?
          current_node = current_node.next_node
          counter += 1
        end
      end
      counter
    end
  end

  def push(data)
    if @head.nil?
      @head = Node.new(data)
    else
      last_node.next_node = Node.new(data)
    end
  end

  def pop
    return nil if @head.nil?
    current_node = @head
    until current_node.next_node == nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    if previous_node
      previous_node.next_node = nil
    else
      @head = nil
    end
    current_node.data
  end

  private

  def last_node
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

end