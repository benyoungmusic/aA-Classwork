Array.prototype.uniq = function() {
  let newArr = [];
  this.forEach(ele => {
    if (!newArr.includes(ele)) {
    newArr.push(ele);
    }
  })
  return newArr;
}

Array.prototype.twoSum = function() {
  let newArr = [];
  this.forEach((ele1, i1) => {
    this.forEach((ele2, i2) => {
      if (i2 > i1 && ele1 + ele2 === 0) {
        newArr.push([i1, i2]);
      }
    })
  })
  return newArr;
}

Array.prototype.transpose = function() {
  length = this[0].length
  let newArr = [];
  for (let i = 0; i < length; i++) {
    newArr.push([])
  }
  this.forEach((sub, i) => {
    sub.forEach((ele, j) => {
      newArr[j].push(ele);
    })
  })
  return newArr;
}
//nested loop to go thru all possible pairs
//search array for an opposite value

//[0, 1, 2]
//[0, 1, 2]
//[0, 1, 2]
//[0, 1, 2]


//[0,0,0,0]
//[1,1,1,1]
//[2,2,2,2]

// var times = 10;
// for (var i = 0; i < times; i++) {
//   doSomething();
// }
