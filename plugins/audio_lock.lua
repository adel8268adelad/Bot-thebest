--[[
CODE BY MUSTAFA IP (@HackeD_o) 
SOME FIXED BY MICO (@Malvoo ) 
Shared By Morteza (@SuperDeveloper)
 --]]
do
local function pre_process(msg)
if not is_momod(msg)  then
if msg then
  if mp4 == 'giphy.mp4' then
    hash = 'mustafaip:'..msg.to.id
    if redis:get(hash) then
     delete_msg(msg.id, ok_cb, false)
      end
     else
  if msg.media then
      if msg.media.type == 'document' then
       gifytpe = string.find(mp4, 'gif.mp4') or 'audio'
       hash = 'mustafaip:'..msg.to.id
    if redis:get(hash) then
    delete_msg(msg.id, ok_cb, false)
   end
   end
   end
   end
   end
   end
return msg 
   end
   
    local function run(msg, matches)
    chat_id =  msg.to.id
      local hash = 'mustafaip:'..msg.to.id
    if is_momod(msg) and not redis:get(hash) and matches[1] == 'lockaudio' then
    local hash = 'mustafaip:'..msg.to.id
    redis:set(hash, true)
    return "audio has been locked"
    elseif is_momod(msg) and matches[1] == 'unlockaudio' then
    local hash = 'mustafaip:'..msg.to.id
    redis:del(hash)
    return 'audio has been unlocked'
    elseif is_momod(msg) and redis:get(hash) and matches[1] == 'lockaudio" then
    return "audio already locked"
    end
    end

return {
    patterns = {
        '^[!/](lockaudio)$',
        '^[!/](unlockaudio)$'
    },
    run = run,
    pre_process = pre_process
}
end