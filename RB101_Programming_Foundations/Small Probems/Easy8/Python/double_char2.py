
# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.



#apply the previous method only if the current char is a consonant



def double_consonants(string):
    array = [""] * len(string)

    for idx, char in enumerate(string):
        if char.lower() not in ['a', 'e', 'i', 'o', 'u'] and char.isalpha():
            array[idx] = char * 2
        else:
            array[idx] = char

    return ''.join(array)





print(double_consonants('String') == "SSttrrinngg")
print(double_consonants("Hello-World!") == "HHellllo-WWorrlldd!")
print(double_consonants("July 4th") == "JJullyy 4tthh")
print(double_consonants('') == "")