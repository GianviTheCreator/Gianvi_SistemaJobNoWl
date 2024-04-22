ESX = exports.es_extended:getSharedObject()

local Minatore = false
local Agricoltore = false
local Boscaiolo = false
local pos = GetEntityCoords(PlayerPedId())

function Notifica(notificationId)
    local message = notificationId
    local event = GIANVI.notifica_custom
    if GIANVI.usa_esx_notifica then
        TriggerEvent("esx:showNotification", message)
    elseif GIANVI.usa_notifica_custom then
        TriggerEvent(event, message)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Attendi 1 secondo prima di eseguire il controllo successivo
        if Minatore == true then
            if not DoesBlipExist(BlipRaccoltaMinatore) then
                BlipRaccoltaMinatore = AddBlipForCoord(GIANVI.MINATORE["Raccolta"]["BLIP"].posx, GIANVI.MINATORE["Raccolta"]["BLIP"].posy, GIANVI.MINATORE["Raccolta"]["BLIP"].posz)
                SetBlipSprite(BlipRaccoltaMinatore, GIANVI.MINATORE["Raccolta"]["BLIP"].modelloblip)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(GIANVI.MINATORE["Raccolta"]["BLIP"].nomeblip)
                EndTextCommandSetBlipName(BlipRaccoltaMinatore)
            end
            if not DoesBlipExist(BlipProcessoMinatore) then
                BlipProcessoMinatore = AddBlipForCoord(GIANVI.MINATORE["Processo"]["BLIP"].posx,GIANVI.MINATORE["Processo"]["BLIP"].posy,GIANVI.MINATORE["Processo"]["BLIP"].posz)
                SetBlipSprite(BlipProcessoMinatore, GIANVI.MINATORE["Processo"]["BLIP"].modelloblip)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(GIANVI.MINATORE["Processo"]["BLIP"].nomeblip)
                EndTextCommandSetBlipName(BlipProcessoMinatore)
            end
        else
            if DoesBlipExist(BlipRaccoltaMinatore) then
                RemoveBlip(BlipRaccoltaMinatore)
            end
            if DoesBlipExist(BlipProcessoMinatore) then
                RemoveBlip(BlipProcessoMinatore)
            end
        end

        if Agricoltore == true then
            if not DoesBlipExist(Blip) and not DoesBlipExist(Centro) and not DoesBlipExist(BlipProcessotabacco) then
                Blip = AddBlipForRadius(GIANVI.TABACCO["Raccolta"]["BLIP"].posx, GIANVI.TABACCO["Raccolta"]["BLIP"].posy, GIANVI.TABACCO["Raccolta"]["BLIP"].posz, GIANVI.TABACCO["Raccolta"]["BLIP"].raggio)
                SetBlipHighDetail(Blip, true)
                SetBlipColour(blip, GIANVI.TABACCO["Raccolta"]["BLIPCIRCOLARE"].colore)  -- Colore del blip (puoi cambiare il numero)
                SetBlipAlpha(blip, GIANVI.TABACCO["Raccolta"]["BLIPCIRCOLARE"].trasparenza) -- Trasparenza del blip (puoi cambiare il numero)
                SetBlipAsShortRange(Blip, false)

                Centro = AddBlipForCoord(GIANVI.TABACCO["Raccolta"]["BLIP"].posx, GIANVI.TABACCO["Raccolta"]["BLIP"].posy, GIANVI.TABACCO["Raccolta"]["BLIP"].posz)
                SetBlipSprite(Centro, GIANVI.TABACCO["Raccolta"]["BLIP"].modelloblip)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(GIANVI.TABACCO["Raccolta"]["BLIP"].nomeblip)
                EndTextCommandSetBlipName(Centro)

                BlipProcessotabacco = AddBlipForCoord(GIANVI.TABACCO["Processo"]["BLIP"].posx, GIANVI.TABACCO["Processo"]["BLIP"].posy,GIANVI.TABACCO["Processo"]["BLIP"].posz)
                SetBlipSprite(BlipProcessotabacco, GIANVI.TABACCO["Processo"]["BLIP"].modelloblip)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(GIANVI.TABACCO["Processo"]["BLIP"].nomeblip)
                EndTextCommandSetBlipName(BlipProcessotabacco)
            end
        else
            if DoesBlipExist(Blip) then
                RemoveBlip(Blip)
            end
            if DoesBlipExist(Centro) then
                RemoveBlip(Centro)
            end
            if DoesBlipExist(BlipProcessotabacco) then
                RemoveBlip(BlipProcessotabacco)
            end
        end

        if Boscaiolo == true then
            if not DoesBlipExist(BlipRaccoltaFalegname)  and not DoesBlipExist(BlipProcessofalegname)  then
                BlipRaccoltaFalegname = AddBlipForCoord(GIANVI.FALEGNAME["RACCOLTA"]["BLIP"].posx,GIANVI.FALEGNAME["RACCOLTA"]["BLIP"].posy,GIANVI.FALEGNAME["RACCOLTA"]["BLIP"].posz)
                SetBlipSprite(BlipRaccoltaFalegname, GIANVI.FALEGNAME["RACCOLTA"]["BLIP"].modelloblip)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(GIANVI.FALEGNAME["RACCOLTA"]["BLIP"].nomeblip)
                EndTextCommandSetBlipName(BlipRaccoltaFalegname)

                BlipProcessofalegname = AddBlipForCoord(GIANVI.FALEGNAME["PROCESSO"]["BLIP"].posx,GIANVI.FALEGNAME["PROCESSO"]["BLIP"].posy,GIANVI.FALEGNAME["PROCESSO"]["BLIP"].posz)
                SetBlipSprite(BlipProcessofalegname, 286)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Processo Falegname")
                EndTextCommandSetBlipName(BlipProcessofalegname)
            end
        else
            if DoesBlipExist(BlipRaccoltaFalegname) then
                RemoveBlip(BlipRaccoltaFalegname)
            end

            if DoesBlipExist(BlipProcessofalegname) then
                RemoveBlip(BlipProcessofalegname)
            end
        end
    end
