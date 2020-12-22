let Todo = (() => {
  let todoID = 0;

  return function (data) {
    let today = new Date();
    this.title = data.title;
    this.month = data.month || String(today.getMonth() + 1);
    this.year = data.year || String(today.getFullYear());
    this.description = data.description;
    this.completed = false;
    this.id = todoID;
    todoID += 1;
  };
})();

Todo.prototype.isWithinMonthYear = function (month, year) {
  return this.month === month && this.year === year;
};

let todoData = {
  title: 'Buy Milk',
  month: '1',
  year: '2017',
  description: 'Milk for baby',
};

let todo = new Todo(todoData);
// Check if the object is a Todo item
console.log(todo instanceof Todo);

// Todo item has title, property, and it is a string
console.log({}.hasOwnProperty.call(todo, 'title'));
console.log(typeof todo.title === 'string');

// Todo item has month and year properties, and they are string
console.log({}.hasOwnProperty.call(todo, 'month'));
console.log(typeof todo.month === 'string');
console.log({}.hasOwnProperty.call(todo, 'year'));
console.log(typeof todo.year === 'string');

// Todo item has description property, and it is a string
console.log({}.hasOwnProperty.call(todo, 'description'));
console.log(typeof todo.description === 'string');

// Todo item has id, and it is a number
console.log({}.hasOwnProperty.call(todo, 'id'));
console.log(typeof todo.id === 'number');

// Todo item has completed property, and it is a boolean
console.log({}.hasOwnProperty.call(todo, 'completed'));
console.log(typeof todo.completed === 'boolean');

// Todo items have unique id
let todo2 = new Todo(todoData);
let todo3 = new Todo(todoData);
console.log(todo.id !== todo2.id && todo2.id !== todo3.id);
