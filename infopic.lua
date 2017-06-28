function run(msg,matches , result)
    local user_id = msg.from.id
    local chat_id = get_receiver(msg)
    local token = "توکن یک بات فعال را قرار دهید"
--@sudo_tm
    local db = 'https://api.telegram.org/bot'..token..'/getUserProfilePhotos?user_id='..user_id
      local path = 'https://api.telegram.org/bot'..token..'/getFile?file_id='
      local img = 'https://api.telegram.org/file/bot'..token..'/'
    local res, code = https.request(db)
      local jdat = json:decode(res)
      local fileid = jdat.result.photos[1][3].file_id
    local count = jdat.result.total_count
    if tonumber(count) == 0 then
      send_large_msg(chat_id,"Image Not Found",ok_cb,false)
    else
--@sudo_tm
      local pt, code = https.request(path..fileid)
        local jdat2 = json:decode(pt)
        local path2 = jdat2.result.file_path
    local link = img..path2
    local photo = download_to_file(link,"ax"..user_id..".jpg")
    send_photo2(chat_id, photo, "☯ #Name:\n ⚜"..msg.from.first_name.."\n"
.."🆔 #User :\n ⚜"..msg.from.id.."\n"
.."⚛ #Username\n ⚜@"..msg.from.username.."\n"
.."♓️ #User Group: \n⚜"..msg.to.id.."\n"
.."♒️ #Group Name: \n⚜"..msg.to.title.."\n"
.."♋️ #channel :  \n@SUDO_TM", ok_cb, false)
return 
end
end
return {
patterns = {
"^[!/#](info)$"
},
run = run
}
‌
--@Openplugins
--@sudo_tm