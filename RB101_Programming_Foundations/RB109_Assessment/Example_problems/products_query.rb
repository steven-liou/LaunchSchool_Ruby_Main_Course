# implement the search method that takes a query hash and return an array of hash products that fall into the query criteria

# < a query hash
# > a array of hashes that contain the computers that include the name, and fall within the price range

# first grab the computers that include the name specified in the query key :q
# grab the computers that have prices within the price range

# select the hashes that have name key value contains the :q key value of computer name
# select from that returned array, the price key value that falls within the price_min and price_max range

PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 },
]

query1 = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  filtered_computers = []

  for computer in PRODUCTS
    if computer[:name].downcase.include?(query[:q])
      if computer[:price].between?(query[:price_min], query[:price_max])
        filtered_computers << computer
      end
    end
  end
  filtered_computers
end


p search(query1) #== [ {number: "Thinkpad x200", price: 250 } ]

p search(query2)
# [{ name: "Dell Inspiron", price: 300 },
#  { name: "Dell Inspiron", price: 450 }
# ]