function run() {
  go();
  return function go() {
    console.log('Go was called');
  };
}

run();
