# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

def get_tip
  print "What is the bill? "
  amount = gets.chomp.to_f
  print "What is the tip percentage? "
  perc_tip = gets.chomp.to_f

  tip = amount * perc_tip / 100
  total = tip + amount
  
  puts "The tip is $#{format("%.2f", tip)}"
  puts "The total is $#{format("%.2f", total)}"
end

get_tip