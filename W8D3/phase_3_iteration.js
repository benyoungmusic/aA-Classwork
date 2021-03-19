Array.prototype.bubbleSort = function() {
    let sortedArr = [...this];
    let flag = false;
    while (!flag) {
        flag = true
        sortedArr.forEach((ele, i) => {
            if (i < this.length - 1 && ele > sortedArr[i + 1]) {
                [sortedArr[i], sortedArr[i + 1]] = [sortedArr[i + 1], sortedArr[i]];
                flag = false
            }
        })
    }
    return sortedArr
}
//[a[3], a[4]] = [a[4], a[3]]

String.prototype.substrings = function() {
    let subs = []
    for(i = 0; i < this.length; i++) {
        for(j = i + 1; j <= this.length; j++){
            subs.push(this.slice(i, j));
        }
    }
    return subs
}