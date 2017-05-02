def shift(arr, old_letter, amount)
  # get the index of the letter from array, shift it by #amount & reduce it to < 26
  new_index = arr.index(old_letter) + amount
  arr[new_index % 26] # return letter
end

def replace(old_letter, amount)
  lower = ('a'..'z').to_a
  upper = ('A'..'Z').to_a
  all = lower + upper
  # return when it's a symbol (space, !, dot, ...)
  return old_letter unless all.include? old_letter
  # else get the new position from the correct array (capital or downcase)
  lower.index(old_letter) ? shift(lower, old_letter, amount) : shift(upper, old_letter, amount)
end

def cypher(string, amount = 1)
  amount %= 26 # returns amount to be shifted over 26
  text = string.split('')
  # For each letter in the string, replace it by amount
  new_text = text.collect { |letter| replace(letter, amount) }
  new_text = new_text.join('')
end

