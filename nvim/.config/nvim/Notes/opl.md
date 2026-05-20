# Nvim opl book notes

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






