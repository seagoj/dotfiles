status, ret = pcall(loadfile, 'rc.real.lua')
if status == true then
    status, ret = pcall(ret)
end
if status == false then
    loadfile('rc.fallback.lua')()
end
