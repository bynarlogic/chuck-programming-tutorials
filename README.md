# chuck-programming-tutorials

## Getting Started

 1. Install Chuck. ChucK is a concurrent, strongly timed audio programming language for real-time synthesis, composition, and performance, which runs on Linux, Mac OS X, Microsoft Windows, and iOS. It can be downloaded [here](http://chuck.cs.princeton.edu/).
 2. Once installed, any program can be started by simply running the chuck command followed by the program name in the console. Users might also want to copy code inside of the miniaudicle IDE for enhanced GUI features. 

    $ chuck 1.\ Simple\ Sine\ Wave.ck


## Documentation
### Chapter 1. Simple Sine Wave
ChucK has a collection of UnitGenerators which make noise. The first UnitGenerator we will explore is called SinOsc. This is a simple Sine Wave that emits a single fundamental frequency at 440 Hertz at half volume. The SinOsc is 'chucked' to the dac object using the => operator. The dac object or the digital audio converter is the computer's connection to your external speakers or sound card.  Think of the => operator as a patch cable or plug that connects the audio output of the SineWave into the speaker. 

    SinOsc => dac;
    s.gain(0.5);
    s.freq(440);
This code alone will not produce sound. To produce sound, we have to tell the program how long the sound is going to last. ChucK applies time units to the now object. Now represents the current time plus the additional time 'chucked' to now. In this example we only want to process the sound for one second. Therefore we 'chuck' 1 second to now. 

    1::second => now;

Running the full program generates a smooth tone at 440hz, half volume, for 1 second. Try playing around with the settings. Change the tone, the volume or the timing. 

### Chapter 2. Simple Sequence
Coming Soon!
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
