function substr(string, start, length) {
  if (start < 0) start = string.length - 3;

  let substring = "";

  for (let index = start; index < start + length; index++) {
    if (index > string.length - 1) break;
    substring += string[index];
  }

  return substring;
}

let string = "hello world";
console.log(substr(string, 2, 4)); // "llo "
console.log(substr(string, -3, 2)); // "rl"
console.log(substr(string, 8, 20)); // "rld"
console.log(substr(string, 0, -20)); // ""
console.log(substr(string, 0, 0)); // ""
