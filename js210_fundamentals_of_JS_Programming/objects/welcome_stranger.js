function greetings(nameParts, jobParts) {
  let nameGreet = `Hello, ${nameParts.join(' ')}!`;
  let jobGreet = `Nice to have a ${jobParts.title} ${jobParts.occupation} around.`;
  console.log(nameGreet + jobGreet);
}
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
