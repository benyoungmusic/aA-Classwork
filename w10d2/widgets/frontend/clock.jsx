import React from 'react';

class Clock extends React.Component {

    constructor(props) {
        super(props);
        this.state = { date: new Date()};
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState( { date: new Date()} );
    }

    render() {
        return (
            <h1>CLOCK {this.state.date.toTimeString()}</h1>
        )
    }

    componentDidMount() {
        setInterval(this.tick, 1000);
    }


}

export default Clock;