function random(min, max) {
  if (min > max) [min, max] = [max, min];
  let randomNumber = Math.random() * (max - min + 1) + min;
  return Math.floor(randomNumber);
}

console.log(random(1, 2));
