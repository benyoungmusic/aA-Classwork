import React from "react";
import Tile from "./tile.jsx";

export default class Board extends React.Component {
    constructor (props) {
        super(props);
        this.boardRender = this.boardRender.bind(this);
        this.counter = 0;
    }

    boardRender() {
        const board = this.props.board;
        return board.grid.map((subArr, idx1) => {
            return (
                <div key={idx1}> 
                    {subArr.map((tile, idx2) => {
                        return (
                            <Tile tile={tile} 
                            updateGame={this.props.updateGame} 
                            key={`${idx1}-${idx2}`} />  
                        )
                    })} 
                </div>
            );   
        });
    }

    render () {
        
        return (
           <div className="rows"> 
               {this.boardRender()} 
            </div>
        )
    }   
}

