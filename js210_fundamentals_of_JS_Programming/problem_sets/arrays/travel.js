function contains(city, destinations) {
  for (let index = 0; index < destinations.length; index += 1) {
    if (city === destinations[index]) return true;
  }
  return false;
}

let destinations = [
  'Prague',
  'London',
  'Sydney',
  'Belfast',
  'Rome',
  'Aruba',
  'Paris',
  'Bora Bora',
  'Barcelona',
  'Rio de Janeiro',
  'Marrakesh',
  'New York City',
];

console.log(contains('Barcelona', destinations)); // true
console.log(contains('Nashville', destinations)); // false
