# Nightwriter

Before there was [braille](https://en.wikipedia.org/wiki/Braille), Louis Barbier, an artillery officer in Napoleon's French army and
one of the teachers of Louis Braille, created night-writing, a system to permit soldiers to communicate in total darkness. The French army at the time 
deemed it impractical because of its complexity but it was the basis for the eventual braille system we know today. 

## This Translation Project 

This project attempts to mimic braille in a computer format through the uses of an '0' representing a raised dot and a '.' representing an unraised piece 
of paper. A user can create a txt txt file in the root directory (there is already one created by default called 'message.txt' and input the desired latin script. 
Then, the user can translate it into braille by running the 'night_writer_runner.rb' file and inputting both the naem of the file that has the incoming text (so, in this case
'message.txt' and then immediately after the space, the user can input the title of the text file in which the user wants the braille output to me. So for example: 
```
ruby ./lib/night_writer_runner.rb message.txt braille.txt
```
will run the runner and automatically take the latin script in message.txt and output it into a newly created file named 'braille.txt.'

On the flip side, the user can run 

``` 
ruby ./lib/night_reader_runner.rb braille.txt latin_script_message.txt 
``` 
and translate the braille file from 'braille.txt' and output it in traditional latin script in the newly created file 'latin_script_message.txt.'

It's that easy. 

## Limitations 

This program will work for any language base with a [latin alphabet script](https://en.wikipedia.org/wiki/Latin_alphabet) but it does not include punctuation, 
capitalizations, and accents and other characters used in other latin-based langauges (such as the [ñ](https://en.wikipedia.org/wiki/%C3%91) from Spanish. In fact, Braille did not 
originally have a ['W'](https://studybraille.com/Alphabet/alphabet_practice_links.html#:~:text=The%20Letter%20'W'&text=Ah!,4%2C%205%2C%20and%206.) as 
it was not used in French and was only added later. You may see that it follows a different pattern than the other letters. 

The program also does not translate punctuation or capital letters-- it simply disregards punctuation and it changes all capitalized letters to lowercase. 