end)

Citizen.CreateThread(function ()

    if not blipCreated then
        BlipCentroLavori = AddBlipForCoord(GIANVI.CENTROLAVORI.blip.posx, GIANVI.CENTROLAVORI.blip.posy, GIANVI.CENTROLAVORI.blip.posz)
        SetBlipSprite(BlipCentroLavori, GIANVI.CENTROLAVORI.blip.modelloblip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(GIANVI.CENTROLAVORI.blip.nomeblip)
        EndTextCommandSetBlipName(BlipCentroLavori)


        blipCreated = true
    end

    while not npcCreated do
        if not HasModelLoaded(GIANVI.PED.modelloped) then
            RequestModel(GIANVI.PED.modelloped)
            while not HasModelLoaded(GIANVI.PED.modelloped) do
                Citizen.Wait(5)
            end
        end
    
        NpcCentroLavori = CreatePed(4, GIANVI.PED.modelloped, GIANVI.PED.posx, GIANVI.PED.posy, GIANVI.PED.posz, GIANVI.PED.heading, false, true)
        FreezeEntityPosition(NpcCentroLavori, true)
        SetEntityInvincible(NpcCentroLavori, true)
        SetBlockingOfNonTemporaryEvents(NpcCentroLavori, true)

        npcCreated = true
    end
end)

exports.ox_target:addBoxZone({
    coords = vec3(913.83, -1273.37, 27.089),
    size = vec3(1, 1, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'Parla per iniziare a lavorare',
            event = 'ScegliLavoro',
            icon = 'fa fa-angles-right',
            label = 'Parla per iniziare a lavorare',
        },
    }
})

RegisterNetEvent('ScegliLavoro')
AddEventHandler('ScegliLavoro', function ()
    lib.showContext('LavoroNoWl')
end)

