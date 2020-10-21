function getDayOfWeek(date) {
  let daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  return daysOfWeek[date.getDay()];
}

let date = new Date('October 06, 2020');
console.log(getDayOfWeek(date));
console.log(date.toLocaleDateString({ day: 'string' }));
