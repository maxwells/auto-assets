(function() {
  var file_one;

  file_one = function() {
    return console.log('this is from file_one.coffee. This is the flag I\'ll look for!!!');
  };

  file_one();

}).call(this);
(function() {
  var file_two;

  file_two = function() {
    return console.log('this is from file_two.coffee');
  };

  file_two();

}).call(this);
console.log("js_one.js");
console.log("THIS IS MY TESTINGGGGG");
console.log('this is my final testing');




