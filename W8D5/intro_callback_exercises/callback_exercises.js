class Clock {
    constructor() {
        // 1. Create a Date object.
        const currentDate = new Date();
        // 2. Store the hours, minutes, and seconds.
        this.currentHours = currentDate.getHours();
        this.currentMinutes = currentDate.getMinutes();
        this.currentSeconds = currentDate.getSeconds();
        // 3. Call printTime.
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        console.log(`${this.currentHours}:${this.currentMinutes}:${this.currentSeconds}`);
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    };

    _tick() {
        // 1. Increment the time by one second.
        this.currentSeconds++;
        if (this.currentSeconds === 60) {
            this.currentSeconds = 0;
            this.currentMinutes++;
        }
        if (this.currentMinutes === 60) {
            this.currentMinutes = 0;
            this.currentHours++;
        }
        if (this.currentHours=== 24) {
            this.currentHours = 1;
        }

        // 2. Call printTime.
        this.printTime();
    };
}

// const clock = new Clock();