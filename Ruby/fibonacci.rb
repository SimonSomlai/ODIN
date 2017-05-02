def fib(n)
  arr = [0, 1]
  index = arr.length
  n.times do
    arr[index] = (arr[index - 1] + (arr[index - 2]))
    index += 1
  end
  p arr
end

fib(100)

def fib_recur_arr(n, arr=[0, 1])
  index = arr.length
  return arr if index == n
  arr[index] = (arr[index - 1] + arr[index - 2])
  fib_recur_arr(n, arr)
end

p fib_recur_arr(1000)

def fib_recur(n)
  return 1 if n == 1
  return 0 if n == 0
  fib_recur(n - 1) + fib_recur(n - 2)
end

p fib_recur(20)