lib.registerContext({
    id = 'LavoroNoWl',
    title = 'Centro Lavoro',
    options = {
        {
            title = 'Acquista Furgone',
            description = 'Acquista il furgone per iniziare a lavorare',
            icon = 'car',
            disabled = false,
            onSelect = function()
                local playerData = ESX.GetPlayerData()
                local hasEnoughMoney = false
                for i, item in pairs(playerData.inventory) do
                    if item.name == 'money' and item.count >= GIANVI.FURGONE.CostoDelFurgone then
                        hasEnoughMoney = true
                        break
                    end
                end
                if hasEnoughMoney then
                    local vehicleHash = GetHashKey(GIANVI.FURGONE.Furgone.modello)
                    RequestModel(vehicleHash)
                    while not HasModelLoaded(vehicleHash) do
                        Wait(500)
                    end
                    local vehicle = CreateVehicle(vehicleHash, GIANVI.FURGONE.Furgone.posx, GIANVI.FURGONE.Furgone.posy, GIANVI.FURGONE.Furgone.posz, GIANVI.FURGONE.Furgone.heading, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    TriggerServerEvent('AcquistoFurgone')
                else
                    Notifica(GIANVI.NOTIFICHE["1"])
                end
            end
        },
        {
            title = 'Minatore',
            description = 'Scegli di lavorare come minatore',
            icon = 'diamond',
            disabled = false,
            onSelect = function()
                TriggerEvent('OpzioniMinatore')
            end
        },
        {
            title = 'Agricoltore',
            description = 'Scegli di lavorare come agricoltore',
            icon = 'seedling',
            disabled = false,
            onSelect = function()
                TriggerEvent('OpzioniAgricoltore')
            end
        },  
        {
            title = 'Boscaiolo',
            description = 'Scegli di lavorare come boscaiolo',
            icon = 'hammer',
            disabled = false,
            onSelect = function()
                TriggerEvent('OpzioniBoscaiolo')
            end
        },
        {
            title = 'Vendi',
            description = 'Vendi cio che hai lavorato',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
                TriggerServerEvent('Vendita_item')
            end
        }
    }
})

RegisterNetEvent('OpzioniAgricoltore')
AddEventHandler('OpzioniAgricoltore',function ()
    lib.showContext('AgricoltoreOpzioni')
end)

RegisterNetEvent('OpzioniMinatore')
AddEventHandler('OpzioniMinatore',function ()
    lib.showContext('MinatoreOpzioni')
end)


RegisterNetEvent('OpzioniBoscaiolo')
AddEventHandler('OpzioniBoscaiolo',function ()
    lib.showContext('BoscaioloOpzioni')
end)

lib.registerContext({
    id = 'MinatoreOpzioni',
    title = 'Opzioni del lavoro minatore',
    options = {
        {
            title = 'Inizia a lavorare',
            description = 'Inizia a lavorare come minatore',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
                Minatore = true
            end
        },
        {
            title = 'Finisci di lavorare',
            description = 'FInisci di lavorare come minatore',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
                Minatore = false
            end
        }
    }
})

lib.registerContext({
    id = 'AgricoltoreOpzioni',
    title = 'Opzioni del lavoro agricoltore',
    options = {
        {
            title = 'Inizia a lavorare',
            description = 'Inizia a lavorare come agricoltore',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
               Agricoltore = true
            end
        },
        {
            title = 'Finisci di lavorare',
            description = 'FInisci di lavorare come agricoltore',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
               Agricoltore = false
            end
        }
    }
})

lib.registerContext({
    id = 'BoscaioloOpzioni',
    title = 'Opzioni del lavoro boscaiolo',
    options = {
        {
            title = 'Inizia a lavorare',
            description = 'Inizia a lavorare come boscaiolo',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
               Boscaiolo = true
            end
        },
        {
            title = 'Finisci di lavorare',
            description = 'FInisci di lavorare come boscaiolo',
            icon = 'cart-shopping',
            disabled = false,
            onSelect = function()
                Boscaiolo = false
            end
        }
    }
})



Citizen.CreateThread(function()
        for gnv, gianvi in pairs(GIANVI.MINATORE["Raccolta"].RaccoltaMinatore) do
            TriggerEvent('gridsystem:registerMarker', {
                name = 'raccoltaminatore'..gianvi.x,
                pos = vector3(gianvi.x, gianvi.y, gianvi.z),
                size = GIANVI.MARKER.dimensione,
                scale = GIANVI.MARKER.scala,
                color = GIANVI.MARKER.colore,
                drawDistance = 4.0,
                msg = 'Premi ~INPUT_CONTEXT~ per raccogliere a roccia',
                control = 'E',
                type = GIANVI.MARKER.tipo,
                texture = GIANVI.MARKER.texture,
                action = function()
                    if Minatore == true then
                        exports.rprogress:Custom({
                            Async = true,
                            canCancel = GIANVI.RPROGRESS.cancellabile,
                            cancelKey = GIANVI.RPROGRESS.tastopercancellare,
                            Duration = GIANVI.RPROGRESS.durata,--20
                            ShowTimer = true,
                            Label = 'Stai Raccogliendo',
                            LabelPosition = "right",
                            Color = GIANVI.RPROGRESS.colore,
                            BGColor = GIANVI.RPROGRESS.colorebg,
                            DisableControls = {
                                Mouse = false,
                                Player = true,
                                Vehicle = true
                            },
                        })
                        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_HAMMERING", 0, true)
                        Citizen.Wait(10000)
                        ClearPedTasksImmediately(PlayerPedId())
                        TriggerServerEvent('Minatore_Raccolta')
                        local hammer = GetClosestObjectOfType(gianvi.x, gianvi.y, gianvi.z, 5.0, GetHashKey('prop_tool_hammer'), false, true ,true)
                        if DoesEntityExist(hammer) then
                            SetEntityAsMissionEntity(hammer, false, false)
                            DeleteObject(hammer)
                        end
                    else 
                        Notifica(GIANVI.NOTIFICHE["2"])
                    end
                end,
            })
        end
end)



local isRaccogliendo = false
local lastInteractionTime = 0 -- Variabile per tenere traccia del tempo dell'ultima interazione
local interactionCooldown = 10000 -- Tempo di attesa in millisecondi tra un'interazione e l'altra (3 secondi)

Citizen.CreateThread(function()

    for gnv, gianvi in pairs(GIANVI.MINATORE["Processo"].ProcessoMinatore) do
     if Minatore == true then
        BlipProcessoMinatore = AddBlipForCoord(1109.8496, -2008.1312, 31.0566)
        SetBlipSprite(BlipProcessoMinatore, 532)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Processo Minatore")
        EndTextCommandSetBlipName(BlipProcessoMinatore)
     end

        TriggerEvent('gridsystem:registerMarker', {
            name = 'processominatore'..gianvi.x,
            pos = vector3(gianvi.x, gianvi.y, gianvi.z),
            size = GIANVI.MARKER.dimensione,
            scale = GIANVI.MARKER.scala,
            color =  GIANVI.MARKER.colore,
            drawDistance = 4.0,
            msg = 'Premi ~INPUT_CONTEXT~ per raccogliere del tabacco',
            control = 'E',
            type = GIANVI.MARKER.tipo,
            texture = GIANVI.MARKER.texture,
            action = function()
                local currentTime = GetGameTimer() -- Ottieni il tempo corrente
                if IsPedInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('krs_notifica:manda', '<b><span style="color: #ffffff;">BLACK-SIDE NOTIFICA</span></b> </br>non puoi raccogliere') 
                elseif Minatore then
                    if not isRaccogliendo and (currentTime - lastInteractionTime) > interactionCooldown then
                        isRaccogliendo = true
                        lastInteractionTime = currentTime -- Aggiorna il tempo dell'ultima interazione
                        exports.rprogress:Custom({
                            Async = true,
                            canCancel = GIANVI.RPROGRESS.cancellabile,
                            cancelKey = GIANVI.RPROGRESS.tastopercancellare,
                            Duration = GIANVI.RPROGRESS.durata,--20
                            ShowTimer = true,
                            Label = 'Stai Lavorando la roccia',
                            LabelPosition = "right",
                            Color = GIANVI.RPROGRESS.colore,
                            BGColor = GIANVI.RPROGRESS.colorebg,
                        })

                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        Citizen.Wait(10000)
                        TriggerServerEvent('Minatore_Processo')
                        isRaccogliendo = false
                    end
                else
                    Notifica(GIANVI.NOTIFICHE["2"])
                end
            end,
        })
    end
end)
----------------------------------------------------------------------------------------------
-- Variabile di stato per controllare se il giocatore è all'interno dell'area
local isInArea = false

-- Funzione per generare casualmente le coordinate all'interno dell'area del cerchio
function getRandomCoordinates()
    local angle = math.rad(math.random(0, 360))
    local distance = math.random() * GIANVI.TABACCO["Raccolta"]["BLIP"].raggio
    local x = GIANVI.TABACCO["Raccolta"]["BLIP"].posx + distance * math.cos(angle)
    local y = GIANVI.TABACCO["Raccolta"]["BLIP"].posy + distance * math.sin(angle)
    return vector3(x, y, GIANVI.TABACCO["Raccolta"]["BLIP"].posz)
end

-- Aggiungi un blip circolare alla mappa
local blip


-- Spawnare la marijuana all'interno dell'area del cerchio
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)  -- Verifica ogni secondo, puoi cambiare il tempo di attesa se necessario
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - vector3(GIANVI.TABACCO["Raccolta"]["BLIP"].posx, GIANVI.TABACCO["Raccolta"]["BLIP"].posy, GIANVI.TABACCO["Raccolta"]["BLIP"].posz))
        if distance <= GIANVI.TABACCO["Raccolta"]["BLIP"].raggio then
            if not isInArea then
                isInArea = true
            end
            local marijuanaCoords = getRandomCoordinates()
            local propHash = GetHashKey(GIANVI.TABACCO["Raccolta"].modellopianta)
            RequestModel(propHash)
            while not HasModelLoaded(propHash) do
                Citizen.Wait(10)
            end
            local prop = CreateObject(propHash, marijuanaCoords.x, marijuanaCoords.y, marijuanaCoords.z, true, true, true)
            SetEntityHeading(prop, math.random(0, 360))  -- Imposta un'orientazione casuale per il modello di prop
            PlaceObjectOnGroundProperly(prop)
            Citizen.Wait(10000) -- Tempo di attesa tra uno spawn e l'altro (15 secondi)
        else
            if isInArea then
                isInArea = false
                ESX.Game.DeleteObject(blip)  -- Rimuovi il blip quando il giocatore esce
                local props = ESX.Game.GetObjects()
                for _, prop in ipairs(props) do
                    DeleteEntity(prop)  -- Rimuovi tutti i props quando il giocatore esce
                end
            end
        end
    end
