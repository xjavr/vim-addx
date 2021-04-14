
import re

def h2c(str):


    str = re.sub('\s+','',str)

    matchobj = re.match('[0-9a-fA-F]+',str)
    if matchobj:
        newstr =  matchobj.group(0)
    else:
        return str
    if len(str)==len(newstr):
        newstr = re.sub('([0-9a-fA-F]{2})','0x\g<1>,',newstr)
    else:
        return str
    if newstr[len(newstr)-1]==',':
        newstr = newstr[0:-1]

    #newstr = re.sub('((0x[0-9a-fA-F]{2},){16})','\g<1>\n',newstr)

    return newstr

#mobj = re.search('(([0-9a-fA-F]{2})|(\s+))+',linestr)

mobj = re.search('(([0-9a-fA-F]{2})\s*)+',linestr)
if mobj:
    print(mobj.regs[0][0])
    print(',')
    print(mobj.regs[0][1])
    str1 = linestr[0:mobj.regs[0][0]];
    str2 = linestr[mobj.regs[0][1]:];
    newstr = linestr[mobj.regs[0][0]:mobj.regs[0][1]]
    newstr = h2c(newstr)

    print(str1 + newstr + str2)




