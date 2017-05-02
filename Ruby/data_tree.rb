require 'yaml'

class Node
  attr_accessor :value, :left, :right, :parent
  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end
end

class Tree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  def build_sorted(array) # Builds from sorted array recursively
    return Node.new(array[0]) if array.length <= 1
    value = array[array.length / 2] # Search for the middle value in the sorted array (= root)
    array -= [value] # Remove it from the array
    left  = array[0..(array.length / 2 - 1)] # Split the remaining halves and do the same
    right = array - left
    Node.new(value, nil, build_sorted(left), build_sorted(right)) # Returns root node
  end

  def build(array, current = nil) # Build from unsorted array
    if $root.nil? # Set root if it doesn't exist
      $root = Node.new(array[0], nil)
      current = $root # Set current to root
    end
    while array.length != 1 # As long as array has nodes to build, build the tree
      node_value = array[1]
      if current.value >= node_value # Going left down the tree
        if current.left.nil? # Is there a node? No -> Create new node, remove element from array
          current.left = Node.new(node_value, current)
          array.delete_at(array.find_index(node_value))
          current = $root
        else # No -> Set current node to that node
          current = current.left
        end
      else # Going right down the tree
        if current.right.nil? # Is there a node?  No -> Create new node, remove element from array
          current.right = Node.new(node_value, current)
          array.delete_at(array.find_index(node_value))
          current = $root
        else # No -> Set current node to that node
          current = current.right
        end
      end
    end
    @root = $root
  end

  # ----------------------- SEARCH/TRAVERSE METHODS ----------------------------------------------

  # Returns sorted array of binary tree. Left node, value, right node
  def inorder_traverse(node, data = [])
    return data if node.nil?
    inorder_traverse(node.left, data) # Read left most node
    data << node.value # Read value
    inorder_traverse(node.right, data) # Read right most node
    data
  end

  def dfs_rec(value, node = @root)
    return node.to_yaml if node.value == value
    dfs_rec(value, node.left) if node.left
    dfs_rec(value, node.right) if node.right
  end

  def bfs(value)
    to_visit = [@root]
    to_visit.each do |node|
     return node.to_yaml if node.value == value
     to_visit << node.left if node.left
     to_visit << node.right if node.right
   end
   return nil
  end
end

data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new
tree.build(data)
puts tree.dfs_rec(5)
puts tree.bfs(7)
