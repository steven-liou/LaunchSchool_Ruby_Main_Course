=begin

Input : a rna sequence of string

Output : a sequence of amino acids

Rules
  A codon is a sequence of 3 nucleotides
  There are 4 terminating codons ("Stop" translation),
  the stop codon is not translated into the protein sequence

Data structure / Algorithms
  a hash for codons and their respective amino acids as values
  Have a method that looks up the codon to amino acid table

  return error if sequence contains invalid characters, or length is not divisible by 3
  create an array for storing amino acids
  iterate through the seuqence 3 characters at a time
    look up the codon,
    break if the sequence is 'STOP'
    else, store the amino acid in the array
  join the array by space
=end

class InvalidCodonError < StandardError
end
class InvalidSequenceLengthError < StandardError
end

class Translation
  AMINO_ACIDS = {
    ['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_rna(sequence)
    raise InvalidCodonError if sequence.match(/[^ACGU']/)
    raise InvalidSequenceLengthError if sequence.length % 3 != 0

    amino_acids = []

    0.step(sequence.length - 1, 3) do |index|
      amino_acid = of_codon(sequence[index, 3])
      break if amino_acid == 'STOP'
      amino_acids << amino_acid
    end
    amino_acids
  end

  def self.of_codon(codon)
    AMINO_ACIDS.find { |codons, _| codons.include?(codon) }.last
  end
  
end

