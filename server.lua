
RegisterCommand("me", function(source, args)
    local text = table.concat(args," ")
    local playerdata = QBCore.Functions.GetPlayer(source).PlayerData
    local name = playerdata.charinfo.firstname .. " " .. playerdata.charinfo.lastname 
    local players = QBCore.Functions.GetPlayers()
    local ped = GetPlayerPed(source)

    for i = 1, #players , 1 do
        if #(GetEntityCoords(ped) - GetEntityCoords(GetPlayerPed(players[i]))) < Config.distance then
            TriggerClientEvent('gnc-3dme:SendToNearbyChat', players[i], name,text,"me")
            TriggerClientEvent('gnc-3dme:Display',players[i], text , 204, 102, 255,source)
        end      
    end    
end, false)
RegisterCommand("do", function(source, args)
    local text = table.concat(args," ")
    local playerdata = QBCore.Functions.GetPlayer(source).PlayerData
    local name = playerdata.charinfo.firstname .. " " .. playerdata.charinfo.lastname 
    local players = QBCore.Functions.GetPlayers()
    local ped = GetPlayerPed(source)

    for i = 1, #players , 1 do
        if #(GetEntityCoords(ped) - GetEntityCoords(GetPlayerPed(players[i]))) < Config.distance then
            TriggerClientEvent('gnc-3dme:SendToNearbyChat', players[i], name,text,"do")
            TriggerClientEvent('gnc-3dme:Display',players[i], text , 0, 204, 102, source)
        end      
    end       
end, false)

RegisterCommand("zar", function(source)
    local players = QBCore.Functions.GetPlayers()
    local ped = GetPlayerPed(source)
    local playerdata = QBCore.Functions.GetPlayer(source).PlayerData
    local text = "6 yüzlü zarı attı ".. math.random(6) .. " geldi."
    local name = playerdata.charinfo.firstname .. " " .. playerdata.charinfo.lastname 
    for i = 1, #players , 1 do
        if #(GetEntityCoords(ped) - GetEntityCoords(GetPlayerPed(players[i]))) < Config.distance then
            TriggerClientEvent('gnc-3dme:SendToNearbyChat', players[i], name,text,"zar")
            TriggerClientEvent('gnc-3dme:Display',players[i], text ,0, 102, 204,source)
        end      
    end    
end, false)
