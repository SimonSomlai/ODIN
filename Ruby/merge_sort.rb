def merge(left, right)
  merge = []
  while left.size > 0 && right.size > 0
  	p "Comparing #{left.first} with #{right.first}. #{(left.first <= right.first ? left.first : right.first)} is the lowest!"
    merge.push(left.first <= right.first ? left.shift : right.shift)
  end
  merge.concat(right).concat(left) # One half is shifted empty
  p "Result of merge = #{merge}"
  return merge
end


def merge_sort(arr)
  return arr if arr.size == 1
  left, right = arr.each_slice((arr.size / 2.0).round).to_a
  p "Splitting array into #{left} and #{right}"
  merge(merge_sort(left), merge_sort(right))
end

p merge_sort([9, 6, 8, 1, 3, 2, 5, 4, 7])
