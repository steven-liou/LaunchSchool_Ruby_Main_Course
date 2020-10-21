function invoiceTotal(...amounts) {
  let total = 0;

  for (let index = 0; index < amounts.length; index++) {
    total += amounts[index];
  }
  return total;
}

console.log(invoiceTotal(20, 30, 40, 50)); // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40)); // does not work; how can you make it work?
