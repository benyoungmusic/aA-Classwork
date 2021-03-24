import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from "./board.jsx";
import Tile from "./tile.jsx";

export default class Game extends React.Component {
    constructor (props) {
        super(props);

        const board = new Minesweeper.Board(5, 3);

        this.state = { board: board };
        this.updateGame = this.updateGame.bind(this);
        this.wonOrLost = this.wonOrLost.bind(this);
    }

    updateGame(tile, flagged) {
        if (flagged) {
            tile.toggleFlag()
        } else if (!flagged) {
            tile.explore();
        }
        this.setState({ board: this.state.board })
    }

    wonOrLost() {
        if (this.state.board.lost()) {
            return alert("You lost")
        } else if (this.state.board.won()) {
            return alert("You won")
        }
    }

    render() {
        let endState;
        if (this.wonOrLost()) endState = this.wonOrLost();
        return (
            <div className="board">
                
                <Board board={this.state.board} updateGame={this.updateGame} />
                {endState}
            </div>
        )
    }
}
