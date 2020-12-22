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

  function findTodo(id) {
    return todos.filter((todo) => todo.id === id)[0];
  }

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

    delete(id) {
      let todo = id ? findTodo(id) : todos[todos.length - 1];
      let index = todos.indexOf(todo);
      return todos.splice(index, 1)[0];
    },

    get(id) {
      return Object.assign({}, findTodo(id));
    },

    update(id, data = {}) {
      let todo = findTodo(id);

      Object.getOwnPropertyNames(data).forEach((prop) => {
        if (todo.hasOwnProperty(prop)) {
          todo[prop] = data[prop];
        }
      });
      return true;
    },
  };
})();

let todoManager = {
  list: todoList,

  allTodos() {
    return this.list.todos();
  },

  allCompleted() {
    return this.list.filter((todo) => todo.completed);
  },
};

module.exports = {
  Todo,
  todoList,
  todoManager,
};
