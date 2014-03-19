qcode-spell
===========
Implemtation of Peter Norvig's spell check. C version by Marcelo Toledo.

Usage
=====
Install the resulting debian package.
Copy your word list to /usr/share/dict/qcode_words

```
./qcode-spell speling
spelling
```

When the dictionary cannot be found the proc returns 255
When no candidtate words can be found the original word is returned.

