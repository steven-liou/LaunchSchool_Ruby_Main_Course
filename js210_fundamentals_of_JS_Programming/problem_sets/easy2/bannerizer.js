/*
Input: a string to be printed in the banner format
Output:  the banner pattern
Rules: 
  The top and bottom row start and end with + sign, plus a N + 2 number of - signs  
  THe top and bottom padding start and and with the pipe |, plus N + 2 number of spaces
  The tex row start and end with a space, with text in between

Data Structure:
  

Algorithms:

  

*/

function logInBox(text, width) {
  let textLength = width - 4 > 0 || text.length;
  let banner = '+' + '-'.repeat(textLength + 2) + '+';
  let padding = '|' + ' '.repeat(textLength + 2) + '|';
  let textLines = toMultiLine(text, textLength);

  console.log(banner);
  console.log(padding);

  for (let index = 0; index < textLines.length; index++) {
    let line = textLines[index];
    console.log('| ' + line + ' |');
  }
  console.log(padding);
  console.log(banner);
}

function toMultiLine(string, width) {
  let strings = [];
  let tempString;

  for (let index = 0; index < string.length; index++) {
    if (index % width == 0 && index > 0) strings.push(tempString);
    if (index % width == 0) tempString = '';
    tempString += string[index];
  }
  if (tempString) {
    tempString += ' '.repeat(width - tempString.length);
    strings.push(tempString);
  }
  return strings;
}

logInBox('To boldly go where no one has gone before. What is going oing a laksjdf lkajsdf lkasd flkasd kf', 5);
