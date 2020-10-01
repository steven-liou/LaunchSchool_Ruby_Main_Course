function stringToInteger(string) {
  number = 0;

  for (let index = 0, len = string.length; index < len; index++) {
    number = number * 10 + charToInteger(string[index]);
  }
  return number;
}

function charToInteger(char) {
  switch (char) {
    case "0":
      return 0;
    case "1":
      return 1;
    case "2":
      return 2;
    case "3":
      return 3;
    case "4":
      return 4;
    case "5":
      return 5;
    case "6":
      return 6;
    case "7":
      return 7;
    case "8":
      return 8;
    case "9":
      return 9;
    default:
      return;
  }
}

console.log(stringToInteger("4321"));
console.log(stringToInteger("570"));
