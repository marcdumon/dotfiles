#!/usr/bin/env zsh

for i in {0..255}; 
	do print -Pn "%F{$i}$i.... ";  #-Pn : P interpret %F{color} etc iso literal, n surpresses newline
done;
print;
