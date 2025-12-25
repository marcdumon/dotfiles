#!/bin/bash

current=$(kreadconfig5 --group KDE --key LookAndFeelPackage)

light="org.kde.breeze.desktop"
dark="org.kde.breezedark.desktop"

if [[ "$current" == "$dark" ]]; then
    next="$light"
else
    next="$dark"
fi

lookandfeeltool --apply "$next"
