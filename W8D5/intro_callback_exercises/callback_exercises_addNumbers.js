const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question('Input next number to add', (res) => {
            sum += parseInt(res);
            console.log(sum);
            addNumbers(sum, numsLeft - 1, completionCallback);
        })
    } else {
        completionCallback(sum);
        reader.close()
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// reader.question('Would you like some tea?', (res) => {
//     first = res;
//     console.log(`You replied ${res}.`);
// });

// def bubble_sort!(& prc)
//     # With a proc
// prc ||= Proc.new { | x, y | x <=> y }
// sorted = false
// until sorted
    // sorted = true
        // self.each_with_index do | el, i |
        //     next if i + 1 == self.length
        //         j = i + 1
            // if prc.call(self[i], self[j]) == 1
            //           sorted = false
            // self[i], self[j] = self[j], self[i]
            // end
        // end
    // end
// self
// end