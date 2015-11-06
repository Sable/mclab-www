# Usage:
#  import crawlib as lib
#  lib.getHtml('http://www.google.com')
# Default:
#  typ='.txt' (IO operations)
# Updated:
#  2014.11.07, 14 

import os
import sys
import json
import urllib2
import time # for time.sleep
from selenium import webdriver
from datetime import date
from BeautifulSoup import BeautifulSoup


def safeContinue():
	print "only 'yes' can continue (no quotes)"
	text = raw_input()
	if text != 'yes':
		sys.exit('**stop**')

def cleantags(html):
	soup = BeautifulSoup(html)
	return soup.getText(separator=u' ')#(soup.text)

# convert from utf-8 to ASCII
def conv(text):
	try: uni_text = text.decode('utf-8')
	except UnicodeDecodeError:
		return ''
	return uni_text.encode('ascii','replace')

# Get links from one page
# Example:
#  Input: <a href="key0 ..."></a>
#  Output:[key0 ...]
def getLinks(url, key0):
	html = getHtml(url)
	off = 0
	res = []
	key = 'href="' + key0
	while True:
		sta = html.find(key,off)
		if sta < 0: break
		off = sta + len(key)
		end = html.find('"',off)
		res.append(html[(sta+6):end])
	return res

# Read html content from a link
def getHtml(url):
	try: response = urllib2.urlopen(url)
	except urllib2.HTTPError as e:
		print e.reason
		return '' #need return?
	html = response.read()
	response.close()
	return conv(html)

# For these *.html.txt file (segements)
def getEach(filename):
	text = readText(filename)
	each = getPage(text,'[]:')
	print 'get Each ',len(each)
	return each

def getPage(text, key):
	off = len(key)
	sta = 0
	each = []
	while True:
		end = text.find(key,off)
		if end < 0 : break
		each.append(text[sta:end])
		sta = end
		off = sta + len(key)
	each.append(text[sta:])
	return each
	
# show the list of files in directories
def dirFile(dir='./', ext='txt'):
	alls = os.listdir(dir)
	res = []
	for file in alls:
		path = os.path.join(dir,file) # join
		if os.path.isfile(path) and '.' in file: # isdir
			if ext == file.split('.')[-1]: # ext
				res.append(file)
	return res
	
# op == 'lno'
#  display line number
def printv(vec, op=0):
	if op == 0:
		for v in vec: print v
	elif op == 1:
		if len(vec) == 1: print vec[0]
		elif len(vec) > 0:
			print vec[0],
			for v in vec[1:]: print ',',v,
			print ''
	elif op == 'lno':
		for c,v in enumerate(vec):
			print ('['+str(c)+']'),v
	return
	
def printR(res, nm):
	val = nm + '<- c('; c = 0
	if len(res) > 0: val += str(res[0]); c += 1
	for x in res[1:]:
		val += ','+str(x); c += 1
		if c == 20: val += '\n\t'; c = 0
	val += ')\n'
	return val

def readText(filename,typ='.txt'):
	return trim(open(filename+typ,'r').read())

def readLines(filename,typ='.txt'):
	return [trim(x) for x in open(filename+typ,'r').readlines()]

def trim(text):
	return text.strip(' \r\n')

# Default filename.txt file
def writeText(text,filename,typ='.txt'):
	open(filename+typ,'w').write(text)

# Including list, verctor, array
# writeArray --> writeLines
def writeLines(items,filename,typ='.txt'):
	f = open(filename+typ,'w')
	for item in items:
		f.write(str(item)+'\n')
	f.close()
	
# default format: *.txt
# given files
def mergeFiles(files,dest,typ='.txt'):
	f = open(dest+typ,'w')
	for one in files:
		f.write(readText(one))
	f.close()
	
def grep(fname,key,typ='.txt'):
	f = open(fname+typ,'r')
	c = 0
	for one in f:
		if key in one: print one;c+=1
	f.close()
	print 'grep finds',c,'lines'
	
# convert commit date line into time span (date)
# e.g. 'Date:   Mon Mar 4 16:46:15 2013 +0800'
#   ==> 20130304
def convDate(line):
	months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
	tm = line[5:len(line)].strip().split(' ') #example: ['Tue', 'Oct', '21', '14:26:57', '2014', '+0200']
	yy = int(tm[4]) #year
	mm = 1 + months.index(tm[1]) #month
	dd = int(tm[2]) #day
	#today= str(yy)+'.'+str(mm)+'.'+str(dd)
	today= yy*10000 + mm*100 + dd
	return today
	
