// Sync to a period of 1::second
1::second => dur T;
T - (now % T) => now;

// Band limited Saw Wave connected to an ADSR Envelope connected to Reverb connected an audio out
BlitSaw s => ADSR adsr => NRev r => dac;

// Connect another Osc to the same adsr

BlitSquare sqr => adsr;

// Use the Chuck Operator (=>) to set the harmonic levels for both oscillators

Math.random2(5,25) => s.harmonics => sqr.harmonics;

// set the gain for both oscillators

0.8 => s.gain => sqr.gain;

// Set the adsr envelope (attack, decay, sustain, and release)

adsr.set(10::ms, 200::ms, 0.0, 0::ms);

// set the reverb mix

r.mix(0.0);


function void sequencer(int octave,int seq[],float duration, float detune) {

while(true) {
   
  <<<duration>>>;

  for(int i; i < seq.cap(); i++) {
    
    // Store the note to a frequency variable
    Std.mtof(seq[i] + octave) => float freq;
    
    // Pass to  both oscillators. Detune the second oscillator for a wider sound
    
    freq + detune => sqr.freq;
    freq => s.freq;
    
    // Trigger ADSR envelope with a key on message
    adsr.keyOn();
    T * duration => now;

  }

}


}

[4,7,4,2] @=> int seq1[];
[4,2,7,0] @=> int seq2[];



// Play seq1 2 * T (2 measures)
spork ~sequencer(24,seq1, 0.25, 0);
T * 2 => now;

// Play seq2 2 * T (2 measures)
spork ~sequencer(24,seq2, 0.25, 0);
T * 2 => now;


