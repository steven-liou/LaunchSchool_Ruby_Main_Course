function allMatches(words) {
  return words.filter((word) => /lab/.test(word));
}

let words = ['laboratory', 'experiment', 'flab', 'Pans Labyrinth', 'elaborate', 'polar bear'];

console.log(allMatches(words, /lab/)); // ['laboratory', 'flab', 'elaborate']
