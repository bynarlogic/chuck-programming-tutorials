// Sync to a period of 1::second
1::second => dur T;
T - (now % T) => now;

// Band limited Saw Wave connected to an ADSR Envelope connected to Low Pass Filter to Reverb connected an audio out
BlitSaw s => LPF lpf => ADSR adsr => NRev r => dac;

// Connect another Osc to the same Low Pass Filter and adsr

BlitSquare sqr => lpf => adsr;

// Use the Chuck Operator (=>) to set the harmonic levels for both oscillators

Math.random2(15,50) => s.harmonics => sqr.harmonics;

// set the gain for both oscillators

0.5 => s.gain => sqr.gain;

// Set the adsr envelope (attack, decay, sustain, and release)

adsr.set(10::ms, 100::ms, 0.1, 100::ms);

// set the reverb mix

r.mix(0.1);

// set the LPF resonance

lpf.Q(0.8);


function void sequencer(int octave,int seq[],float duration, float detune) {

while(true) {
   
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


function void modulator(float freq, float cf, float mul) {
    
    Phasor p => blackhole;
    p.freq(freq);
    while (true) {
    cf + (p.last() * mul) => lpf.freq;
    T / 32 => now;
    }
    
}


[4,7,4,12] @=> int seq1[];
[4,0,7,24] @=> int seq2[];

// loop for a while
while (true) { 

// Play seq1 2 * T (2 measures)
// modulate LPF frequency with ~modulator
spork ~sequencer(36,seq1, 0.25, 0);
spork ~modulator(0.5,800,500);
T / 4 => now;

// Play seq2 2 * T (2 measures)
// modulate LPF frequency with ~modulator
spork ~sequencer(48,seq2, 0.25, 0);
spork ~modulator(1.5,1200,800);
T / 8 => now;


// Play seq1 2 * T (2 measures)
// modulate LPF frequency with ~modulator
spork ~sequencer(41,seq1, 0.25, 0);
spork ~modulator(0.5,500,300);
T * 4 => now;

// Play seq2 2 * T (2 measures)
// modulate LPF frequency with ~modulator
spork ~sequencer(48,seq2, 0.25, 0);
spork ~modulator(2.5,1800,800);
T / 2 => now;

}
