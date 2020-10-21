let myProtoObj = {
  foo: 1,
  bar: 2,
};

myObj = Object.create(myProtoObj);

myObj['qux'] = 3;

Object.keys(myObj).forEach(function (key) {
  console.log(key);
});

for (let key in myObj) {
  if (myObj.hasOwnProperty(key)) {
    console.log(key);
  }
}
