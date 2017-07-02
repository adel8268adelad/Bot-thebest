do
local function pre_process(msg)

    local community = 'lock_community:'..msg.to.id
    if not msg.text:match("#") and redis:get(community) and not is_momod(msg) then
            delete_msg(msg.id, ok_cb, true)
           end
    return msg
    end
    
 local function run(msg, matches)
if is_momod(msg) and matches[1] == "lock" and matches[2] == "community" then
 local community = 'lock_community:'..msg.to.id
redis:set(community, true)
return reply_msg(msg.id, "<b>Communtiy</b> <i>mode has been activated !</i>",ok_cb,false)
end
if is_momod(msg) and matches[1] == "unlock" and matches[2] == "community" then
 local community = 'lock_community:'..msg.to.id
   redis:del(community)
    return reply_msg(msg.id, "<b>community</b> <i>mode has been deactivated !</i>",ok_cb,false)
  end
end
return {
    patterns ={
        "^[#!/](lock) (community)$",
        "^[#!/](unlock) (community)$",
    },
run = run,
pre_process = pre_process 
}
end
