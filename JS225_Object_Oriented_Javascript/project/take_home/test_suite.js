const { Todo, todoList, todoManager } = require('./todoApp');

// Todo Constructor Tests
let todoData = {
  title: 'Buy Milk',
  month: 1,
  year: 2017,
  description: 'Milk for baby',
};

let todo = new Todo(todoData);
// Check if the object is a Todo item
console.log(todo instanceof Todo);

// Todo item has only id, title, completed, month, year, description properties, and shared method isWithinMonthYear
let validProperties = ['id', 'title', 'completed', 'month', 'year', 'description'];
let hasAllValidProperties = validProperties.every((prop) => {
  return {}.hasOwnProperty.call(todo, prop);
});
console.log(hasAllValidProperties);

let hasOnlyValidProperties = Object.getOwnPropertyNames(todo).every((prop) => {
  return validProperties.includes(prop);
});

console.log(hasOnlyValidProperties);

// Todo item title, month, year, description properties are strings
let stringProperties = ['title', 'month', 'year', 'description'].every((prop) => {
  return typeof todo[prop] === 'string';
});
console.log(stringProperties);

// Todo item month and year correspond to today's values if not specified
let todoDataCopy = Object.assign({}, todoData);
todoDataCopy.month = null;
todoDataCopy.year = '';
let todoCopy = new Todo(todoDataCopy);
let today = new Date();
console.log(todoCopy.month === String(today.getMonth() + 1));
console.log(todoCopy.year === String(today.getFullYear()));

// Todo item id is a number
console.log(typeof todo.id === 'number');

// Todo items have unique id
let todo2 = new Todo(todoData);
let todo3 = new Todo(todoData);
console.log(todo.id !== todo2.id && todo2.id !== todo3.id);

// Todo item completed property is a boolean. It defaults to false
console.log(typeof todo.completed === 'boolean');
console.log(todo.completed === false);

// Todo has shared isWithinMonthYear method
console.log({}.hasOwnProperty.call(todo, 'isWithinMonthYear') === false);
console.log({}.hasOwnProperty.call(Todo.prototype, 'isWithinMonthYear') === true);

// isWithinMonthYear returns whether a todo item is within the given month/year values
console.log(todo.isWithinMonthYear('1', '2018') === false);
console.log(todo.isWithinMonthYear('2', '2017') === false);
console.log(todo.isWithinMonthYear('1', '2017') === true);
console.log(todo.isWithinMonthYear(1, 2017) === true); // allows for Number month/year

// // todoList Tests
// let todoData1 = {
//   title: 'Buy Milk',
//   month: '1',
//   year: '2017',
//   description: 'Milk for baby',
// };

// let todoData2 = {
//   title: 'Buy Apples',
//   month: '2',
//   year: '2017',
//   description: 'An apple a day keeps the doctor away',
// };

// let todoData3 = {
//   title: 'Buy chocolate',
//   month: '1',
//   year: '2017',
//   description: 'For the cheat day',
// };

// let todoData4 = {
//   title: 'Buy Veggies',
//   month: '1',
//   year: '2017',
//   description: 'For the daily fiber needs',
// };

// let todoSet = [todoData1, todoData2, todoData3, todoData4];

// // todoList initialization can either accept a single todo data object, or an array of todo data objects. If init is called again, it resets the private todos array
// console.log(todoList.init(todo).todos().length === 1);
// console.log(todoList.init(todoSet).todos().length === 4);

// // todoList maintains integrity of the collection
// console.log(typeof todoList.todos === 'function');
// let copyList = todoList.todos();
// copyList.splice(0, 4);
// console.log(copyList.length !== todoList.todos().length); // doesn't mutate the private todos array
// console.log(todoList.todos().length === 4);

// // todoList can add new todo, if input isn't a Todo instance, return message, else return true
// console.log(todoList.add(todo) === true);
// console.log(todoList.add(todoData) === 'input must be instance of Todo');
// console.log(todoList.todos().length === 5);

// // todoList can delete a todo from the list. If no id is given, then delete the last todo in the list, else, delete the specified todo. It returns the deleted todo
// console.log(todoList.delete() === todo);
// todoList.add(todo);
// console.log(todoList.delete(0) === todo);
// console.log(todoList.todos().length === 4);

// // todoList returns a copy of the specific todo object based on its id property
// let todoGet = todoList.get(8);
// console.log(todoGet.title === 'Buy Veggies');
// todoGet.title = 'Buy Burgers';
// console.log(todoList.get(8).title === 'Buy Veggies'); // original todo is not mutated
// console.log(Object.getOwnPropertyNames(todoList.get(Infinity)).length === 0); // returns an empty object no todo itms match the given id

// // todoList can update a specific todo based on id, return true if successful. If any property is not in the todo, ignore the property
// console.log(todoList.get(8).title === 'Buy Veggies');
// console.log(todoList.get(8).description === 'For the daily fiber needs');
// console.log(todoList.update(8, { title: 'Buy Fries', description: 'For the kids', event: 'Play games' }));
// console.log(todoList.get(8).title === 'Buy Fries');
// console.log(todoList.get(8).description === 'For the kids');
// console.log(todoList.get(8).event === undefined); // Do not update non-existing properties

// // todoManager Tests
// // todoManager can return all todos by interfacing with todoList
// let todos = todoManager.all();
// let matchAllTodos = todos.every((todo) => todoList.todos().includes(todo));
// console.log(matchAllTodos);

// // todoManager can return only completed todos in todoList
// let completed = todoManager.completed();
// let onlyCompleted = completed.every((todo) => todo.completed);
// console.log(onlyCompleted);

// // todoManager can return all todos in a given month/year combination in todoList
// let onTrack = todoManager.onTrack(1, 2017);
// let onlyOnTrack = onTrack.every((todo) => todo.isWithinMonthYear(1, 2017));
// console.log(onlyOnTrack);

// // todoManager can return all completed todos in a given month/year combination in todoList
// todoList.update(5, { completed: true });
// let onTime = todoManager.onTime(1, 2017);
// let onlyOnTime = onTime.every((todo) => todo.completed && todo.isWithinMonthYear(1, 2017));
// console.log(onlyOnTime);
