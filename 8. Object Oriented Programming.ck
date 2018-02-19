// Sync to a period of 1::second
1::second => dur T;
T - (now % T) => now;

BlitSynth m => NRev n => dac;
Phasor p => blackhole;

n.mix(0.1);

m.env(10::ms, 200::ms);

function float sequencer(BlitSynth inst,int octave,int seq[],float duration, float detune) {
    
    while(true) {
        
        for(int i; i < seq.cap(); i++) {
            
            // Store the note to a frequency variable
            Std.mtof(seq[i] + octave) => inst.freq;
            inst.t();
            T * duration => now;
            inst.o();
            T * duration => now;
            
        }
        
    }
    
    
}

function void modulator(BlitSynth inst,float freq, float cf, float mul) {
    
    Phasor p => blackhole;
    p.freq(freq);
    while (true) {
        cf + (p.last() * mul) => inst.lpfreq;
        T / 64 => now;
    }
    
}


[4,7,16,12] @=> int seq1[];
[4,2,7,0] @=> int seq2[];



// Play seq1 2 * T (2 measures)
// modulate LPF frequency with ~modulator

while(true) {

spork ~sequencer(m, 24,seq1,0.125,0.0);
spork ~modulator(m,0.5,200,300);
T * 2 => now;

spork ~sequencer(m, 24,seq2,0.125,0.0);
spork ~modulator(m, 0.5,1200,800);
T * 2 => now;

spork ~sequencer(m, 31,seq1,0.125,0.0);
spork ~modulator(m,0.5,200,2800);
T * 2 => now;

spork ~sequencer(m, 36,seq2,(1/16),0.0);
spork ~modulator(m,0.5,1200,1300);
T * 2 => now;

}
