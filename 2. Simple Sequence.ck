// Sine Wave connected to audio out
SinOsc s => dac;

// Set frequency (hertz) and volume of Sine Wave

s.gain(0.5);
s.freq(440);

// Process program for a duration of one second

0.25::second => now;

// Set frequency (hertz) and volume of Sine Wave

s.gain(0.5);
s.freq(220);

// Process program for a duration of one second

0.25::second => now;

// Set frequency (hertz) and volume of Sine Wave

s.gain(0.5);
s.freq(110);

// Process program for a duration of one second

0.25::second => now;

// Set frequency (hertz) and volume of Sine Wave

s.gain(0.5);
s.freq(880);

// Process program for a duration of one second

0.25::second => now;
