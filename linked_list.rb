class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  #adds a new node containing value to the end of the list
  def append(value)
    new_node = Node.new(value)
    if tail.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end
  
  #prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
    @size += 1
  end

  #size returns the total number of nodes in the list
  def size
    @size
  end

  #head returns the first node in the list
  def head
    @head
  end

  #tail returns the last node in the list
  def tail
    @tail
  end

  #at(index) returns the node at the given index
  def at(index)
    node = @head
    idx = 0
    return nil if index.negative? || index > @size
    while idx < index
      node = node.next_node
      idx += 1
    end
    node
  end

  #pop removes the last element from the list
  def pop
    return nil if @tail.nil? || @head.nil?
    if @head == @tail
      @head = nil
      @tail = nil
    else
      current_node = @head
      while current_node.next_node != @tail
        current_node = current_node.next_node
      end
      @tail = current_node
      @tail.next_node = nil
    end
    @size -= 1
  end

  #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = @head
    while current_node != nil 
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  #find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    current_node = @head
    idx = 0
    while current_node != nil
      return idx if current_node.value == value
      current_node = current_node.next_node
      idx += 1
    end
    nil
  end

  #to_s represent LinkedList objects as strings, so you can print them out and preview them in the console. 
  def to_s
    current_node = @head
    string = ""
    while current_node != nil
      string += "( #{current_node.value} ) ->"
      current_node = current_node.next_node
    end
    string += " nil"
  end

  def insert_at(value, index)
    if index.negative?
      nil
    elsif index == 0
      prepend(value)
    elsif index == @size
      append(value)
    else
      node = Node.new(value)
      current_node = @head
      idx = 0
      while idx < index - 1
        current_node = current_node.next_node
        idx += 1
      end
      node.next_node = current_node.next_node
      current_node.next_node = node
      @size += 1
    end
  end

end

class Node
  attr_accessor :next_node, :value

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append("Ruby")
list.prepend ("Python")

list.size

list.append("Rust")
list.pop

list.at(0)

list.find("Ruby")
list.find("C++")

list.contains?("Ruby")
list.contains?("Golang")

list.to_s

list.insert_at('hello', 1)
list.to_s