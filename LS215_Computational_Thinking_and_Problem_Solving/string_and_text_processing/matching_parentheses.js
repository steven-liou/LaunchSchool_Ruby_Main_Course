// instead of using the sign of the parensCount, which uses one less variable,
// I decided to use two variables, one for each parentheses type for readability

function isBalanced(string) {
  let startParen = 0;
  let endParen = 0;

  for (let index = 0; index < string.length; index++) {
    let char = string[index];
    switch (char) {
      case '(':
        startParen += 1;
        break;
      case ')':
        endParen += 1;
        break;
    }
    if (startParen < endParen) return false;
  }
  return startParen === endParen;
}

console.log(isBalanced('What (is) this?')); // true
console.log(isBalanced('What is) this?')); // false
console.log(isBalanced('What (is this?')); // false
console.log(isBalanced('((What) (is this))?')); // true
console.log(isBalanced('((What)) (is this))?')); // false
console.log(isBalanced('Hey!')); // true
console.log(isBalanced(')Hey!(')); // false
console.log(isBalanced('What ((is))) up(')); // false
