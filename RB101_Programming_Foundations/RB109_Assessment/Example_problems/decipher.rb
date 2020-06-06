def reverse_words!(message)

  # First we reverse all the characters in the entire message.
  reverse_characters!(message, 0, message.length - 1)

  # This gives us the right word order
  # but with each word backward.

  # Now we'll make the words forward again
  # by reversing each word's characters.

  # We hold the index of the *start* of the current word
  # as we look for the *end* of the current word.
  current_word_start_index = 0

  (0..message.length).each do |i|

    # Skip unless we're at the end of the current word.
    next unless i == message.length || message[i] == ' '

    reverse_characters!(message, current_word_start_index, i - 1)

    # If we haven't exhausted the string our
    # next word's start is one character ahead.
    current_word_start_index = i + 1
  end
end

def reverse_characters!(message, left_index, right_index)

  # Walk towards the middle, from both sides.
  while left_index < right_index

    # Swap the left char and right char.
    message[left_index], message[right_index] =
      message[right_index], message[left_index]

    left_index  += 1
    right_index -= 1
  end
end

message = 'cake pound steal bake'
reverse_words!(message)
puts message # 'steal pound cake'




##############################
#Refactored code for parallel assignment
# three different approaches

# a = "hello world"
# len = a.length - 1
# middle = a.length / 2 - 1

# for left_idx, right_idx in 0.upto(middle).zip(len.downto(middle + 1))
#   a[left_idx], a[right_idx] = a[right_idx], a[left_idx]
# end

# p a


# for left_idx, right_idx in 0.step(middle).zip(len.step(middle + 1, -1))
#   a[left_idx], a[right_idx] = a[right_idx], a[left_idx]
# end

# p a


# 0.upto(middle).zip(len.downto(middle + 1)).each do |left_idx, right_idx|
#     a[left_idx], a[right_idx] = a[right_idx], a[left_idx]
#   end

# p a