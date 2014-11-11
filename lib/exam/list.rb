
Node = Struct.new(:value, :prev, :next)
class Node
  include Comparable
  def <=> (other)
    value <=> other.value
  end
end

class List

  include Enumerable

	def initialize(value)
		@head = Node.new(value)
	end

	def pop()
    freeNode = @head.value
    if @head.next == nil
      return
    end
    @head = @head.next
    @head.prev = nil
    freeNode
  end

  def add(value)
    current = @head
    while current.next != nil
      current = current.next
    end 
    current.next = Node.new(value,current)
  end

  def add_top(value)
    current = @head
    nodeNew = Node.new(value)
    @head = nodeNew
    current.prev = @head
    @head.next = current
  end

  def add_many(values)
		values.each do |x| 
      add(x)
    end
	end

	def head
		@head.value.to_s
	end

  def each
    current = @head
    while current != nil 
      yield current.value
      current = current.next
    end
  end

#Método creado para comprobar que está doblemente enlazada.
  def print_reverse
    current = @head
    while current.next != nil
      current = current.next
    end
    while current.prev != nil
      puts current.value
      current = current.prev     
    end
    puts current.value
  end
end





