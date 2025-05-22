package.cpath = package.cpath .. ";/usr/lib64/libiuplua54.so"
require("iuplua")

function Counter ()
  local counter = 0

  local function addCount()
    counter = counter + 1
  end

  local function getCount()
    return counter
  end

  --********************************** Main *****************************************

  local txt_count = iup.text{value = getCount(), readonly = "YES",  size = "60"}
  local btn_count = iup.button{title = "Count", size = "60"}

  local dlg = iup.dialog{iup.hbox{txt_count, btn_count; ngap = "10"}, title = "Counter", margin = "10x10"}

  function btn_count:action()
    addCount()
    txt_count.value = getCount()
  end

  dlg:showxy( iup.CENTER, iup.CENTER )
end

Counter()
Counter()

if (iup.MainLoopLevel()==0) then
  iup.MainLoop()
end
