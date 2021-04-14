
function! addx#f0x(restr)
python << EOF
import vim
import os
import sys
import re

def h2c(str):

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
        newstr = re.sub('([0-9a-fA-F]{2})','0x\g<1>,',newstr)
    else:
        return str
    #删除最后的','
    if newstr[len(newstr)-1]==',':
        newstr = newstr[0:-1]

    #16个字节换行
    newstr = re.sub('((0x[0-9a-fA-F]{2},){16})','\g<1>\n',newstr)

    return newstr

    
argv=vim.eval("a:restr")
print(argv)
#if argv=='h2c0x':
linestr = vim.current.line
print(linestr)
mobj = re.search('(([0-9a-fA-F]{2})|(\s+))+',linestr)
if mobj:
    newstr = linestr[mobj.regs[0][0]:mobj.regs[0][1]]
    print(newstr)
    newstr = h2c(newstr)
    vim.current.line = newstr
EOF

endfunction

