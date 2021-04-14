
# 1.set _vimrc
> + "00 01 02 fe 00" -> "\x00\x01\x02\xfe\x00"   
	nmap cx :call addx#f0x("h2c\\x")<CR>  
	
> + "00 01 02 fe 00" -> "0x00,0x01,0x02,0xfe,0x00"  
	nmap c0x :call addx#f0x("h2c0x")<CR>  
	
