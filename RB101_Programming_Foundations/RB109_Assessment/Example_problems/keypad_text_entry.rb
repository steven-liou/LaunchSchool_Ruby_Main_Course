=begin
Prior to having fancy iPhones, teenagers would wear out their thumbs sending SMS messages on candybar-shaped feature phones with 3x4 numeric keypads.

------- ------- -------
|     | | ABC | | DEF |
|  1  | |  2  | |  3  |
------- ------- -------
------- ------- -------
| GHI | | JKL | | MNO |
|  4  | |  5  | |  6  |
------- ------- -------
------- ------- -------
|PQRS | | TUV | | WXYZ|
|  7  | |  8  | |  9  |
------- ------- -------
------- ------- -------
|     | |space| |     |
|  *  | |  0  | |  #  |
------- ------- -------
Prior to the development of T9 (predictive text entry) systems, the method to type words was called "multi-tap" and involved pressing a button repeatedly to cycle through the possible values.

For example, to type a letter "R" you would press the 7 key three times (as the screen display for the current character cycles through P->Q->R->S->7). A character is "locked in" once the user presses a different key or pauses for a short period of time (thus, no extra button presses are required beyond what is needed for each letter individually). The zero key handles spaces, with one press of the key producing a space and two presses producing a zero.

In order to send the message "WHERE DO U WANT 2 MEET L8R" a teen would have to actually do 47 button presses. No wonder they abbreviated.

For this assignment, write a module that can calculate the amount of button presses required for any phrase. Punctuation can be ignored for this exercise. Likewise, you can assume the phone doesn't distinguish between upper/lowercase characters (but you should allow your module to accept input in either for convenience).

Hint: While it wouldn't take too long to hard code the amount of keypresses for all 26 letters by hand, try to avoid doing so! (Imagine you work at a phone manufacturer who might be testing out different keyboard layouts, and you want to be able to test new ones rapidly.)
=end




# create a hash map that correspond each letter to the number of presses
# iterate through the string, and get the number of press for that character, add it to total count


once = Hash.new {|hash, key| hash[key] = 1}
%w(A D G J M P T W * \  # 1).each { |char| once[char] }


twice = Hash.new {|hash, key| hash[key] = 2}
%w(B E H K N Q U X 0).each { |char| twice[char] }

thrice = Hash.new { |hash, key| hash[key] = 3 }
%w(C F I L O R V Y 2 3 4 5 6 8).each { |char| thrice[char] }

quad = Hash.new { |hash, key| hash[key] = 4 }
%w(S Z).each { |char| quad[char] }

penta = Hash.new { |hash, key| hash[key] = 5 }
%w(7 9).each { |char| quad[char] }

TAPS = once.merge(twice, thrice, quad, penta)


def presses(string)
  presses = 0

  string.each_char do |char|
    presses += TAPS[char.upcase]
  end
  presses
end


p presses("LOL")
p presses("HOW R U")