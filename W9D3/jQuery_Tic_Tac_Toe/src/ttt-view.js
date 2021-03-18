class View {
  constructor(game, $el) {
    this.$el = $el
    this.game = game
    this.setupBoard();
  }
  // Write a View.prototype.bindEvents method.When a user clicks on a cell, call 
  // Game.prototype.playMove to register their move.Manipulate the cell<li> to show 
  // the current player's mark. Add/remove CSS classes to change the cell background 
  // to white and display the 'X's and 'O's in different colors. I did all this in a 
  // View.prototype.makeMove method. I also popped an alert if the move was invalid.

  bindEvents() {

  }

  makeMove($square) {
    let mark = this.game.currentPlayer;
    let pos = $square.attr('id').split(',');
    pos = [parseInt(pos[0]),parseInt(pos[1])];
    this.game.playMove(pos);
    $square.css('background-color', 'white');
    $square.append("<h1>" + mark + "</h1>");
    $square.css('display', 'flex');
    $square.css('justify-content', 'center');
    $square.css('align-items', 'center');
    $square.css('font-size', '60px')
    $square.css('font-family', 'arial')

   // $square.css('text-align', 'center');
  }

  setupBoard() {
    let grid = $('<ul class="grid"></ul>');

    for(let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let cell = $("<li class='cell' id="+ [i,j] +"></li>");
        cell.data('isClicked', false);
        cell.css('border-style', 'solid');
        cell.css('border-width', '5px');
        cell.css('width', '190px');
        cell.css('height', '190px');
        cell.css('list-style', 'none');
        cell.css('background-color', 'gray');
        
        cell.hover((e) => {
          // debugger
          if (!$(e.target).data('isClicked')) {
            $(e.target).css('background-color', 'yellow');
          } else {
            $(e.target).css('background-color', 'white');
          }
        }, (e) => {
          if (!$(e.target).data('isClicked')) {
            $(e.target).css('background-color', 'gray');
          } else {
            $(e.target).css('background-color', 'white');
          }
        
        });


        cell.on('click', (e) => {
          // debugger
          if (!$(e.target).data('isClicked')) {
            $(e.target).data('isClicked', true);
          } 
          this.makeMove($(e.target));
          // else {
          //   $(e.target).data('isClicked', false);
          // }
            
        });

        grid.append(cell);
      }
    }

    // let cell = $(".cell");

    grid.css('display', 'flex');
    grid.css('flex-wrap', 'wrap');
    grid.css('width', '600px');
    grid.css('height', '600px');

    let board = $('.ttt');
    board.css('display', 'flex');
    board.css('justify-content', 'center');

    let title = $('.title');
    title.css('text-align', 'center');

    this.$el.append(grid);
  }
}

module.exports = View;
