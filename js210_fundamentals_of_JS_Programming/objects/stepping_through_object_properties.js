let products = {
  widget: 400,
  gear: 80,
  crank: 375,
  lever: 670,
};

let otherProducts = Object.create(products);
otherProducts['wheel'] = 210;

let otherProductKeys = Object.keys(otherProducts);
console.log('OtherProudctKeys:', otherProductKeys);

for (let i = 0; i < otherProductKeys.length; i += 1) {
  let key = otherProductKeys[i];
  console.log(key, ':', otherProducts[key]);
}

for (let product in otherProducts) {
  console.log(product, ':', otherProducts[product]);
}

for (let product in otherProducts) {
  if (otherProducts.hasOwnProperty(product)) {
    console.log(product, ':', otherProducts[product]);
  }
}
