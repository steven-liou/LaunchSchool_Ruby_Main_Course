class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(compare_strand)
    @strand.chars
           .zip(compare_strand.chars)
           .select { |array| array.none?(nil) }
           .count { |acid1, acid2| acid1 != acid2 }
  end
end