# sort the array of hash based on publication of each book, from earliest to latest


books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort {|a, b| a[:published] <=> b[:published]}. tap {|val| p val}
#alternative

books.sort_by do |book|
  book[:published]
end