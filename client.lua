

local displaying = 0


RegisterNetEvent('gnc-3dme:Display')
AddEventHandler('gnc-3dme:Display', function (text,r,g,b,playerSrc)
    local show = true
    Citizen.CreateThread(function()
        Citizen.Wait(Config.wait_time)
        show = false
    end)
    Citizen.CreateThread(function()
        displaying = displaying + 1
        local margin = displaying * 0.20
        while show do
            Citizen.Wait(0)
            local c = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerSrc)))
            DrawText3Ds(c.x, c.y, c.z + margin, text, r, g, b)
        end
        displaying = displaying - 1
        if displaying < 0 then
            displaying = 0
        end
    end)
end)

RegisterNetEvent('gnc-3dme:SendToNearbyChat')
AddEventHandler('gnc-3dme:SendToNearbyChat', function(name,text, status)
    if status == "me" then
        TriggerEvent('chat:addMessage', {
            template ='<div style="background-color:rgba(204, 102, 255, 1.0); padding:10px; margin:5px; display: inline-block; border-radius: 10px;">{0}: {1}</div>',
            color = { 255, 255, 255},
            multiline = false,
            args = {name, text}
        })
    elseif status == "do" then
        TriggerEvent('chat:addMessage', {
            template ='<div style="background-color:rgba(0, 204, 102, 1.0); padding:10px; margin:5px; display: inline-block; border-radius: 10px;">{0}: {1}</div>',
            color = { 255, 255, 255},
            multiline = false,
            args = {name, text}
        })
    elseif status == "zar" then
        TriggerEvent('chat:addMessage', {
            template ='<div style="background-color:rgba(0, 102, 204, 1.0); padding:10px; margin:5px; display: inline-block; border-radius: 10px;">{0}: {1}</div>',
            color = { 255, 255, 255},
            multiline = false,
            args = {name, text}
        })
    end
end) 
function DrawText3Ds(x, y, z, text,r,g,b)
	SetTextScale(0.5, 0.5)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    --local factor = (string.len(text)) / 370
    --DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
