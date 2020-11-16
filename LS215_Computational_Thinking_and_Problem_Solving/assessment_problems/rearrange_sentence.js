/*
Given a sentence with numbers representing a word's location embedded within each word, return the sorted sentence.
Only the integers 1-9 will be used.
*/

rearrange('is2 Thi1s T4est 3a') == 'This is a Test';

rearrange('4of Fo1r pe6ople g3ood th5e the2') == 'For the good of the people';

rearrange(' ') == '';
