function copyObj(object, keys) {
  let copyObject = {};
  if (keys) {
    keys.forEach((key) => (copyObject[key] = object[key]));
    return copyObject;
  } else {
    return Object.assign({}, object);
  }
}
let objToCopy = {
  foo: 1,
  bar: 2,
};

let newObj = copyObj(objToCopy);
console.log(newObj.foo);
console.log(newObj.bar);

let newObj2 = copyObj(objToCopy, ['foo']);
console.log(newObj2.foo);
console.log(newObj2.bar);
