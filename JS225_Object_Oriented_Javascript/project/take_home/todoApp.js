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
  return this.month === String(month) && this.year === String(year);
};

let todoList = (() => {
  let todos = [];

  return {
    init(todosData) {
      todos = []; // reset the todos array if init is called multiple times
      if (!Array.isArray(todosData)) {
        todosData = [todosData];
      }
      todosData.forEach((data) => todos.push(new Todo(data)));
      return this;
    },

    todos() {
      return todos.slice();
    },

    add(todo) {
      if (todo instanceof Todo) {
        todos.push(todo);
        return true;
      } else {
        return 'input must be instance of Todo';
      }
    },

    find(id) {
      return todos.filter((todo) => todo.id === id)[0];
    },

    delete(id) {
      let todo = id ? this.find(id) : todos[todos.length - 1];
      let index = todos.indexOf(todo);
      return todos.splice(index, 1)[0];
    },
  };
})();

let todoManager = {};

// Todo Constructor Tests
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
console.log(typeof todo.title === 'string');
console.log({}.hasOwnProperty.call(todo, 'title'));

// Todo item has month and year properties, and they are string
console.log({}.hasOwnProperty.call(todo, 'month'));
console.log(typeof todo.month === 'string');
console.log({}.hasOwnProperty.call(todo, 'year'));
console.log(typeof todo.year === 'string');

// Todo item month and year correspond to today's values if not specified
let todoDataCopy = Object.assign({}, todoData);
todoDataCopy.month = null;
todoDataCopy.year = null;
let todoCopy = new Todo(todoDataCopy);
let today = new Date();
console.log(todoCopy.month === String(today.getMonth() + 1));
console.log(todoCopy.year === String(today.getFullYear()));

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

// Todo has shared isWithinMonthYear method
console.log({}.hasOwnProperty.call(todo, 'isWithinMonthYear') === false);
console.log({}.hasOwnProperty.call(Todo.prototype, 'isWithinMonthYear') === true);

// isWithinMonthYear returns true or false a todo item is within the given month/year values
console.log(todo.isWithinMonthYear('12', '2020') === false);
console.log(todo.isWithinMonthYear('1', '2017') === true);
console.log(todo.isWithinMonthYear(1, 2017) === true);

// todoList Tests
let todoData1 = {
  title: 'Buy Milk',
  month: '1',
  year: '2017',
  description: 'Milk for baby',
};

let todoData2 = {
  title: 'Buy Apples',
  month: '',
  year: '2017',
  description: 'An apple a day keeps the doctor away',
};

let todoData3 = {
  title: 'Buy chocolate',
  month: '1',
  year: '',
  description: 'For the cheat day',
};

let todoData4 = {
  title: 'Buy Veggies',
  month: '',
  year: '',
  description: 'For the daily fiber needs',
};

let todoSet = [todoData1, todoData2, todoData3, todoData4];

// todoList initialization can either accept a single todo data object, or an array of todo data objects
console.log(todoList.init(todo).todos().length === 1);
console.log(todoList.init(todoSet).todos().length === 4);

// todoList maintains integrity of the collection
console.log(typeof todoList.todos === 'function');
let copyList = todoList.todos();
copyList.splice(0, 4);
console.log(copyList.length !== todoList.todos().length); // doesn't mutate the private todos array
console.log(todoList.todos().length === 4);

// todoList can add new todo, if input isn't a Todo instance, return message, else return true
console.log(todoList.add(todo) === true);
console.log(todoList.add(todoData) === 'input must be instance of Todo');
console.log(todoList.todos().length === 5);

// todoList can delete a todo from the list. If no id is given, then delete the last todo in the list, else, delete the specified todo. It returns the deleted todo
console.log(todoList.delete() === todo);
todoList.add(todo);
console.log(todoList.delete(0) === todo);
