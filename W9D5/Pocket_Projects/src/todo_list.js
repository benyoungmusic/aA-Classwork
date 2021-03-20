// const todos = localStorage.getItem(JSON.parse(todos));
const todos = [];
console.log(localStorage)
const ul = document.querySelector(".todos");
const form = document.querySelector(".add-todo-form");

const addTodo = () => {
    let input = document.getElementsByName("add-todo"); 
    let todo = {done: false, value: input[0].value};
    todos.push(todo);
    localStorage.clear();
    localStorage.setItem('todos', JSON.stringify(todos));
    input.value = "";
    populateList();
};

const populateList = () => {
    let children = ul.children;
    while (children.length > 0) {
        ul.removeChild(ul.firstChild)
    }
    todos.map(todo => {
        let label = document.createElement("label");
        let checkbox = document.createElement("input");
        let li = document.createElement("li");

        checkbox.type = "checkbox";
        checkbox.checked = todo.done;
        label.innerText = todo.value;

        li.appendChild(checkbox);
        li.appendChild(label);
        ul.appendChild(li);
    
    });
    console.log(todos)
};

form.addEventListener("submit", e => {

    e.preventDefault();
    console.log('hello');
    addTodo();
});
