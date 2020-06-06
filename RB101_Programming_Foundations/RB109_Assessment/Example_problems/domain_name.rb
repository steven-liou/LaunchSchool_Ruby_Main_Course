# input : a string with url
# output : a string with only the domain name

# domain name is between //, an optional www., and before the .com

# have a check to see if the two / have been reached.
# check forward to see if the next three characters are www
# if it is true, then skip idx by 4
# else start storing the characters
# for each character, chec kif the next 4 characters are .com
# if not, continue, if it is, stop
# return the doamin string


require pry

def domain_name(url)
  domain_string = ''
  slash_count = 0
  idx = 0
  binding.pry
  contain_http = url.include?('//')
  
  loop do 
    if slash_count < 2 && contain_http 
      if url[idx] == '/'
        slash_count += 1
      end
    else
      if url[idx, 4] == 'www.'
        idx += 4
        next
      else
        puts url[idx]
        domain_string << url[idx]
      end
    end
    
    break if url[idx + 1] == '.'    
        
    idx += 1
    break if idx == url.length
  end
  domain_string
end



p domain_name("www.xakep.ru")






# p domain_name("http://github.com/carbonfive/raygun") #== "github" 
# p domain_name("http://www.zombie-bites.com") == "zombie-bites"
# p domain_name("https://www.cnet.com") == "cnet"