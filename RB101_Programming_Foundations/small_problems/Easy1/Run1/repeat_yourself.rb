#Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat_yourself(string, pos_int)
  #check if the number is indeed pos_int, if it is negative, change its sign
  if pos_int < 0
    pos_int = -pos_int
  end

  pos_int.times do 
    puts string
  end
end

repeat_yourself("Hello world", -5)