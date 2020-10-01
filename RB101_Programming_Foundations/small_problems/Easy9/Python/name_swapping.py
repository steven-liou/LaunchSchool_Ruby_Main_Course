# rite a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.


# Split the string into words
# join the words in reverse word with a ', '

def swap_name(string):
    words = string.split()
    return ', '.join(words[::-1])

print(swap_name('Joe Roberts') == 'Roberts, Joe')