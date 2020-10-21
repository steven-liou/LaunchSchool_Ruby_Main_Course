function buyFruit(fruits) {
  return fruits.reduce((basket, [fruit, count]) => {
    return basket.concat(Array(count).fill(fruit));
  }, [])
}
console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
