let object = {
  foo: 'foo',
  bar: 'bar',
  qux: 42,
};

let { foo, bar, qux } = object;

function xyzzy({ foo, bar, qux }) {
  console.log(foo);
  console.log(bar);
  console.log(qux);
}

xyzzy(object);
