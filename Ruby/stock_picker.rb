def stock_picker(array)
  array = array.reverse
  differences = []
  # For each stock item
  array.each_with_index do |sell_price, sell_index|
  	# Get the next one
    buy_index = sell_index + 1
    # As long as there are still items behind the stock
    while buy_index < array.length
     # Get all the differences between bought price and all the possible sell prices
      buy_price = array[buy_index]
      differences << sell_price - buy_price
      # If it's a new max hange the buy and sell days
      if differences.max <= sell_price - buy_price
        @buyday = buy_index
        @sellday = sell_index
        @time = @buyday - @sellday
      end
       buy_index += 1
    end
  end
  "Buy at #{array[@buyday]}$ on day #{array.length - @buyday} and sell at #{array[@sellday]}$ on day #{array.length - @sellday} for a profit of #{differences.max}$/share for a wait of #{@time} day(s)"
end
stock_picker([17,3,6,9,15,8,6,1,10,13])
