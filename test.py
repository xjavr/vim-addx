import re

def c2h(str):

	#ɾ���ո�
    str = re.sub('\s+','',str)

    #ƥ���ǲ���ȫ����ʮ�������ַ�
    matchobj = re.match('[0-9a-fA-F]+',str)
    if matchobj:
        newstr =  matchobj.group(0)
    else:
        return str
    if len(str)==len(newstr):
        #����Ǿ�ȫ���滻
        newstr = re.sub('([0-9a-fA-F]{2})','0x\g<1>,',newstr)
    else:
        return str
    #ɾ������','
    if newstr[len(newstr)-1]==',':
        newstr = newstr[0:-1]

    #16���ֽڻ���
    newstr = re.sub('((0x[0-9a-fA-F]{2},){16})','\g<1>\n',newstr)

    return newstr

linestr = 'send(00 00 00 )'    
mobj = re.search('(([0-9a-fA-F]{2})|(\s+))+',linestr)
if mobj:
    newstr = linestr[mobj.regs[0][0],mobj.regs.[0][1]]
    newstr = c2h(newstr)


