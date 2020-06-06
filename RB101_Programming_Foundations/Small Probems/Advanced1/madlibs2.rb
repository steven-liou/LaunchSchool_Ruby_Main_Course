# input : a text file with paragraphs with noun, verb, adjective, adverb that would be replaced from random lists of respective type
# output : print out same text, but with placeholders replaced with the random words

# go through each word of the text, if the text mataches noun, verb, adjective, adverb,
# randomly pick an element from the list of that type and replace the word



nouns = ["cat,", "dog", "pig", "elephant", "moose", "chicken"]
verbs = ["jumps", "barks", "runs", "hops", "dodges", "meows", "eats", "drinks"]
adjetives = ["cute", "big", "small", "happy", "sad", "deranged", "crazy", "hippity-hoppity"]
adverbs = ["slowly", "frantically", "slyly", "loudly", "clumsily", "innocently", "deviously"]



text = File.open("madlibs_text.txt")

text_array = text.read.split.map do |word|
  case word
  when /noun.?/    then nouns.sample
  when /verb.?/      then verbs.sample
  when /adjective.?/ then adjetives.sample
  when /adverb.?/    then adverbs.sample
  else                  word
  end
end
text = text_array.join(' ')

 puts text