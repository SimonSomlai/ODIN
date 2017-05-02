def splitter(string, array)
@string = string.split("")
substrings = [] + @string
substring_counter = Hash.new(0)
# Generate a array of all possible substrings (substrings)
@string.each_with_index do |letter, index|
	next_index = index + 1
	until next_index >= @string.length
	substrings << string[index..next_index].downcase
	next_index += 1
	end
end
# Check if any substrings match the dictionary, push matchings to hash (substring_counter)
substrings.pop().gsub!(/\s+/, "%") 
substrings.each {|str| (array.include? str) ? (substring_counter[str] += 1) : next}
substring_counter
end

splitter("Howdy partner, sit down! How's it going?", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])