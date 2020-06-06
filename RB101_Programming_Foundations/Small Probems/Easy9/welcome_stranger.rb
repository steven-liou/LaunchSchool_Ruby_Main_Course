
def greetings(array, hash)
  full_name = array.join(' ')
  occupation = hash.values.join(' ')

  "Hello, #{full_name}! Nice to have a #{occupation} around."
end




puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
