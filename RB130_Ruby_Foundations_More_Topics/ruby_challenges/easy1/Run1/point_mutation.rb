=begin

Input : two DNA sequence strings

Output : Hamming distance of the two input strings

Rules
  Hamming distance is calculated by the differences in DNA sequence
  if two strings are of unequal length, use the short string as base comparison
Data structure / Algorithms
    create a variable for counting the differences
    iterate through the shorter of the two strings, with index
      if the current letter is not equal to the other sequence's letter at the same index, increment the Hamming distance by 1
    return the Hamming distance

=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    max_index = [@strand.length, other_strand.length].min
    (0...max_index).each do |index|
      distance += 1 if @strand[index] != other_strand[index]
    end

    distance
  end

end