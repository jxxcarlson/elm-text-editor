module Text exposing (gettysburgAddress, help, info, jabberwocky, long, tolstoy)


help =
    """
Help
====

Partial list of key commands
----------------------------

Show help         ctrl-h         (Toggle)
Show info panel   ctrl-shift-i   (Toggle)
Go to line        ctrl-g         (Toggle)

First line        ctrl-option up-arrow
Last line         ctrl-option down-arrow

Page Up           ctrl-option up-arrow
Page Down         ctrl-option down-arrow

Line Up           up-arrow
Line Down         down-arrow

Copy selection    ctrl-c
Cut selection     ctrl-x
Paste selection   ctrl-v
Wrap text         ctrl-w
Clear text        ctrl-shift c

Search panel      ctrl-s (Toggle)
Next search hit   ctrl-. (Think >)
Prev search hit   ctrl-. (Think <)

Undo              ctrl-z
Redo              ctrl-y

ctrl-c to copy selection; ctrl-x to cut; ctrl-v to paste copied text

NOTE: The above list is far from complete.
"""


gettysburgAddress =
    """
Below is Abraham Lincoln's Gettysburg Address.
It was loaded as three long lines.  This example
illustrates the current state of the text-wrap
functionality.  It is based on Folkert de Vries'
elm-paragraph library.

Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.
Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

But, in a larger sense, we can not dedicate—we can not consecrate—we can not hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth."""


tolstoy =
    """“Well, Prince, so Genoa and Lucca are now just family
estates of the Buonapartes. But I warn you, if you don’t
tell me that this means war, if you still try to defend
the infamies and horrors perpetrated by that Antichrist—
I really believe he is Antichrist—I will have nothing
more to do with you and you are no longer my friend,
no longer my ‘faithful slave,’ as you call yourself!
But how do you do? I see I have frightened you—
sit down and tell me all the news.
 ”"""


info =
    """This is a first test of how
the editor could be used as a package.
The 'Info' button is a proxy for loading new
content into the editor from an external
source.

Everything in this window is from `Editor.view`.  All
the rest is in `Main`, though of course it uses
functions exported by `Editor`, e.g., the slider.

The "Reset" button loads the initial text.
The "Gettysburg address" button loads
Abraham Lincoln's speech.  It contains three
very long lines which are wrapped by the editor
before you see them.  I need to devote more
thought to how best to do text wrapping —
it needs to be an option, for instance.
Am using Folkert de Vries' *elm-paragraph*
library for this.

NOTES

1. At present, all the editor controls
are key commands.  Press the "Help" button,
in hte info panel, upper right, for a partial
list of these. Full list coming soon.

2. More parameters are now configurable.
For example, one can do this in Main:

editorState = Editor.init
   { defaultConfig | lines = 30
                   , showInfoPanel = False
   }

to set up the embedded editor with a 30-line
display and the info panel not shown.

3. I've tested the editor on a file of 1700
lines and 7700 words. It works fine.  For
a file of 17,000 lines and 770,000 words,
moving around the text is extremely fast,
whereas double-clicking to select a word
fails.  I don't know why as of this writing.

4. In view of (3), I've set the gutter width
to accommodate files of up to 9,999 lines.

ROADMAP

There is still a lot to do.



"""


long =
    List.repeat 30 jabberwocky |> String.join "\n----\n\n"


jabberwocky =
    """Jabberwocky

By Lewis Carroll

’Twas brillig, and the slithy toves
     Did gyre and gimble in the wabe:
All mimsy were the borogoves,
     And the mome raths outgrabe.

“Beware the Jabberwock, my son!
     The jaws that bite, the claws that catch!
Beware the Jubjub bird, and shun
     The frumious Bandersnatch!”

He took his vorpal sword in hand;
     Long time the manxome foe he sought—
So rested he by the Tumtum tree
     And stood awhile in thought.

And, as in uffish thought he stood,
     The Jabberwock, with eyes of flame,
Came whiffling through the tulgey wood,
     And burbled as it came!

One, two! One, two! And through and through
     The vorpal blade went snicker-snack!
He left it dead, and with its head
     He went galumphing back.

“And hast thou slain the Jabberwock?
     Come to my arms, my beamish boy!
O frabjous day! Callooh! Callay!”
     He chortled in his joy.

’Twas brillig, and the slithy toves
     Did gyre and gimble in the wabe:
All mimsy were the borogoves,
     And the mome raths outgrabe.

PS. Here is the buried treasure.

NOTES

1. The above text about "treasure" is **fake**.
We were just testing to see if we could send
the editor requests like "find the word 'treasure,'
scroll down to it, and highlight it."

2. Now that this is working, we have a bit of
code cleanup to do. And more work on some
cursor and highight flakines, e.g., highlighting
should be preserved when scrolling.


"""