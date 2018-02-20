# ChucK Programming Tutorials

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
In Chapter 2 we successfully created our first melody. This was no small feat! Computers are very good at taking action based on a sequence of instructions. Given what we already know, any melody or song can be reproduced note by note via copy and paste. After a while creating music in this manner becomes tedious and uninspiring. There has to be an easier way.

Musical melodies are often repeated many times over a song in what is known as a phrase. Phrases are essentially loops. Electronic and hip hop music layer loops to create polyrhythmic textures where loops interact and play off of each other. Fortunately for us there is a perfect control structure in programming to replicate this behavior - the While Loop.

Instead of copying and pasting each note, instructions can be repeated to create musical phrases. In ChucK the While loop is constructed with the While keyword and curly brackets to contain the sequence of instructions that will be repeated. In this example we will repeat the instructions infinitely or until the program is terminated.

```
// Loop Repeats while true is true (aka forever!)
while(true) {
	//instructions go here
}
```

Ordinarily we would not write computer programs with infinite loops! This is something that is usually avoided in programming because it will hang the program and prevent the program from executing other parts or the code and will run forever. In ChucK, as we will soon find out, there are ways to algorithmically terminate and start programs. In music we might want to improvise and let an infinite loop build a groove over a period of time.

To make the loop more interesting we will introduce two new libraries - Std and Math. Std stands for Standard Library and is a collection of useful utility methods that can be used in our programs. Std features a method called 'mtof' or 'midi to frequency'. In computer music the 12 note scale on the piano is represented as ascending pitches between 0 - 127. An octave is 12 notes and there are 10 octaves available. Middle C on the piano is represented at 60. Do not fret if you have limited to no musical knowledge! Using any of the values between 0 - 127 will automatically give us standard western tuning. Midi notes are certainly a lot easier to work with and reason about.

Mtof is a method that takes an input and returns a value. We will input a midi note value, 60 for example, and mtof will return the corresponding value in hertz. We can observe this by writing a small program that prints the output of Std.mtof(60). ChucK uses the <<< >>> symbols to print return values for debugging purposes.

```
<<< Std.mtof(60) >>>;
261.625565 :(float)
```
As you can see, composing songs in hertz begins to get trickier when we try to incorporate western musical notes into our melodies. To make things even easier we are going to generate some random notes using the Math library. Math has a function called random2 that takes the input of 2 numbers. The 2 numbers represent a range between the first and second numbers.

We can randomize octaves, notes occurring ever 12 notes, by randomizing between a set of numbers and multiplying by 12. When we convert the notes to frequency, SinOsc can take the frequency as input and make a sound!

```
Std.mtof(60 + (Math.random2(0,3) * 12)) => s.freq;
```

Putting everything together, we can wrap our algorithm inside of the while loop. This is one of the  advantages of working with music with code. As we progress towards more complex programs, we can begin to create music that can only be achieved with computer programming. This is known as algorithmic composition.

```
// Sine Wave connected to audio out
SinOsc s => dac;

while(true) {
    // Set midi musical note
    // with randomly selected octaves
    Std.mtof(60 + (Math.random2(0,3) * 12)) => s.freq;
    // Play for 1/4 of a second
    0.25::second => now;
}
```
Try changing the speed of the sequence. What happens when you change the middle c note to another note? How does it sound 12 or 24 notes down? Does the song become more or less musical if you change the multiple value? Expirement away and hit ctrl-c on your keyboard when you have heard enough!

### Chapter 4. For Loop
Coming Soon!
### Chapter 5. Sync to a period of time
Coming Soon!
### Chapter 6. Introducing Functions
Coming Soon!
### Chapter 7. Concurrency with Shreds
Coming Soon!
### Chapter 8. Object Oriented Programming
