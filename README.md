qcode-spell
===========
Implemtation of Peter Norvig's spell check. C version by Marcelo Toledo.

Building
========
Requires ```critcl``` to build - available as a Debian package via the testing distribution.

Usage
=====
Install the resulting debian package.
Copy your word list to /usr/share/dict/qcwords
In Tcl do ```package require qcode-spell```
```
::spell speling
spelling
```

When the dictionary cannot be found the proc returns -1
When no canditate words can be found (i.e. seplling is like OK) an empty string is returned.