# Read Git Commit
def readGitCommit(fn, typ='.txt'):
	res = []; txt = []; c = 0
	content = readLines(fn,typ)
	for line in content:
		if len(line) > 6 and line[0:6] == 'commit':
			if c > 0: res.append(txt)
			txt = [line]
		else:
			txt.append(line)
		c += 1
	if len(txt) > 0:
		res.append(txt) #last commit
	return res
	
# usually, date is on third line (3rd)
# sometimes, in different line
def readGitCommitDate(commit):
	if 'Date:' in commit[2]:
		return convDate(commit[2]) #Date is contained in third line
	for line in commit:
		if 'Date:' in line:
			return convDate(line)
	return -1
	
# usually, date is on second line (2nd)
# sometimes, in different line
def readGitCommitAuthor(commit):
	if 'Author:' in commit[1]:
		return trim(commit[1].split(':')[-1])
	for line in commit:
		if 'Author:' in line:
			return trim(line.split(':')[-1])
	return -1
	
# return string (other than a list)
def readGitCommitMsg(commit):
	res = ''; flag = False
	for line in commit:
		if len(line) == 0: continue
		if len(line) > 5 and 'Date:' == line[:5]:
			flag = True
		elif 'diff' == line[:4]:
			flag = False
			break
		elif flag:
			res += line
	return res
	
# get time gap
def getGap(a, b):
	da = date(a/10000,a%10000/100,a%100)
	db = date(b/10000,b%10000/100,b%100)
	return (da-db).days
	
def rprint(vec):
	tmp = '%s' % vec
	return ('c(' + tmp[1:len(tmp)-1] + ')')
	
def safeDiv(val, tot):
	if tot == 0: res = 0
	else: res = val*1.0/tot
	return res
	
# argument
def argv():
	return sys.argv
	
# save webpages as images
# input: str, str
#         or
#        vec, vec
# example: C:\Users\wai-mee\Desktop\del\201502\pyws\link.py
def savePageImage(url, fn):
	browser = webdriver.Firefox() # select browser
	browser.set_window_size(1600, 900)
	if type(url) == str and type(fn) == str:
		savePageImage1(browser, url, fn)
	elif len(url) != len(fn):
		print 'the length of url and fn are not same'
	else:
		for c,u in enumerate(url):
			savePageImage1(browser, u, fn[c])
	# browser.implicitly_wait(20) #
	browser.quit()
	print 'browser is closed.'
	
# default: delay for 1 second
def savePageImage1(drive, url, fn):
	drive.get(url)
	time.sleep(1) #delay for 1 second
	if drive.save_screenshot(fn):
		print fn,'is saved'

# ------------------------------------
# JSON files
# Input : two json files in text files (txt)
# Output: different keys in level-1 ( major keys )
# ------------------------------------
def jsonRead(filename,typ='.txt'):
	x = readText(filename, typ)
	return json.loads(x)

def jsonCmp(fn1,fn2,typ='.txt'):
	allkey1 = jsonDfs(jsonRead(fn1, typ))
	allkey2 = jsonDfs(jsonRead(fn2, typ)) #get level-1 (major) keys
	temp1 = jsonFind(allkey1, allkey2)
	temp2 = jsonFind(allkey2, allkey1) # find different keys
	s = set()
	for item in temp1: s.add(item)
	for item in temp2: s.add(item)
	printSet(s,2)
	return s
	
def jsonDfs(val):
	res = []
	if type(val) is dict:
		for majorkey, subdict in val.iteritems():
			res.append(majorkey) # major keys
			if type(subdict) is dict:
				#print majorkey, '***'
				res.append(jsonDfs(subdict))
			elif type(subdict) is list:
				#print majorkey, '***---'
				for subsubdict in subdict:
					res.append(jsonDfs(subsubdict))
			#else:
				#print majorkey, subdict
	elif type(val) is list:
		for subitem in val:
			res.append(jsonDfs(subitem))
	return res
	
def jsonFind(vx, vy):
	res = []; c = 0
	for v in vx:
		c += 1
		if type(v) is list: continue
		if not v in vy:
			res.append(v)
		else:
			indx = 1 + vy.index(v) #find index
			if c != len(vx) and indx != len(vy):
				if type(vx[c]) == type(vy[indx]):
					if type(vx[c]) is list and vx[c] != vy[indx]: #see next region (list required)
						res.append(v)
				else: res.append(v)
	return res
	
def printSet(s,f=0):
	cnt = 0
	for item in s:
		if f == 1: print('.%s'%item) #python
		elif f == 2: print('-> %s'%item) #php
		elif f == 3: print("'%s'"%item) #
		elif f == 4: print('[%2d] %s'%(cnt,item))
		else: print item
		cnt += 1

# ------------------------------------
# XML and HTML
# Tool: BeautifulSoup
# Docs: http://www.crummy.com/software/BeautifulSoup/bs4/doc/
# ------------------------------------




