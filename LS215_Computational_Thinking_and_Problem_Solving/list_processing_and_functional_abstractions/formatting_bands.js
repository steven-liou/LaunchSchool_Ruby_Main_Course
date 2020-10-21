function processBands(data) {
  return data.map((band) => {
    let bandName = removeDotInString(band.name);
    bandName = capitalizeWords(bandName);
    return {
      name: bandName,
      country: 'Canada',
      active: band.active,
    };
  });
}

function capitalizeWords(string) {
  return string
    .split(' ')
    .map((word) => capitalize(word))
    .join(' ');
}

function capitalize(word) {
  return word[0].toUpperCase() + word.slice(1);
}

function removeDotInString(word) {
  return word.replace(/[.]/g, '');
}

let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

console.log(processBands(bands));

// should return:
[
  { name: 'Sunset Rubdown', country: 'Canada', active: false },
  { name: 'Women', country: 'Canada', active: false },
  { name: 'A Silver Mt Zion', country: 'Canada', active: true },
];
