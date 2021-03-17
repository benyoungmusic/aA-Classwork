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
      let cell = $("<li class='cell' id="+ i +" data-is-clicked='false'></li>");
      grid.append(cell);
    }

    let cell = $(".cell");
    cell.css('border-style', 'solid');
    cell.css('border-width', '5px');

    cell.on('click', () => {
      if (!this.data('isClicked')) {
        this.data('isClicked', true)
      } else {
        this.data('isClicked', false)
      }
    });

    cell.on('hover', () => {
      if (!this.data('isClicked')) {
        cell.css('background-color', 'yellow')
      }
    });

    grid.css('display', 'flex');
    grid.css('flex-wrap', 'wrap');
    grid.css('width', '600px');
    this.$el.append(grid);
  }
}

module.exports = View;
