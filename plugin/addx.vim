
function! addx#f0x(restr)
python << EOF
import vim
import os
import sys
import re

def h2c(str,flag):
       
	#删除空格
    str = re.sub('\s+','',str)

    #匹配是不是全部是十六进制字符
    matchobj = re.match('[0-9a-fA-F]+',str)
    if matchobj:
        newstr =  matchobj.group(0)
    else:
        return str
    if len(str)==len(newstr):
        #如果是就全部替换
        if flag=='0x':
            newstr = re.sub('([0-9a-fA-F]{2})','0x\g<1>,',newstr)
        else:
            newstr = re.sub('([0-9a-fA-F]{2})','\\x\g<1>',newstr)
            newstr = "\"" + newstr + "\"";
    else:
        return str
    #删除最后的','
    if newstr[len(newstr)-1]==',':
        newstr = newstr[0:-1]

    #16个字节换行
    #newstr = re.sub('((0x[0-9a-fA-F]{2},){16})','\g<1>\n',newstr)

    return newstr

def add0x(linestr,flagstr):
    #linestr = vim.current.line
    mobj = re.search('(([0-9a-fA-F]{2})\s*)+',linestr)
    if mobj:
        newstr = linestr[mobj.regs[0][0]:mobj.regs[0][1]]
        if len(newstr)>3:
            str1 = linestr[0:mobj.regs[0][0]];
            str2 = linestr[mobj.regs[0][1]:];
            newstr = h2c(newstr,flagstr)
            return str1 + newstr + str2
    return linestr

argv=vim.eval("a:restr")
if argv=='h2c0x':
    lstr = vim.current.line
    cursor = vim.current.window.cursor
    strs = lstr[0:cursor[1]]
    stre = lstr[cursor[1]:]
    stre = add0x(stre,'0x')
    vim.current.line = strs + stre
if argv=='h2c\\x':
    lstr = vim.current.line
    cursor = vim.current.window.cursor
    strs = lstr[0:cursor[1]]
    stre = lstr[cursor[1]:]
    stre = add0x(stre,'\\x')
    vim.current.line = strs + stre
if argv=='c2h':
    pass
EOF

endfunction

