function greetings(array, object) {
  let fullName = array.join(' ');
  let job = object.title + ' ' + object.occupation;
  console.log(`Hello, ${fullName}! Nice to have a ${job} around.`);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });
