function isItemAvailable(inventoryItem, transactions) {
  let total = transactionsFor(inventoryItem, transactions).reduce((total, {movement, quantity}) => {
    return movement === 'in' ? total += quantity : total -= quantity;
    // return total;
  }, 0)
  return total > 0;
}

function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(({id}) => id === inventoryItem);
}


const transactions = [{id: 101, movement: 'in', quantity: 5},
{id: 105, movement: 'in', quantity: 10},
{id: 102, movement: 'out', quantity: 17},
{id: 101, movement: 'in', quantity: 12},
{id: 103, movement: 'out', quantity: 15},
{id: 102, movement: 'out', quantity: 15},
{id: 105, movement: 'in', quantity: 25},
{id: 101, movement: 'out', quantity: 18},
{id: 102, movement: 'in', quantity: 22},
{id: 103, movement: 'out', quantity: 15},];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true
