let me = {
  firstName: 'Jane',
  lastName: 'Doe',
};

let you = {};
you.firstName = 'Steve';
you.lastName = 'Doe';

function fullName(person) {
  console.log(person.firstName + ' ' + person.lastName);
}

let friend = {
  firstName: 'John',
  lastName: 'Smith',
};

let mother = {
  firstName: 'Amber',
  lastName: 'Doe',
};

let father = {
  firstName: 'Shane',
  lastName: 'Doe',
};

let people = {
  personIndex: 0,
  collection: [],
  fullName: function (person) {
    console.log(person.firstName + ' ' + person.lastName);
  },
  add(person) {
    if (this.isInvalidPerson(person)) return;
    person.Index = this.personIndex;
    this.collection.push(person);
    this.personIndex += 1;
  },
  getIndex(person) {
    let index = -1;
    this.collection.forEach(function (comparator, i) {
      if (this.samePerson(person, comparator)) {
        index = i;
      }
    });
    return index;
  },
  samePerson(person1, person2) {
    return (
      person1.firstName === person2.firstName &&
      person1.lastName === person2.lastName &&
      person1.index === person2.index
    );
  },
  remove(person) {
    if (this.isInvalidPerson(person)) return;

    let index = this.getIndex(person);
    if (index === -1) return;
    this.collection.splice(index, 1);
  },
  isInvalidPerson(person) {
    return typeof person.firstName !== 'string' && typeof person.lastName !== 'string';
  },
  rollCall() {
    this.collection.forEach(this.fullName);
  },
  get(person) {
    if (this.isInvalidPerson(person)) return;
    return this.collection[this.getIndex(person)];
  },
  update(person) {
    if (this.isInvalidPerson(person)) return;
    let existingPersonId = this.getIndex(person);
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  },
};
people.add(me);
people.add(you);
people.add(father);
people.add(mother);
people.add(friend);
people.rollCall();
console.log(people);
