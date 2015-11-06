# Checking broken links for McLab website

## Overview
The scripts are used to automatically detect broken links within http://www.sable.mcgill.ca/mclab.

Note: if the content of a website has been removed but it is still accessible, the link of the webite is considered a valid one (i.e. http://vineetkumar.net/).

## Usage
```python
python checkall
```

Check `broken-links.txt` to see the output of the command line.

## Scripts

- `checkall.py`: the main script
- Libraries:
  - `crawlib`: from crawlib.py
  - `urllib2`


