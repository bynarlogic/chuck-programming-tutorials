# chuck-programming-tutorials

## Getting Started

 1. Install Chuck. ChucK is a concurrent, strongly timed audio programming language for real-time synthesis, composition, and performance, which runs on Linux, Mac OS X, Microsoft Windows, and iOS. It can be downloaded [here](http://chuck.cs.princeton.edu/).
 2. Once installed, any program can be started by simply running the chuck command followed by the program name in the console. Users might also want to copy code inside of the miniaudicle IDE for enhanced GUI features.

```{r, engine='bash', count_lines}
$ chuck 1.\ Simple\ Sine\ Wave.ck
```


## Documentation
### Chapter 1. Simple Sine Wave
ChucK has a collection of UnitGenerators which make noise. The first UnitGenerator we will explore is called SinOsc. This is a simple Sine Wave that emits a single fundamental frequency at 440 Hertz at half volume. The SinOsc is 'chucked' to the dac object using the => operator. The dac object or the digital audio converter is the computer's connection to your external speakers or sound card.  Think of the => operator as a patch cable or plug that connects the audio output of the SineWave into the speaker.

    SinOsc => dac;
    s.gain(0.5);
    s.freq(440);
This code alone will not produce sound. To produce sound, we have to tell the program how long the sound is going to last. ChucK applies time units to the now object. Now represents the current time plus the additional time 'chucked' to now. In this example we only want to process the sound for one second. Therefore we 'chuck' 1 second to now.

    1::second => now;

Running the full program generates a smooth tone at 440hz, half volume, for 1 second. Try playing around with the settings. Change the tone, the volume, or the timing to create new variations of the sound. Consult the ChucK documentation and change the Sine Wave to a Sawtooth or Square Wave. How are these sounds different?  

### Chapter 2. Simple Sequence
Let's make some music now! For this lesson we will take the basic fundamentals form Chapter 1 and simply arrange a sequence of notes to make a simple melody.

Music, in its most basic form, is a sequence of sound events played at different tones, durations, and intervals. In this example we will simply play the same duration at intervals of 1/4 second. For each event we will play a simple tone.

Achieving this is not difficult. All we need to do is copy and paste our code from Chapter 1 and structure a 4 note sequence of note events. At this point we can change the frequency for each note event and create a pattern of events that almost sound musical. Here we simply divided the second note in half, multiplied the third note by 2, and then multiplied the final note by 2.5.

```{r, engine='bash', count_lines}
// Set frequency (hertz) and volume of Sine Wave
s.gain(0.5);
s.freq(440);
// Process program for a duration of 1/4 second
0.25::second => now;

// Set frequency (hertz) and volume of Sine Wave
s.gain(0.5);
s.freq(220);
// Process program for a duration of 1/4 second
0.25::second => now;

// Set frequency (hertz) and volume of Sine Wave
s.gain(0.5);
s.freq(880);
// Process program for a duration of 1/4 second
0.25::second => now;

// Set frequency (hertz) and volume of Sine Wave
s.gain(0.5);
s.freq(1100);
// Process program for a duration of 1/4 second
0.25::second => now;

```
Run the program a few times and see if you can change the sequence to a sequence you prefer. Can you replicate one of your favorite songs? How would you convert Hertz to musical notes? Does sequencing music like this feel awkward? What would make this easier?

### Chapter 3. While Loop
Coming Soon!
### Chapter 4. For Loop
Coming Soon!
### Chapter 5. Sync to a period of time
Coming Soon!
### Chapter 6. Introducing Functions
Coming Soon!
### Chapter 7. Concurrency with Shreds
Coming Soon!
### Chapter 8. Object Oriented Programming
