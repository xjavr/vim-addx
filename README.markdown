*addx.txt*  
   	"这里设置给十六进制数加上\x
	"例 "00 01 02 fe 00" 变成 "\x00\x01\x02\xfe\x00" 
	nmap cx :call my#f0x("\\x")<CR>
	"例 "00 01 02 fe 00" 变成 ",0x00,0x01,0x02,0xfe,0x00"
	"暂时这样用，可以做更完美
	nmap c0x :call my#f0x(",0x")<CR>
