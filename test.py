import re

def c2h(str):

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

linestr = 'send(00 00 00 )'    
mobj = re.search('(([0-9a-fA-F]{2})|(\s+))+',linestr)
if mobj:
    newstr = linestr[mobj.regs[0][0],mobj.regs.[0][1]]
    newstr = c2h(newstr)


