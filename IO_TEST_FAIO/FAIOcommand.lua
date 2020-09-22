require("/FTLE/lib/libAE_FAIO-core");
require("/FTLE/lib/libAE_FAIO-gpio");

print "HTTP/1.1 200 OK";
print "";

  if(arg[1] == nil)then
    print "COMMAND ERROR";
    return;
  end

  t = {}
  s = arg[1];
  for k, v in string.gmatch(s, "(%w+)=(%w+)") do
     t[k] = v
  end

  if(t["op"] == nil or t["CTRL"] == nil or t["DATA"]==nil)then
    print "COMMAND ERROR";
    return;  
  end

  if(t["op"] ~= "190")then
    print "ONLY SUPPORTED op=190";
    return;
  end

--  print(t["op"]);
--  print(t["CTRL"]);
--  print(t["DATA"]);

 ctrl = tonumber(t["CTRL"]);
 data = tonumber(t["DATA"]);
-- print(ctrl);
-- print(data);

 libAE_FAIO_Setup(100);
-- lcdInit();

 setTris(ctrl);
 regWrite(0x01,data);

--  print(s)
 get_data = regRead(0x01);
  
  print(string.format ([[{"STATUS":"OK","CTRL":"0x%02x", "DATA":"0x%02x"}]], ctrl,get_data));
