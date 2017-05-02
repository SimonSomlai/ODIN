class LinkedList
  attr_accessor :name
  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(node)
    if @head.nil? # Check if the list is empty
      @head = node # Set head to node
      @tail = node # Set tail to node
    else
      node.next_node = @head # If list isn't empty, set pointer to current head
      @head = node # Set head to new head
    end
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node # Get the current last element and set pointer to node
      @tail = node # Set the tail to the new node
    end
  end

  def values
    elem = @head
    values = []
    until elem == nil
      values << elem.value
      elem = elem.next_node
    end
    values
  end

  def size
    head = @head
    count = 0
    until head == nil
      head = head.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    if index == 0
      @head
    else
      head = @head
      index.times do |node| # Go down the linked list x number of times
        elem = head.next_node
        head = elem
      end
      head
    end
  end

  def pop
    if @tail == nil
      p "No elements in linked list"
    else
      new_last_node = self.at(self.size - 2) # Get the element before the last one
      new_last_node.next_node, @tail = nil # Remove last node and set element before last one pointer to nil
      @tail = new_last_node # Set tail to new last node
    end
  end

  def contains?(value)
    self.values.include? value
  end

  def find(value)
    self.contains?(value) ? self.values.index(value) : nil
  end

  def to_s
   elem = @head
   print 'head ->'
   until elem == nil
      print " #{elem.value} --> #{elem.next_node || 'nil'},"
      elem = elem.next_node
    end
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value=nil,next_node=nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
p "List instantiated!"
p list
p list.size
p "Prepending first node"
list.prepend(Node.new(1))
p list
p list.size
p "Prepending second node"
list.prepend(Node.new(5))
p list
p list.size
p "Appending third node"
list.append(Node.new(15))
p list
p list.size
p "Head: #{list.head}"
p "Tail: #{list.tail}"
value = 3
p "List to string"
p list.to_s
p "Node at index #{value}"
p list.at(value)
p "Popping last node"
list.pop
p list
p list.size
p "List contains element with value 15?"
p list.contains?(15)
p "Find node index where value is 5"
p list.find(5)