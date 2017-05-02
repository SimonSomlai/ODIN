def sorted?(arr)
  index = 0
  until index == arr.length - 1 do
      (arr[index] <= arr[index + 1]) ? true : (return false)
      index += 1
    end
    return true
  end
end

def bubble_sort(arr)
  arr.each_with_index do |number, index|
    (number <=> arr[index + 1]) == 1 ? (arr[index], arr[index + 1] = arr[index + 1], arr[index]) : next
  end
  sorted?(arr) ? arr : bubble_sort(arr)
end

def bubble_sort_by(arr)
  arr.each_with_index do |arg, index|
    index < arr.length - 1 ? yield(arg, arr[index + 1]) == 1 ? (arr[index], arr[index + 1] = arr[index + 1], arr[index]) : next : (return arr)
  end
  sorted?(arr) ? arr : bubble_sort_by(arr)
end

bubble_sort([4,3,78,2,0,2])
bubble_sort_by(["hi", "hey", "hello"]) do |left,right|
  left.length <=> right.length
end