end)


local models = -765237524
local options = {
    {
        name = 'daitabacco',
        icon = 'fa fa-angles-right',
        label = 'Raccogli la pianta',
        onSelect = function(data)
        local currentTime = GetGameTimer() -- Ottieni il tempo corrente
                if IsPedInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('krs_notifica:manda', '<b><span style="color: #ffffff;">BLACK-SIDE NOTIFICA</span></b> </br>non puoi raccogliere') 
                elseif Agricoltore then
                    if not isRaccogliendo and (currentTime - lastInteractionTime) > interactionCooldown then
                        isRaccogliendo = true
                        lastInteractionTime = currentTime -- Aggiorna il tempo dell'ultima interazione
                        exports.rprogress:Custom({
                            Async = true,
                            canCancel = GIANVI.RPROGRESS.cancellabile,
                            cancelKey = GIANVI.RPROGRESS.tastopercancellare,
                            Duration = GIANVI.RPROGRESS.durata,--20
                            ShowTimer = true,
                            Label = 'Stai Raccogliendo del tabacco',
                            LabelPosition = "right",
                            Color = GIANVI.RPROGRESS.colore,
                            BGColor = GIANVI.RPROGRESS.colorebg,
                        })

                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        Citizen.Wait(10000)
                        TriggerServerEvent('Raccolta_Tabacco')
                        isRaccogliendo = false
                        SetEntityAsMissionEntity(data.entity, true, true)
                        DeleteEntity(data.entity)
                    end
                else
                    Notifica(GIANVI.NOTIFICHE["2"])
                end
            end
        
    }
}

