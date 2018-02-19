//BlitSynth

public class BlitSynth extends Chubgraph {
    
    // DSP Chain
    BlitSaw s => LPF lpf => ADSR ad => outlet;
    BlitSquare sqr => ad => lpf;
    
    100 => s.harmonics => sqr.harmonics;
    
    // Setter's
    
    
    fun void env (dur attack, dur decay) {
    ad.set(attack,decay,0.1,200::ms);}
    
    fun void t () {ad.keyOn();}
    fun void o () {ad.keyOn();}
    
    0.75 => s.gain => sqr.gain;
    
    
    fun float freq(float freq)
    {freq => s.freq;
    freq + 1.880 => sqr.freq;}
    
    fun float lpfreq(float freq)
    {lpf.freq(freq);}
    lpf.Q(0.9);
    
}