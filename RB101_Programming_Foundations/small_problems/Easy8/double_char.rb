def repeater(string)
  double_string = ''

  string.each_char do |char|
    double_string += char * 2
  end
  double_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''