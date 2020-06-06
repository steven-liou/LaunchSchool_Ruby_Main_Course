=begin

Input : name encrypted by Rot13

Output : decryped name

Rules
  each character in the name is transformed by 13 letters

Data structure / Algorithms
  create an empty string for storing decrypted message
  create a lowercase alphabet arrays

  iterate through the current string by char
    if the current char is a letter,
      check whether it is upper or lower case letter
        find its position in the lower case array
        subtract the indeex by 13, and find its modulus by 26
        get the character in the lower case array
        if the letter was uppercase, upcase it
        Concat the letter in the string
    else, just concat the letter to the string
=end

def reverse_rot13(string)
  decode_string = ''
  alphabets = ('a'..'z').to_a

  string.chars.each do |char|
    if char =~ /[a-z]/i
      uppercase = char.upcase == char
      index = alphabets.index(char.downcase)
      rot_index = (index - 13) % 26
      decode_char = alphabets[rot_index].clone
      decode_char.upcase! if uppercase
      decode_string << decode_char
    else
      decode_string << char
    end
  end
  decode_string
end


puts reverse_rot13("Nqn Ybirynpr")
puts reverse_rot13("Tenpr Ubccre")
puts reverse_rot13("Nqryr Tbyqfgvar")
puts reverse_rot13("Nyna Ghevat")
puts reverse_rot13("Puneyrf Onoontr")
puts reverse_rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
puts reverse_rot13("Wbua Ngnanfbss")
puts reverse_rot13("Ybvf Unvog")
puts reverse_rot13("Pynhqr Funaaba")
puts reverse_rot13("Fgrir Wbof")
puts reverse_rot13("Ovyy Tngrf")
puts reverse_rot13("Gvz Orearef-Yrr")
puts reverse_rot13("Fgrir Jbmavnx")
puts reverse_rot13("Xbaenq Mhfr")
puts reverse_rot13("Fve Nagbal Ubner")
puts reverse_rot13("Zneiva Zvafxl")
puts reverse_rot13("Lhxvuveb Zngfhzbgb")
puts reverse_rot13("Unllvz Fybavzfxv")
puts reverse_rot13("Tregehqr Oynapu")