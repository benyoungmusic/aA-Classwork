import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from "./board.jsx"



export default class Game extends React.Component {
    constructor (props) {
        super(props);

        const board = new Minesweeper.Board(5, 3);

        this.state = { board: board };
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame (){}

    render() {
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div>
        )
    }
}