exports.ox_target:addModel(models, options)

Citizen.CreateThread(function()
    
    for gnv, gianvi in pairs(GIANVI.TABACCO["Processo"].ProcessoTabacco) do



        TriggerEvent('gridsystem:registerMarker', {
            name = 'processotabacco'..gianvi.x,
            pos = vector3(gianvi.x, gianvi.y, gianvi.z),
            size = GIANVI.MARKER.dimensione,
            scale = GIANVI.MARKER.scala,
            color =  GIANVI.MARKER.colore,
            drawDistance = 4.0,
            msg = 'Premi ~INPUT_CONTEXT~ per processare del tabacco',
            control = 'E',
            type = GIANVI.MARKER.tipo,
            texture = GIANVI.MARKER.texture,
            action = function()
                local currentTime = GetGameTimer() -- Ottieni il tempo corrente
                if IsPedInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('krs_notifica:manda', '<b><span style="color: #ffffff;">BLACK-SIDE NOTIFICA</span></b> </br>non puoi raccogliere') 
                elseif Agricoltore then
                    if not isRaccogliendo and (currentTime - lastInteractionTime) > interactionCooldown then
                        isRaccogliendo = true
                        lastInteractionTime = currentTime -- Aggiorna il tempo dell'ultima interazione
                        exports.rprogress:Custom({
                            Async = true,
                            canCancel = GIANVI.RPROGRESS.cancellabile,
                            cancelKey = GIANVI.RPROGRESS.tastopercancellare,
                            Duration = GIANVI.RPROGRESS.durata,--20
                            ShowTimer = true,
                            Label = 'Stai processando del tabacco',
                            LabelPosition = "right",
                            Color = GIANVI.RPROGRESS.colore,
                            BGColor = GIANVI.RPROGRESS.colorebg,
                        })

                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        Citizen.Wait(10000)
                        TriggerServerEvent('Processo_tabacco')
                        isRaccogliendo = false
                    end
                else
                    Notifica(GIANVI.NOTIFICHE["2"])
                end
            end,
        })
    end
end)

