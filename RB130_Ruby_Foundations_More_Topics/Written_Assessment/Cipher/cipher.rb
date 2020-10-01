# rubocop:disable Layout/LineLength
=begin

Input : a string that needs to be encrypted

Output : encrypted string

Rules
  - Replace each letter in the original string with another letter
  - The first letter of the alphabet should be replaced with the last (A replaced with Z)
  - The second letter of the alphabet should be replaced with the next to last (B replaced with Y)
  - The third letter of the alphabe should be replaced with the second from the last (C replaced with X)
  - and so on...
  - non-alphabet characters should be ignored. Numbers should be kept
  - insert a space every 5 letters
  - everything should be lower case
Data structure / Algorithms
  - Create a hash table with key the alphabet, and the value the ciphered alphabet

  - Process the input string, remove non-alphanumeric characters

  - encryption steps
    - create a cipher string for result
    - Iterate through the alphanumeric string by character, with index
      - if the character is a letter
        - lookup the hash table with the current character as key, store the value into the result string
      else
        store the value into the result string
      - if the current index + 1 is dividible by 5, then insert a space

=end
# rubocop:enable Layout/LineLength

module Cipher
  def self.encode(string)
    raise ArgumentError unless string.instance_of?(String)
    alpha_num = string.gsub(/[^\w]/, '').downcase
    cipher_hash = create_cipher_hash

    alpha_num.each_char.with_index.with_object('') do |(char, index), cipher|
      cipher << (char =~ /[a-z]/ ? cipher_hash[char] : char)
      cipher << ' ' if (index + 1) % 5 == 0 && index < alpha_num.length - 1
    end
  end

  def self.create_cipher_hash
    alphabets = ('a'..'z').to_a
    alphabets.each_with_index.with_object({}) do |(char, index), hash|
      hash[char] = alphabets[-(index + 1)]
    end
  end
end
