const { Todo, todoList, todoManager } = require('./todoApp');

// Todo Constructor Tests
let todoData = {
  title: 'Buy Milk',
  month: 1,
  year: 2017,
  description: 'Milk for baby',
};

// Check Todo creates instances of itself
let todo = new Todo(todoData);
console.log(todo instanceof Todo);

// Todo item has only id, title, completed, month, year, description properties, and shared method isWithinMonthYear
let validTodoProperties = ['id', 'title', 'completed', 'month', 'year', 'description'];
let hasValidTodoProperties = validTodoProperties.every((prop) => {
  return {}.hasOwnProperty.call(todo, prop);
});
console.log(hasValidTodoProperties);

let hasOnlyValidTodoProperties = Object.getOwnPropertyNames(todo).every((prop) => {
  return validTodoProperties.includes(prop);
});
console.log(hasOnlyValidTodoProperties);

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

// Todo item id cannot be directly modified
todo.id = Infinity;
console.log(todo.id === 0);

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

// todoList Tests
let todoData1 = {
  title: 'Buy Milk',
  month: '1',
  year: '2017',
  description: 'Milk for baby',
};

let todoData2 = {
  title: 'Buy Apples',
  month: '2',
  year: '2017',
  description: 'An apple a day keeps the doctor away',
};

let todoData3 = {
  title: 'Buy chocolate',
  month: '1',
  year: '2017',
  description: 'For the cheat day',
};

let todoData4 = {
  title: 'Buy Veggies',
  month: '1',
  year: '2017',
  description: 'For the daily fiber needs',
};

let todoSet = [todoData1, todoData2, todoData3, todoData4];

// todoList only has 'add', 'delete', 'init', 'update', and 'get', and 'todos' method properties
let validTodoListMethods = ['init', 'add', 'delete', 'get', 'update', 'todos'];
let hasValidTodoListMethods = validTodoListMethods.every((method) => {
  return {}.hasOwnProperty.call(todoList, method);
});
console.log(hasValidTodoListMethods);

let onlyValidTodoListMethods = Object.getOwnPropertyNames(todoList).every((prop) => {
  return validTodoListMethods.includes(prop);
});
console.log(onlyValidTodoListMethods);

// todoList initialization can either accept a single todo data object, or an array of todo data objects. If init is called again, it resets the private todos array
todoList.init(todo);
console.log(todoList.todos().length === 1);
todoList.init(todoSet);
console.log(todoList.todos().length === 4);

// todoList maintains integrity of the collection
console.log(typeof todoList.todos === 'function'); // cannot directly access the private todos array
// todoList can return all copies of todos in the private todo array. The returned todos are copies, so they must be different objects
console.log(todoList.todos().length === 4);
let firstCopies = todoList.todos();
let secondCopies = todoList.todos();
let notSameCopies = firstCopies.every((_, index) => {
  return firstCopies[index] !== secondCopies[index];
});
console.log(notSameCopies);

// returned copies are instances of Todo, and they have access to shared method
let copyList = todoList.todos();
let copyTodo = copyList[0];
console.log(copyTodo instanceof Todo);
console.log(typeof copyTodo.isWithinMonthYear === 'function'); // the copy has access to the shared method
copyTodo.title = 'Buy Burgers';
console.log(todoList.todos()[0].title !== copyTodo.title); // each returned todo in the private todos array is a copy
copyList.splice(0, 4);
console.log(copyList.length !== todoList.todos().length); // returns a copy of the private todos array
console.log(todoList.todos().length === 4);

// todoList can add new todo. If input isn't a Todo instance, return message, else return true
console.log(todoList.add(todo) === true);
console.log(todoList.add(todoData) === 'input must be instance of Todo');
console.log(todoList.add() === 'input must be instance of Todo');
console.log(todoList.todos().length === 5); // only added one new todo to the private list from above tests

// todoList can delete a todo from the list. If no id is given, or invalid id, an error message is returned
console.log(todoList.delete() === 'todo not found');
console.log(todoList.delete(Infinity) === 'todo not found');
console.log(todoList.todos().length === 5);
console.log(todoList.delete(0) === todo);
console.log(todoList.todos().length === 4);

// todoList returns a copy of the specific todo object based on its id property
let todoGet = todoList.get(8);
console.log(todoGet.title === 'Buy Veggies');
todoGet.title = 'Buy Burgers';
console.log(todoList.get(8).title === 'Buy Veggies'); // original todo is not mutated
console.log(todoList.get() === 'todo not found'); // return error message if no id is given
console.log(todoList.get(Infinity) === 'todo not found'); // returns error message if invalid id

// todoList can update a specific todo based on id, return true if successful. If any property is not in the todo, ignore the property
console.log(todoList.get(8).title === 'Buy Veggies');
console.log(todoList.get(8).description === 'For the daily fiber needs');
console.log(todoList.update(8, { title: 'Buy Fries', description: 'For the kids', event: 'Play games' })); // if successfully updated, returns true
console.log(todoList.get(8).title === 'Buy Fries'); // updated existing property
console.log(todoList.get(8).description === 'For the kids'); // updated existing property
console.log({}.hasOwnProperty(todoList.get(8), 'event') === false); // Do not update non-existing properties
// if id is not given, or invalid id, returns error message
console.log(todoList.update() === 'todo not found');
console.log(todoList.update(Infinity) === 'todo not found');

// todoManager Tests
// todoManager can return all todos by interfacing with todoList
let allTodos = todoManager.all();
console.log(allTodos.length == todoList.todos().length);

// todoManager can return only completed todos in todoList
let completed = todoManager.completed();
let onlyCompleted = completed.every((todo) => todo.completed); // checks only completed todos are returned
console.log(onlyCompleted);
// check if every returned item is an instance of Todo
let completedAreTodos = completed.every((todo) => {
  return todo instanceof Todo;
});
console.log(completedAreTodos);

// todoManager can return all todos in a given month/year combination in todoList
let onTrack = todoManager.onTrack(1, 2017);
let onlyOnTrack = onTrack.every((todo) => todo.isWithinMonthYear(1, 2017));
console.log(onlyOnTrack);
// check if every returned item is an instance of Todo
let onTrackAreTodos = completed.every((todo) => {
  return todo instanceof Todo;
});
console.log(onTrackAreTodos);

// todoManager can return all completed todos in a given month/year combination in todoList
todoList.update(5, { completed: true });
let onTime = todoManager.onTime(1, 2017);
let onlyOnTime = onTime.every((todo) => todo.completed && todo.isWithinMonthYear(1, 2017));
console.log(onlyOnTime);
// check if every returned item is an instance of Todo
let onTimeAreTodos = completed.every((todo) => {
  return todo instanceof Todo;
});
console.log(onTimeAreTodos);
