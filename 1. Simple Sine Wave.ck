// Sine Wave connected to audio out
SinOsc s => dac;

// Set frequency (hertz) and volume of Sine Wave

s.gain(0.5);
s.freq(440);

// Process program for a duration of one second

1::second => now;

