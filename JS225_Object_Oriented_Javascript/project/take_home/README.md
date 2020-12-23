# Assumptions

- `Todo` constructor
  - if either month or year is not provided, the current month, year of today is used
  - Instances of `Todo` have unique `id` that increment from 0, and is not writable.
  - Assumes that the data inputs for `title`, `description` are strings
  - Assumes that the data inputs for `month` and `year` are either strings or numbers


- `todoList`
  - If no id is given, or invalid id, then `delete` returns an error message
  - If no id is given, or invalid id, then `add` returns an error message
  - If no id is given, or invalid id, then `get` returns an error message
  - If no id is given, or invalid id, then `update` returns an error message
  - Additional method that returns a copy of the private `todos` array, with copies of each `todo` in the private array 
 
