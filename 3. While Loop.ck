// Sine Wave connected to audio out
SinOsc s => dac;


while(true) {

// Set midi musical note
// with randomly selected octaves

Std.mtof(36 + (Math.random2(0,4) * 12)) => s.freq;

// Process program for a duration of one second

0.25::second => now;

}
