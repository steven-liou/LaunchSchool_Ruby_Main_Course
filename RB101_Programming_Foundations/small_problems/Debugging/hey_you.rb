
def shout_out_to(name)
  name.upcase!
  loop do
   puts 'HEY ' + name
  end
end

shout_out_to('you') # expected: 'HEY YOU'