--[[
もし、この文字が見えている場合、PC上で直接読み書きしてしまっているか、
もしくはW-02をお使いの可能性があります。

PCから読み込んでしまっている場合は、Wi-Fiを経由して改めてアクセスしなおしてください。
W-02をお使いの場合は、手動でCONFIGファイルにIFMODEを追記してください。

CONFIGに関して、詳しくは、

https://flashair-developers.com/ja/

を参照してください。

if you reading this. you may be using W-02. 
Please check it.

]]--

	print "HTTP/1.1 200 OK\nPragma: no-cache\nCache-Control: no-cache\n"

	head = [[
<html><head><meta name="viewport" content="width=device-width,initial-scale=1.0"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FlashAir IO Tester setup</title></head>
<body><p><b>FlashAir IO Tester setup</b></p>]]

	print(head)

	fW = 0
	fU = 0
	fI = 0
	
	print "<pre>CONFIG"

	file = io.open("/SD_WLAN/CONFIG","r")
	cnf = file:read("*a")
	file:close()

	file = io.open("/SD_WLAN/CONFIG_BAK","w")
	file:write(cnf)
	file:close()

	file = io.open("/SD_WLAN/CONFIG","w")

	print "IFMODE=1 ..."

	cnf , n0 = string.gsub (cnf, "IFMODE=1", "IFMODE=1")
	cnf , n1 = string.gsub (cnf, "IFMODE=0", "IFMODE=1")

	print("1>1(既存):"..n0)
	print("0>1:"..n1)
		
	if(n0 + n1 == 0) then
		fI = 1
	end

	--

	file:write(cnf)

	if(fI == 1) then
		file:write("\r\nIFMODE=1")
		print "IFMODEを追加し、IOポートを有効化しました。\nIFMODE added. GPIO is Enabled."
	end

	file:write("\r\n")
	file:close()

	file = io.open("/SD_WLAN/CONFIG","r")
	print("\n\nResult\n" .. file:read("*a"))
	file:close()

	print "完了しました。"
	print "FlashAirを差し込みなおしてください"
	print "Done."
	print "Please replug FlashAir"
	print [[</pre><input type="button" onclick="location.href='IO_TEST.htm'"value="FlashAir IO Tester に戻る [return to FlashAir IO Tester]"><br>]]
