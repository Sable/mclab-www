# Checking broken links for McLab website

## Overview
The scripts are used to automatically detect broken links within http://www.sable.mcgill.ca/mclab.

Note: if the content of a website has been removed but it is still accessible, the link of the webite is considered a valid one (i.e. http://vineetkumar.net/).

## Prerequistes

Additional Python libraries should be installed before you run the main script `checkall.py`.

```
pip install selenium
pip install BeautifulSoup
```

## Usage
```python
python checkall.py
```

Check `broken-links.txt` to see the output of the command line.

## Scripts

- `checkall.py`: the main script
- Libraries:
  - `crawlib`: from crawlib.py
  - `urllib2`