------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()
    for gnv, gianvi in pairs(GIANVI.FALEGNAME["RACCOLTA"].RaccoltaFalegname) do

        TriggerEvent('gridsystem:registerMarker', {
            name = 'raccoltafalegname'..gianvi.x,
            pos = vector3(gianvi.x, gianvi.y, gianvi.z),
            size = GIANVI.MARKER.dimensione,
            scale = GIANVI.MARKER.scala,
            color =  GIANVI.MARKER.colore,
            drawDistance = 4.0,
            msg = 'Premi E per raccogliere la legna',
            control = control,
            type = GIANVI.MARKER.tipo,
            texture = GIANVI.MARKER.texture,
            action = function()
                local currentTime = GetGameTimer() -- Ottieni il tempo corrente
                if IsPedInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('krs_notifica:manda', '<b><span style="color: #ffffff;">BLACK-SIDE NOTIFICA</span></b> </br>non puoi raccogliere') 
                elseif Boscaiolo then
                    if not isRaccogliendo and (currentTime - lastInteractionTime) > interactionCooldown then
                        isRaccogliendo = true
                        lastInteractionTime = currentTime -- Aggiorna il tempo dell'ultima interazione
                        exports.rprogress:Custom({
                            Async = true,
                            canCancel = GIANVI.RPROGRESS.cancellabile,
                            cancelKey = GIANVI.RPROGRESS.tastopercancellare,
                            Duration = GIANVI.RPROGRESS.durata,--20
                            ShowTimer = true,
                            Label = 'Stai raccogliendo la legna',
                            LabelPosition = "right",
                            Color = GIANVI.RPROGRESS.colore,
                            BGColor = GIANVI.RPROGRESS.colorebg,
                        })

                        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_HAMMERING", 0, true)
                        Citizen.Wait(10000)
                        ClearPedTasksImmediately(PlayerPedId())
                        local hammer = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey('prop_tool_hammer'), false, true ,true)
                        if DoesEntityExist(hammer) then
                            SetEntityAsMissionEntity(hammer, false, false)
                            DeleteObject(hammer)
                        end
                        TriggerServerEvent('Raccolta_Falegname')
                        isRaccogliendo = false
                    end
                else
                    Notifica(GIANVI.NOTIFICHE["2"])
                end
            end,
        })
    end
end)

Citizen.CreateThread(function()
    for gnv, gianvi in pairs(GIANVI.FALEGNAME["PROCESSO"].ProcessoFalegname) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'processotabacco'..gianvi.x,
            pos = vector3(gianvi.x, gianvi.y, gianvi.z),
            size = GIANVI.MARKER.dimensione,
            scale = GIANVI.MARKER.scala,
            color =  GIANVI.MARKER.colore,
            drawDistance = 4.0,
            msg = 'Premi ~INPUT_CONTEXT~ per processare la legna',
            control = 'E',
            type = GIANVI.MARKER.tipo,
            texture = GIANVI.MARKER.texture,
            action = function()
                local currentTime = GetGameTimer() -- Ottieni il tempo corrente
                if IsPedInAnyVehicle(PlayerPedId()) then
                    TriggerEvent('krs_notifica:manda', '<b><span style="color: #ffffff;">BLACK-SIDE NOTIFICA</span></b> </br>non puoi raccogliere') 
                elseif Boscaiolo  then
                    if not isRaccogliendo and (currentTime - lastInteractionTime) > interactionCooldown then
                        isRaccogliendo = true
                        lastInteractionTime = currentTime -- Aggiorna il tempo dell'ultima interazione
                        exports.rprogress:Custom({
                            Async = true,
                            canCancel = GIANVI.RPROGRESS.cancellabile,
                            cancelKey = GIANVI.RPROGRESS.tastopercancellare,
                            Duration = GIANVI.RPROGRESS.durata,--20
                            ShowTimer = true,
                            Label = 'Stai processando il legno',
                            LabelPosition = "right",
                            Color = GIANVI.RPROGRESS.colore,
                            BGColor = GIANVI.RPROGRESS.colorebg,
                        })

                        FreezeEntityPosition(PlayerPedId(), true)
                        RequestAnimDict("mini@repair")
                        while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                        TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        Citizen.Wait(10000)
                        TriggerServerEvent('Processo_Falegname')
                        isRaccogliendo = false
                    end
                else
                    Notifica(GIANVI.NOTIFICHE["2"])
                end
            end,
        })
    end
end)