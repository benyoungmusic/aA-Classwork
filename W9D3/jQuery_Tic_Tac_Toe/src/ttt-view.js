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
      let cell = $("<li class='cell' id="+ i +" ></li>");
      grid.append(cell);
    }

    grid.css('display', 'flex');
    this.$el.append(grid);
  }
}

module.exports = View;
