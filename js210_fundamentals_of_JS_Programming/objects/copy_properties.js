function copyProperties(source, destination) {
  let count = 0;
  for (prop in source) {
    if (!destination[prop]) count += 1;
    destination[prop] = source[prop];
  }

  return count;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
console.log(copyProperties(hal, sal));
console.log(sal);
