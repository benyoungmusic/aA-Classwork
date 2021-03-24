import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.tileStatus = this.tileStatus.bind(this)
  }

  tileStatus(tile) {
      let bombCount;
      let marker = 'ൠ';
      let tileClass = "covered";

    if (tile.explored && tile.bombed) {
        marker = '💣';
        tileClass = "bomb";
    } else if (tile.explored) {
        bombCount = tile.adjacentBombCount();
        marker = bombCount === 0 ? "" : `${bombCount}`;
        tileClass = "explored";
    } else if (tile.flagged) {
        marker = '⚑';
        tileClass = "flagged";
    }
    return [marker, tileClass];
  }

  render() {
      let tile = this.props.tile;
      let [marker, tileClass] = this.tileStatus(tile)
      tileClass += " tile"

    return (
      <div className={tileClass}>
        {marker}
      </div>
    )
  }
}

