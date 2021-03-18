/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/Tic_Tac_Toe_Node/board.js":
/*!***************************************!*\
  !*** ./src/Tic_Tac_Toe_Node/board.js ***!
  \***************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MoveError = __webpack_require__(/*! ./moveError */ \"./src/Tic_Tac_Toe_Node/moveError.js\");\n\nclass Board {\n  constructor() {\n    this.grid = Board.makeGrid();\n  }\n\n  isEmptyPos(pos) {\n    if (!Board.isValidPos(pos)) {\n      throw new MoveError('Is not valid position!');\n    }\n\n    return (this.grid[pos[0]][pos[1]] === null);\n  }\n\n  isOver() {\n    if (this.winner() != null) {\n      return true;\n    }\n\n    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {\n      for (let colIdx = 0; colIdx < 3; colIdx++) {\n        if (this.isEmptyPos([rowIdx, colIdx])) {\n          return false;\n        }\n      }\n    }\n\n    return true;\n  }\n\n  placeMark(pos, mark) {\n    if (!this.isEmptyPos(pos)) {\n      throw new MoveError('Is not an empty position!');\n    }\n\n    this.grid[pos[0]][pos[1]] = mark;\n  }\n\n  print() {\n    const strs = [];\n    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {\n      const marks = [];\n      for (let colIdx = 0; colIdx < 3; colIdx++) {\n        marks.push(\n          this.grid[rowIdx][colIdx] ? this.grid[rowIdx][colIdx] : \" \"\n        );\n      }\n      strs.push(`${marks.join('|')}\\n`);\n    }\n\n    console.log(strs.join('-----\\n'));\n  }\n\n  winner() {\n    const posSeqs = [\n      // horizontals\n      [[0, 0], [0, 1], [0, 2]],\n      [[1, 0], [1, 1], [1, 2]],\n      [[2, 0], [2, 1], [2, 2]],\n      // verticals\n      [[0, 0], [1, 0], [2, 0]],\n      [[0, 1], [1, 1], [2, 1]],\n      [[0, 2], [1, 2], [2, 2]],\n      // diagonals\n      [[0, 0], [1, 1], [2, 2]],\n      [[2, 0], [1, 1], [0, 2]]\n    ];\n\n    for (let i = 0; i < posSeqs.length; i++) {\n      const winner = this.winnerHelper(posSeqs[i]);\n      if (winner != null) {\n        return winner;\n      }\n    }\n\n    return null;\n  }\n\n  winnerHelper(posSeq) {\n    for (let markIdx = 0; markIdx < Board.marks.length; markIdx++) {\n      const targetMark = Board.marks[markIdx];\n      let winner = true;\n      for (let posIdx = 0; posIdx < 3; posIdx++) {\n        const pos = posSeq[posIdx];\n        const mark = this.grid[pos[0]][pos[1]];\n\n        if (mark != targetMark) {\n          winner = false;\n        }\n      }\n\n      if (winner) {\n        return targetMark;\n      }\n    }\n\n    return null;\n  }\n\n  static isValidPos(pos) {\n    return (0 <= pos[0]) &&\n    (pos[0] < 3) &&\n    (0 <= pos[1]) &&\n    (pos[1] < 3);\n  }\n\n  static makeGrid() {\n    const grid = [];\n\n    for (let i = 0; i < 3; i++) {\n      grid.push([]);\n      for (let j = 0; j < 3; j++) {\n        grid[i].push(null);\n      }\n    }\n\n    return grid;\n  }\n}\n\nBoard.marks = ['x', 'o'];\n\nmodule.exports = Board;\n\n\n//# sourceURL=webpack:///./src/Tic_Tac_Toe_Node/board.js?");

/***/ }),

/***/ "./src/Tic_Tac_Toe_Node/game.js":
/*!**************************************!*\
  !*** ./src/Tic_Tac_Toe_Node/game.js ***!
  \**************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Board = __webpack_require__(/*! ./board */ \"./src/Tic_Tac_Toe_Node/board.js\");\nconst MoveError = __webpack_require__(/*! ./moveError */ \"./src/Tic_Tac_Toe_Node/moveError.js\");\n\nclass Game {\n  constructor() {\n    this.board = new Board();\n    this.currentPlayer = Board.marks[0];\n  }\n\n  isOver() {\n    return this.board.isOver();\n  }\n\n  playMove(pos) {\n    this.board.placeMark(pos, this.currentPlayer);\n    this.swapTurn();\n  }\n\n  promptMove(reader, callback) {\n    const game = this;\n\n    this.board.print();\n    console.log(`Current Turn: ${this.currentPlayer}`);\n\n    reader.question('Enter rowIdx: ', rowIdxStr => {\n      const rowIdx = parseInt(rowIdxStr);\n      reader.question('Enter colIdx: ', colIdxStr => {\n        const colIdx = parseInt(colIdxStr);\n        callback([rowIdx, colIdx]);\n      });\n    });\n  }\n\n  run(reader, gameCompletionCallback) {\n    this.promptMove(reader, move => {\n      try {\n        this.playMove(move);\n      } catch (e) {\n        if (e instanceof MoveError) {\n          console.log(e.msg);\n        } else {\n          throw e;\n        }\n      }\n\n      if (this.isOver()) {\n        this.board.print();\n        if (this.winner()) {\n          console.log(`${this.winner()} has won!`);\n        } else {\n          console.log('NO ONE WINS!');\n        }\n        gameCompletionCallback();\n      } else {\n        // continue loop\n        this.run(reader, gameCompletionCallback);\n      }\n    });\n  }\n\n  swapTurn() {\n    if (this.currentPlayer === Board.marks[0]) {\n      this.currentPlayer = Board.marks[1];\n    } else {\n      this.currentPlayer = Board.marks[0];\n    }\n  }\n\n  winner() {\n    return this.board.winner();\n  }\n}\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/Tic_Tac_Toe_Node/game.js?");

