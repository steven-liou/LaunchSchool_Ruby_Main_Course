# input: a string with a word
# output : true/false if the word can be spelled with the "block"

# background: each spelling block has 2 letters, when a letter is used, each block can only be used one to spell the word

# iterate through each block, check if the word contains either letter in the block,
# if it does, remove that first instance from the word.
# check again if the word contains either letter in the block, if it does, return false

# if neither, go to next block. return true at the end of execution

BLOCK = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  repeat = BLOCK.any? do |block|
            word.count(block) >= 2
          end

  !repeat
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('BATBCH') == false
