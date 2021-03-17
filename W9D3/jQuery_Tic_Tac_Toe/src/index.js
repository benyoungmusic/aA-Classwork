const View = require("./ttt-view.js");
const Game = require("./Tic_Tac_Toe_Node/game.js");

  $(() => {
    const game = new Game();
    const container = $(".ttt");
    const view = new View(game, container);
    
    
  });
