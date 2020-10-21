const DEGREE = '\xB0';
const DEGREE_TO_MINUTE = 60;
const MINUTE_TO_SECOND = 60;

function dms(angle) {
  angle %= 360;
  if (angle < 0) angle = 360 + angle;

  let degrees = Math.floor(angle);
  let minutes = (angle % 1) * DEGREE_TO_MINUTE;
  let seconds = (minutes % 1) * MINUTE_TO_SECOND;
  minutes = Math.round(minutes);
  seconds = Math.round(seconds);
  return `${degrees}${DEGREE}${padZeros(minutes)}'${padZeros(seconds)}"`;
}
function padZeros(number) {
  const numString = String(number);
  return numString.length < 2 ? `0${numString}` : numString;
}

console.log(dms(30)); // 30°00'00"
console.log(dms(76.73)); // 76°43'48"
console.log(dms(254.6)); // 254°35'59"
console.log(dms(93.034773)); // 93°02'05"
console.log(dms(0)); // 0°00'00"
console.log(dms(360)); // 360°00'00" or 0°00'00"

console.log(dms(-1)); // 359°00'00"
console.log(dms(400)); // 40°00'00"
console.log(dms(-40)); // 320°00'00"
console.log(dms(-420)); // 300°00'00"
