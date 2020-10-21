function dateSuffix(date) {
  let suffix = 'th';
  switch (date) {
    case 1:
    case 21:
      suffix = 'st';
      break;
    case 2:
    case 22:
      suffix = 'nd';
      break;
    case 3:
    case 23:
      suffix = 'rd';
      break;
    default:
      break;
  }
  return String(date) + suffix;
}

function formattedMonth(dateObj) {
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[dateObj.getMonth()];
}

function formattedDay(dateObj) {
  const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[dateObj.getDay()];
}

function formattedDate(dateObj) {
  let month = formattedMonth(dateObj);
  let day = formattedDay(dateObj);
  let date = dateSuffix(dateObj.getDate());

  console.log(`Today's date is ${day}, ${month} the ${date}`);
}

function formatTime(dateObj) {
  let hour = dateObj.getHours();
  let minute = dateObj.getMinutes();

  return padzero(hour) + ':' + padzero(minute);
}
function padzero(number) {
  let numberString = String(number);

  if (numberString.length === 1) {
    numberSTring = '0' + numberString;
  }
  return numberString;
}

let today = new Date();
formattedDate(today);

let tomorrow = new Date(today.getTime());
tomorrow.setDate(today.getDate() + 1);
formattedDate(tomorrow);

let nextWeek = new Date(today.getTime());
console.log(today.toDateString() === nextWeek.toDateString());
nextWeek.setDate(today.getDate() + 7);
console.log(today.toDateString() === nextWeek.toDateString());
formattedDate(nextWeek);

console.log(formatTime(today));