/***/ }),

/***/ "./src/Tic_Tac_Toe_Node/moveError.js":
/*!*******************************************!*\
  !*** ./src/Tic_Tac_Toe_Node/moveError.js ***!
  \*******************************************/
/***/ ((module) => {

eval("\nconst MoveError = function (msg) { this.msg = msg; };\n\n// MoveError really should be a child class of the built in Error object provided\n// by Javascript, but since we haven't covered inheritance yet, we'll just\n// let it be a vanilla Object for now!\n\nmodule.exports = MoveError;\n\n\n//# sourceURL=webpack:///./src/Tic_Tac_Toe_Node/moveError.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const View = __webpack_require__(/*! ./ttt-view.js */ \"./src/ttt-view.js\");\nconst Game = __webpack_require__(/*! ./Tic_Tac_Toe_Node/game.js */ \"./src/Tic_Tac_Toe_Node/game.js\");\n\n  $(() => {\n    const game = new Game();\n    const container = $(\".ttt\");\n    const view = new View(game, container);\n    \n    \n  });\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/ttt-view.js":
/*!*************************!*\
  !*** ./src/ttt-view.js ***!
  \*************************/
/***/ ((module) => {

eval("class View {\n  constructor(game, $el) {\n    this.$el = $el\n    this.game = game\n    this.setupBoard();\n  }\n  // Write a View.prototype.bindEvents method.When a user clicks on a cell, call \n  // Game.prototype.playMove to register their move.Manipulate the cell<li> to show \n  // the current player's mark. Add/remove CSS classes to change the cell background \n  // to white and display the 'X's and 'O's in different colors. I did all this in a \n  // View.prototype.makeMove method. I also popped an alert if the move was invalid.\n\n  bindEvents() {\n\n  }\n\n  makeMove($square) {\n    let mark = this.game.currentPlayer;\n    let pos = $square.attr('id').split(',');\n    pos = [parseInt(pos[0]),parseInt(pos[1])];\n    this.game.playMove(pos);\n    $square.css('background-color', 'white');\n    $square.append(\"<h1>\" + mark + \"</h1>\");\n    $square.css('display', 'flex');\n    $square.css('justify-content', 'center');\n    $square.css('align-items', 'center');\n    $square.css('font-size', '60px')\n    $square.css('font-family', 'arial')\n\n   // $square.css('text-align', 'center');\n  }\n\n  setupBoard() {\n    let grid = $('<ul class=\"grid\"></ul>');\n\n    for(let i = 0; i < 3; i++) {\n      for (let j = 0; j < 3; j++) {\n        let cell = $(\"<li class='cell' id=\"+ [i,j] +\"></li>\");\n        cell.data('isClicked', false);\n        cell.css('border-style', 'solid');\n        cell.css('border-width', '5px');\n        cell.css('width', '190px');\n        cell.css('height', '190px');\n        cell.css('list-style', 'none');\n        cell.css('background-color', 'gray');\n        \n        cell.hover((e) => {\n          // debugger\n          if (!$(e.target).data('isClicked')) {\n            $(e.target).css('background-color', 'yellow');\n          } else {\n            $(e.target).css('background-color', 'white');\n          }\n        }, (e) => {\n          if (!$(e.target).data('isClicked')) {\n            $(e.target).css('background-color', 'gray');\n          } else {\n            $(e.target).css('background-color', 'white');\n          }\n        \n        });\n\n\n        cell.on('click', (e) => {\n          // debugger\n          if (!$(e.target).data('isClicked')) {\n            $(e.target).data('isClicked', true);\n          } \n          this.makeMove($(e.target));\n          // else {\n          //   $(e.target).data('isClicked', false);\n          // }\n            \n        });\n\n        grid.append(cell);\n      }\n    }\n\n    // let cell = $(\".cell\");\n\n    grid.css('display', 'flex');\n    grid.css('flex-wrap', 'wrap');\n    grid.css('width', '600px');\n    grid.css('height', '600px');\n\n    let board = $('.ttt');\n    board.css('display', 'flex');\n    board.css('justify-content', 'center');\n\n    let title = $('.title');\n    title.css('text-align', 'center');\n\n    this.$el.append(grid);\n  }\n}\n\nmodule.exports = View;\n\n\n//# sourceURL=webpack:///./src/ttt-view.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;