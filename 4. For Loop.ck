// Band Limited Saw Wave connected to audio out
BlitSaw s => dac;

// Set # of harmonics

s.harmonics(Math.random2(5,50));

// Set midi note sequence array

[0,2,0,2,5,2,5,2,7,9,7,5] @=> int seq[];

for (int i; i < seq.cap(); i++) {
// Set midi musical note value (0 - 127) using a random function 
// generating notes within one ocatve. 
Std.mtof(seq[i] + 36) => s.freq;

// Process program for a duration of one second

0.25::second => now;

}
