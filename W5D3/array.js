
//
// const x = function () {
//
// }
//
// const x = () => {
//
// }

Array.prototype.uniq = function() {
  let result = [];
  this.forEach(el => {
    if (!result.includes(el)) {
      result.push(el);
    }
  });
  return result;
}

// console.log([1,2,2,3].uniq());


Array.prototype.twoSum = function() {
  let answer = [];

  for(i=0; i < this.length - 1; i++) {
    for(j= i+1; j < this.length; j++) {
      if(this[i] + this[j] === 0) {
        answer.push([i,j]);
      }
    }
  }
  return answer;
}

// console.log([-1, 0, 2, -2, 1].twoSum());

Array.prototype.myTranspose = function() {
  let answer = new Array(this[0].length);
  for (i = 0; i < answer.length; i++ ) {
    answer[i] = new Array(this.length);
  }

  for (i = 0; i < this.length; i++ ) {
    for(j= 0; j < answer.length; j++) {
      answer[i][j] = this[j][i];
    }
  }
  return answer;
}

rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ];

  // console.log(rows.myTranspose());

Array.prototype.myEach = function(code) {
  for(i=0; i < this.length; i++) {
    code(this[i]);
  }
}

// console.log([1,2,3].myEach(el => console.log(el*2)));


Array.prototype.myMap = function(callback) {
  var result = [];
  function x (el) {
    result.push(callback(el))
  }
  this.myEach(x);
  return result
}

// console.log([1,2,3].myMap(el => el*2));


Array.prototype.myInject = function(callback) {
  var first = this[0];

  this.slice(1, this.length).myEach(el => first = callback(first,el));

  return first;

}

// console.log([1,2,3].myInject((acc,val) => acc + val));

// function(acc, val) {
//   return acc + val;})

Array.prototype.bubbleSnort = function() {
  var unsorted = true;

  while (unsorted) {
    unsorted = false;
    for(i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        unsorted = true;
        temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
      }
    }
  }
  return this
}

// console.log([2,3,1,4,5].bubbleSnort())



String.prototype.subStrings = function() {
  let substrings = [];

  for(i=0; i < this.length; i ++ ) {
    for ( j = i; j < this.length; j ++ ) {
      substrings.push(this.slice(i,j+1))
    }
  }
  return substrings;
}
//c = new String("cat")
//console.log("cat".subStrings());

function exp(base, n) {
  if (n === 0) {
    return 1;
  }
  else{
    return base * exp(base, n - 1);
  }
}

// console.log(exp(2,3));
// console.log(exp(3,4));

function exp2(base, n) {
  if (n === 0) {
    return 1;
  }
  else if (n === 1){
    return base;
  }
  else if (n%2 === 0) {
    let num = exp2(base, n / 2);
    return num * num;
  }
  else{
    let num = exp2(base, (n - 1) / 2);
    return base * num * num;
  }
}

// console.log(exp(2,3));
// console.log(exp(3,4));


function fibonacci(num) {
  if(num === 1){
    return [1];
  }
  else if (num === 2) {
   return [1,1];
 }

  let fibArray = fibonacci(num - 1);
  fibArray.push(fibArray[fibArray.length - 1] + fibArray[fibArray.length-2]);
  return fibArray;
}

// console.log(fibonacci(7));


function bsearch(array, target) {

  let midI = Math.floor(array.length/2);

  if(target === array[midI]){
    return midI;
  }
  else if (array.length === 1){
    return null;
  }
  else if(target < array[midI]) {
    return bsearch(array.slice(0,midI), target);
  }
  else{
    return bsearch(array.slice(midI + 1, array.length), target) + midI + 1;
  }
}
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6));
// if(target > array[midI])


function change(goal, coins) {
  if (goal === coins[0]) {
    return [goal];
  }
  else if (goal > coins[0]) {
    let newGoal = goal - coins[0];
    return [coins[0]].concat(change(newGoal, coins));
  } else {
  return change(goal, coins.slice(1,coins.length));
  }
}

function makeChange(goal, coins){
  if (coins.length === 1) {
    return change(goal,coins);
  }
  else if(change(goal,coins).length < change(goal,coins.slice(1,coins.length)).length) {
    return change(goal, coins);
  } else {
    return makeChange(goal, coins.slice(1,coins.length));
  }
}


console.log(makeChange(14,[10,7,1]));
