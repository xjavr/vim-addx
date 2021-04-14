
function! addx#f0x(restr)
python << EOF
import vim
import os
import sys
import re

def mode1(line,astr):
    spos=0
    epos=0
    err=0
    sline=line

    m=re.search('\([a-fA-F0-9]{2} ', sline)
    if m:
        spos=m.end()-3
    else:
        return None
    
    m=re.search(' [a-fA-F0-9]{2}\)', sline)
    if m:
        epos=m.end()-1
    else:
        return None    
    
    mline=line[spos:epos]
    sline=line[0:spos]
    eline=line[epos:]
    tline=''
    while 1:
        m=re.search('[a-fA-F0-9]{2}', mline)
        if m:
            tline+=astr+m.group(0)
            mline=mline[m.end():]
        else:
            break
        
    aline=sline+'"'+tline+'"'+eline
    return aline

def mode2(line,astr):
    spos=0
    epos=0
    err=0
    sline=line

    m=re.search('\"[a-fA-F0-9]{2} ', sline)
    if m:
        spos=m.end()-3
    else:
        return None
    
    m=re.search(' [a-fA-F0-9]{2}\"', sline)
    if m:
        epos=m.end()-1
    else:
        return None    
    
    mline=line[spos:epos]
    sline=line[0:spos]
    eline=line[epos:]
    tline=''
    while 1:
        m=re.search('[a-fA-F0-9]{2}', mline)
        if m:
            tline+=astr+m.group(0)
            mline=mline[m.end():]
        else:
            break
        
    aline=sline+tline+eline
    return aline

def test(line,astr):
    sline=line
    if sline==None:
        return None
    sline=mode1(sline,astr)
    if sline==None:
        sline=mode2(line,astr)
    
    print sline
    return sline

astr=vim.eval("a:restr")
line=vim.current.line
line=test(line,astr)
if line:
    vim.current.line=line
EOF
endfunction

