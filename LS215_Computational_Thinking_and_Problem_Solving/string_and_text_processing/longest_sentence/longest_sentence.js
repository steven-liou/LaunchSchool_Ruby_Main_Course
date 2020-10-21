/*
Input: paragraph of sentences
Output: longest sentence
Rules: 
  A sentence may end with .!? and always begin with a word character
  A word is any character that is not a space or .!?

Data Structure:
  

Algorithms:
  Split the paragraph into sentences by .!?
  iterate through each sentence, count the number of words in that sentence
    Split the sentence by white space into words
    Count the words
    Store the word count and the corresponding sentence into an object
  Find the longest sentence in the sentence array
  Output the longest sentence and its word counts

*/

let longText =
  'Four score and seven years ago our fathers brought forth' +
  ' on this continent a new nation, conceived in liberty, and' +
  ' dedicated to the proposition that all men are created' +
  ' equal.' +
  ' Now we are engaged in a great civil war, testing whether' +
  ' that nation, or any nation so conceived and so dedicated,' +
  ' can long endure. We are met on a great battlefield of that' +
  ' war. We have come to dedicate a portion of that field, as' +
  ' a final resting place for those who here gave their lives' +
  ' that that nation might live. It is altogether fitting and' +
  ' proper that we should do this.' +
  ' But, in a larger sense, we can not dedicate, we can not' +
  ' consecrate, we can not hallow this ground. The brave' +
  ' men, living and dead, who struggled here, have' +
  ' consecrated it, far above our poor power to add or' +
  ' detract. The world will little note, nor long remember' +
  ' what we say here, but it can never forget what they' +
  ' did here. It is for us the living, rather, to be dedicated' +
  ' here to the unfinished work which they who fought' +
  ' here have thus far so nobly advanced. It is rather for' +
  ' us to be here dedicated to the great task remaining' +
  ' before us -- that from these honored dead we take' +
  ' increased devotion to that cause for which they gave' +
  ' the last full measure of devotion -- that we here highly' +
  ' resolve that these dead shall not have died in vain' +
  ' -- that this nation, under God, shall have a new birth' +
  ' of freedom -- and that government of the people, by' +
  ' the people, for the people, shall not perish from the' +
  ' earth.';

function longestSentence(text) {
  let sentences = text.split(/(?<=[.!?]) /);
  let sentenceObjects = sentences.map(createSentenceObject);
  let longest = findLongestSentence(sentenceObjects);

  console.log(longest.sentence + '\n');
  console.log(`The longest sentence has ${longest.wordCount} words.`);
}

function createSentenceObject(sentence) {
  words = sentence.split(' ');
  object = {
    wordCount: words.length,
    sentence,
  };
  return object;
}

function findLongestSentence(sentenceObjects) {
  sentenceObjects.sort((obj1, obj2) => {
    if (obj1.wordCount > obj2.wordCount) {
      return -1;
    } else if (obj1.wordCount < obj2.wordCount) {
      return 1;
    } else {
      return 0;
    }
  });
  return sentenceObjects[0];
}

longestSentence(longText);
