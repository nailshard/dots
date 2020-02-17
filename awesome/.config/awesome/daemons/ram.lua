local awidget = require("awful.widget")

local function mem_info()
  local mem = { buf = {}, swp = {} }

  local f = io.open("/proc/meminfo")
  for line in f:lines() do
    for k, v in string.gmatch(line, "([%a]+):[%s]+([%d]+).+") do
      if     k == "MemTotal"  then mem.total = math.floor(v/1024)
      elseif k == "MemFree"   then mem.buf.f = math.floor(v/1024)
      elseif k == "MemAvailable" then mem.buf.a = math.floor(v/1024)
      elseif k == "Buffers"   then mem.buf.b = math.floor(v/1024)
      elseif k == "Cached"    then mem.buf.c = math.floor(v/1024)
      elseif k == "SwapTotal" then mem.swp.t = math.floor(v/1024)
      elseif k == "SwapFree"  then mem.swp.f = math.floor(v/1024)
      end
    end
  end
  f:close()

  mem.free  = mem.buf.a
  mem.inuse = mem.total - mem.free
  mem.bcuse = mem.total - mem.buf.f
  mem.usep  = math.floor(mem.inuse / mem.total * 100)
  mem.swp.inuse = mem.swp.t - mem.swp.f
  mem.swp.usep  = math.floor(mem.swp.inuse / mem.swp.t * 100)
  mem.inuse_percent = math.floor((mem.total - mem.free) / (mem.total) * 100 + 0.5 )

  awesome.emit_signal("daemon::ram", mem )
end

awidget.watch('sh -c ":"', 15, function(widget, stdout)
  mem_info()
end)
