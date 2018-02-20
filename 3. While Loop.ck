// Sine Wave connected to audio out
SinOsc s => dac;

while(true) {
    // Set midi musical note
    // with randomly selected octaves
    Std.mtof(60 + (Math.random2(0,3) * 5)) => s.freq;
    // Play for 1/4 of a second
    0.25::second => now;
}
