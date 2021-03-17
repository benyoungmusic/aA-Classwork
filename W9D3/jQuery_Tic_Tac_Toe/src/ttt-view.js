class View {
  constructor(game, $el) {
    this.$el = $el
    this.game = game
    this.setupBoard();
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    let grid = $('<ul class="grid"></ul>');

    for(let i = 0; i < 9; i++) {
      let cell = $("<li class='cell' id=" + i + "></li>");
      cell.data('isClicked', false);
      cell.css('border-style', 'solid');
      cell.css('border-width', '5px');
      cell.css('width', '190px');
      cell.css('height', '190px');
      cell.css('list-style', 'none');
      cell.on('click', (e) => {
        // debugger
        if (!$(e.target).data('isClicked')) {
          $(e.target).data('isClicked', true);
        } else {
          $(e.target).data('isClicked', false);
        }
      });
  
      cell.hover((e) => {
        // debugger
        if (!$(e.target).data('isClicked')) {
          $(e.target).css('background-color', 'yellow')
        } else {
          $(e.target).css('background-color', 'gray')
        }
      }, (e) => {
        $(e.target).css('background-color', 'gray')
      });
      grid.append(cell);
    }

    // let cell = $(".cell");

    grid.css('display', 'flex');
    grid.css('flex-wrap', 'wrap');
    grid.css('width', '600px');
    grid.css('height', '600px');

    this.$el.append(grid);
  }
}

module.exports = View;
