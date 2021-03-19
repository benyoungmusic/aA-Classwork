Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

Array.prototype.myMap = function(callback) {
  let newArr = [];
  this.myEach(ele => {
    newArr.push(callback(ele));
  })
  return newArr;
}

Array.prototype.myReduce = function(callback, initialValue) {
  let newArr = [...this];
  initialValue = initialValue || newArr.shift();
  
  newArr.myEach(ele => {
    initialValue = callback(initialValue, ele);
  })
return initialValue;

}
