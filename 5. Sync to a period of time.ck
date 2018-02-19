// Sync to a period of 1::second
// Try altering this program while adding/replacing/subtracting shreds
// Try with and without the time sync (line 6)

1::second => dur T;
T - (now % T) => now;

// Band limited Saw Wave connected to an ADSR Envelope connected to Reverb connected an audio out
BlitSaw s => ADSR adsr => NRev r => dac;

// Connect another Osc to the same adsr

BlitSquare sqr => adsr;

// Use the Chuck Operator (=>) to set the harmonic levels for both oscillators

Math.random2(5,25) => s.harmonics => sqr.harmonics;

// set the gain for both oscillators

0.1 => s.gain => sqr.gain;

// Set the adsr envelope (attack, decay, sustain, and release)

adsr.set(10::ms, 200::ms, 0.1, 5000::ms);

// set the reverb mix

r.mix(0.1);

// Create an array of midi note values 

[0,7,0,7,2,9,2,9,4,11,4,11] @=> int seq[];


while(true) {

  for(int i; i < seq.cap(); i++) {
    
    // Store the note to a frequency variable
    Std.mtof(seq[i] + 60) => float freq;
    
    // Pass to  both oscillators. Detune the second oscillator for a wider sound
    
    freq + 2.11299 => sqr.freq;
    freq => s.freq;
    
    // Trigger ADSR envelope with a key on message
    adsr.keyOn();
    T / 4 => now;
    // Trigger ADSR envelope with a key off message
    adsr.keyOff();
    T / 4 => now;

  }

}
