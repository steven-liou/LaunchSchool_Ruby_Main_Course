function incrementProperty(obj, propertyName) {
  obj[propertyName] ? (obj[propertyName] += 1) : (obj[propertyName] = 1);
}

let wins = {
  steve: 3,
  susie: 4,
};

incrementProperty(wins, 'susie');
console.log(wins);
incrementProperty(wins, 'lucy');
console.log(wins);
