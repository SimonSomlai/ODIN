@roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

#  My Solution
def to_roman(number, result="", split=false)
  split ? map_number(number, result="", true) : split_number(number)
end

def map_number(number, result, split)
  if @roman_mapping[number]
    result << @roman_mapping[number]
  else
    closest = @roman_mapping.keys.min { |a,b| (a-number).abs <=> (b-number).abs } # Get the closest number
    return "" if number == 0
    if number % closest == 0 # Check if it's divisble
      (number / closest).times { result << @roman_mapping[closest]} 
    elsif (number - closest) < 0 # Check if the closest is too large, otherwise get a smaller one
      closest = @roman_mapping.keys[@roman_mapping.keys.index(closest) + 1]
      subtract_number(number, closest, result)
    else # Subtract the smallest, closest number
      subtract_number(number, closest, result)
    end
  end
  result
end

def subtract_number(number, closest, result)
  number -= closest
  result << @roman_mapping[closest]
  result << to_roman(number.to_i, result, true)
end

def split_number(number)
  numbers = number.to_s.split("")
  numbers.collect! {|i| i.ljust((numbers.length - numbers.index(i)), "0")} # Create array from number 125 -> [100, 20, 5]
  numbers.collect! { |i| to_roman(i.to_i, result="", true)}.join("")
end

# Official Solution
def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0
  roman_mapping.keys.each do |divisor|
    quotient, modulus = number.divmod(divisor)
    result << roman_mapping[divisor] * quotient
    return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
  end
end
