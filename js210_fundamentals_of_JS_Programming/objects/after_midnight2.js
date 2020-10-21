const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;
const DATE_PART = '1/1/2020';

function afterMidnight(timeStr) {
  let midnight = new Date(DATE_PART + ' 00:00');
  let time = new Date(DATE_PART + ' ' + timeStr);
  let hours = time.getHours();
  let minutes = time.getMinutes();
  return minutes + MINUTES_PER_HOUR * hours;
}

function beforeMidnight(timeStr) {
  let deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    deltaMinutes = 0;
  }

  return deltaMinutes;
}

console.log(afterMidnight('00:00')); // 0
console.log(beforeMidnight('00:00')); // 0
console.log(afterMidnight('12:34')); // 754
console.log(beforeMidnight('12:34')); // 686
