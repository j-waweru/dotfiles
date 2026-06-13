# Practical vim by Drew Neil 

/search - search through the term
`*` - pressing starts a search of the word under the cursor 

. - repeats the last change
U - undo the last change
; - repeats the last command
, - repeats the last f search backwards 
n - move through searchs
N - move backwards through searchs



Ctrl [ - same as escape
C - deletes to the end of line
cc - deletes entire line and enters insert mode
P - pastes before instead of after like p

A - move to the end of the current line and enter insert mode 
I - move to the start of the current line and enter insert mode 
s - same as x and i. deletes the char under the cursor and enter insert mode 

> [!TIP]
> Repeating a command causes it to work on an entire line 

= - auto indents
*> - indents the selected text *
*>> - indets the current line *
*>G - indents to the end of the file*
*>gg - indents to the start of the file*
*> (jk) - indents the current line and the above or below*


### The vim way 

> [!TIP]
> The dot command 

In insert mode Vim records every keystroke so :
    If i want to put a semi colon at the end of many lines I can 
        add the semi colon and then 
        j. 
        to repeat the change to the next line

or if i want to convert **var foo = "method("+argument1+","+argument2+")";**  to **var foo = "method(" + argument1 + "," + argument2 + ")";**
    f+ 
    i 
    delete the +
    insert *space plus space* (delete)
    ; - to repeat the f+
    . - to repeat the change 

Lets say that were to change some but not all occurences of a word 
    `*` - to start a search for the word under the cursor
    cw new_word - to replace 
    n - to move to the next occurence of the word we want to replace 
    . - to repeat the cw command


## Modes

### Normal mode 

In vim the undo command has different granularity.
When we enter insert mode that also counts as a change and the undo command will **undo until the last time we hit undo**
So controlling how often we hit u, we can control how much we undo

As a general rule, if you’ve paused for long enough to ask the question, “Should I leave Insert mode?” 

> [!WARNING]
If we use the <Up> , <Down> , <Left> , or <Right> cursor keys while in Insert mode, a new undo
chunk is created. It’s just as though we had switched back to Normal mode to move
around with the h , j , k , or l commands, except that we don’t have to leave Insert mode. 
This also has implications on the operation of the dot command.

> [!TIP]
Text objects - define the kind of text objects to operate on

:help aw - to see the different types of objects 

l - character
w - word
W - contiguous text
s - sentence
p - paragraph
{ - closest enclosing brackets
t - tag eg html tags


<C-a> and <C-x> commands perform addition and subtraction on the number under the cursor or the next occurence scoped to a word object.
10<C-a> - will add 10 to the number


gUaw - capitalizes the text object specified 
gu - lower case
g~ - swap the cases 

## Insert Mode 







---

## Nvim opl book notes

## Editing a little faster.  
ctrl-] --> moves into a tag,  

ctrl-T --> pops a tag off the tag stack.  

ctrl-G --> shows some info about the current line.   

ctrl-u --> moves half a page up  
ctrl-d --> moves half a page down  

c and d work the same but c leaves you in insert mode.  
The . redos the last change or delete.

The J command joins two lines.   

Macros  

using q<a> then q to stop recording, one can record a series of keystrokes to the a register.  

## Searching

The / is used when searching.  
When pressed and page up and down keys are pressed, it shows the last three recent searches.   

set:hlsearch - enables search highlighting. 
set:nohlsearch - removes search highlighting. 

Just :nohlsearch removes the highlighting only for the current time.  

The ? n and N commands can be used to navigate the searched items.   

The ? reverses the direction while N inverts back to forward.  
The n just repeats the last search command.   

### Basic regex   

Using the ^ and $ one can search only for an occurence that occurs at the begenning or end of a line.    

To search for a line of a word containing only the word the then use ^the$ and ^$ to search for empty lines.  

The . is used to match any character eg c.m first letter c second any and third an m.  

To match a regex character it must first be escaped using a \   

## Text blocks and multiple files

The command xp can be used to correct eg teh to the in an instant.   

The ma command creates a mark on a line of text and then accessed via 'a. eg d'a can be used to delete up to the mark. Any letter from a to z can be used.    

The :marks command can be used to view all marks. The :marks args can be used to view specific mark where args is a letter from a to z.   

The !motion command can be used to basically pipe lines in nvim into another unix program and then replace those lines with the output fo the unix program. eg   

>> !10GSort will sort the first ten lines.  
>> !! will use the current line eg !!ls will put the output of the ls command into the file.  

## Windows
 
The :split command splits the window into two.    
:split filename - splits the file  

:new file - similar to split except it open the new file in the other window    
:sview - look at but not edit a file    










