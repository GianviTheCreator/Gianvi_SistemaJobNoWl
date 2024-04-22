ESX = exports.es_extended:getSharedObject()


RegisterServerEvent('AcquistoFurgone')
AddEventHandler('AcquistoFurgone',function ()
  local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('money',GIANVI.FURGONE.CostoDelFurgone)
end)


RegisterServerEvent('Minatore_Raccolta')
AddEventHandler('Minatore_Raccolta', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsRaccolta = GIANVI.MINATORE["Raccolta"].itemRaccoltaMinatore
    
    -- Controlla la quantità di ogni oggetto di raccolta
    for _, oggetto in ipairs(itemsRaccolta) do
        local quantita = xPlayer.getInventoryItem(oggetto).count
        if quantita >= 400 then
          TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'Hai troppa roccia, depositalo nel furgone'})
            return
        end
    end
    
    -- Se non ci sono problemi con la quantità, aggiungi gli oggetti casuali
    local numeroOggetti = math.random(1, 3) -- Definisci quante unità di oggetti verranno aggiunte
    
    for i = 1, numeroOggetti do
        local oggettoCasuale = itemsRaccolta[math.random(1, #itemsRaccolta)] -- Scegli casualmente un oggetto dalla lista
        xPlayer.addInventoryItem(oggettoCasuale, 1) -- Aggiungi l'oggetto all'inventario del giocatore
    end
end)


RegisterServerEvent('Minatore_Processo')
AddEventHandler('Minatore_Processo', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Recupera la lista degli oggetti di raccolta
    local itemsRaccolta = GIANVI.MINATORE["Raccolta"].itemRaccoltaMinatore

    -- Verifica se il giocatore possiede tutte le risorse necessarie per il processo di raccolta
    local tutteLeRisorsePresenti = true
    for _, risorsa in ipairs(itemsRaccolta) do
        local quantita = xPlayer.getInventoryItem(risorsa).count
        if quantita < 2 then
            tutteLeRisorsePresenti = false
            break
        end
    end

    -- Se non tutte le risorse sono presenti, mostra un messaggio di errore
    if not tutteLeRisorsePresenti then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'Devi avere tutte le risorse necessarie per il processo di raccolta'})
        return
    end

    -- Se tutte le risorse sono presenti, procedi con il processo di raccolta
    local itemsProcesso = GIANVI.MINATORE["Processo"].item_Processo_Minatore
    local numeroOggetti = math.random(1, 3) -- Definisci quante unità di oggetti verranno aggiunte
    
    for i = 1, numeroOggetti do
        local oggettoCasuale = itemsProcesso[math.random(1, #itemsProcesso)] -- Scegli casualmente un oggetto dalla lista
        xPlayer.addInventoryItem(oggettoCasuale, 1) -- Aggiungi l'oggetto all'inventario del giocatore
    end

    -- Rimuovi le risorse di raccolta dall'inventario del giocatore
    for _, risorsa in ipairs(itemsRaccolta) do
        xPlayer.removeInventoryItem(risorsa, 2)
    end
end)




RegisterServerEvent('Raccolta_Tabacco')
AddEventHandler('Raccolta_Tabacco', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if not xPlayer then
        return
    end

    local tabaccoCount = xPlayer.getInventoryItem(GIANVI.TABACCO["Raccolta"].item_Raccolta_Tabacco).count 
    
    if tabaccoCount >= 400 then
        xPlayer.showNotification("Hai già raccolto abbastanza tabacco. Deposita prima in un veicolo!")
    else
        local itemsRaccoltaTabacco = {'tabacco'} -- Lista degli oggetti che si possono ottenere dalla raccolta
        local numeroOggetti = math.random(1, 3) -- Numero casuale di oggetti da aggiungere all'inventario
        
        for i = 1, numeroOggetti do
            local oggettoCasuale = itemsRaccoltaTabacco[math.random(1, #itemsRaccoltaTabacco)] -- Scegli casualmente un oggetto dalla lista
            xPlayer.addInventoryItem(oggettoCasuale, 1) -- Aggiungi l'oggetto all'inventario del giocatore
        end
    end
end)



RegisterServerEvent('Processo_tabacco')
AddEventHandler('Processo_tabacco', function ()
  local xPlayer = ESX.GetPlayerFromId(source)
  local item = xPlayer.getInventoryItem(GIANVI.TABACCO["Raccolta"].item_Raccolta_Tabacco).count -- Assicurati che 'tabacco' sia una stringa
  
  if item >= 4 then
      xPlayer.removeInventoryItem(GIANVI.TABACCO["Raccolta"].item_Raccolta_Tabacco, 4)
      xPlayer.addInventoryItem(GIANVI.TABACCO["Processo"].item_Processo_Tabacco, 1) -- Assicurati che 'sigarette' sia una stringa
  else
    xPlayer.showNotification("Non hai abbastanza tabacco")
  end
end)

RegisterServerEvent('Raccolta_Falegname')
AddEventHandler('Raccolta_Falegname', function ()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Recupera la lista degli oggetti di raccolta del falegname
    local itemsRaccoltaFalegname = GIANVI.FALEGNAME["RACCOLTA"].item_Raccolta_falegname

    -- Verifica se il giocatore possiede tutti gli oggetti di raccolta del falegname
    local tutteLeRisorsePresenti = true
    for _, risorsa in ipairs(itemsRaccoltaFalegname) do
        local quantita = xPlayer.getInventoryItem(risorsa).count
        if quantita >= 400 then
            xPlayer.showNotification("Hai già raccolto abbastanza " .. risorsa .. ". Deposita prima in un veicolo!")
            tutteLeRisorsePresenti = false
            break
        end
    end

    -- Se non tutte le risorse sono presenti, interrompi il processo
    if not tutteLeRisorsePresenti then
        return
    end

    -- Se tutte le risorse sono presenti, procedi con la raccolta
    local numeroOggetti = math.random(1, 4) -- Definisci quante unità di oggetti verranno aggiunte
    local oggettoRaccolto = itemsRaccoltaFalegname[1] -- Assume che ci sia solo un tipo di risorsa per la raccolta del falegname

    for i = 1, numeroOggetti do
        xPlayer.addInventoryItem(oggettoRaccolto, 1) -- Aggiungi l'oggetto raccolto all'inventario del giocatore
    end
end)


RegisterServerEvent('Processo_Falegname')
AddEventHandler('Processo_Falegname', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Recupera la lista degli oggetti di raccolta
    local itemsRaccolta = GIANVI.FALEGNAME["RACCOLTA"].item_Raccolta_falegname

    -- Verifica se il giocatore possiede tutte le risorse necessarie per il processo di raccolta
    local tutteLeRisorsePresenti = true
    for _, risorsa in ipairs(itemsRaccolta) do
        local quantita = xPlayer.getInventoryItem(risorsa).count
        if quantita < 1 then
            tutteLeRisorsePresenti = false
            break
        end
    end

    -- Se non tutte le risorse sono presenti, mostra un messaggio di errore
    if not tutteLeRisorsePresenti then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = 'Devi avere tutte le risorse necessarie per il processo di raccolta'})
        return
    end

    -- Se tutte le risorse sono presenti, procedi con il processo di raccolta
    local itemsProcesso = GIANVI.FALEGNAME["PROCESSO"].item_Processo_falegname
    local numeroOggetti = math.random(1, 3) -- Definisci quante unità di oggetti verranno aggiunte
    
    for i = 1, numeroOggetti do
        local oggettoCasuale = itemsProcesso[math.random(1, #itemsProcesso)] -- Scegli casualmente un oggetto dalla lista
        xPlayer.addInventoryItem(oggettoCasuale, 1) -- Aggiungi l'oggetto all'inventario del giocatore
    end

    -- Rimuovi le risorse di raccolta dall'inventario del giocatore
    for _, risorsa in ipairs(itemsRaccolta) do
        xPlayer.removeInventoryItem(risorsa, 1)
    end
end)

RegisterServerEvent('Vendita_item')
AddEventHandler('Vendita_item', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    for _, oggetto in ipairs(GIANVI.VENDITA.item_da_vendere) do
        local nome_oggetto = oggetto.nome
        local prezzo_oggetto = oggetto.prezzo
        
        local quantita_oggetto = xPlayer.getInventoryItem(nome_oggetto).count
        
        if quantita_oggetto > 0 then
            -- Calcola il prezzo totale per l'oggetto posseduto dal giocatore
            local prezzo_totale = prezzo_oggetto * quantita_oggetto
            
            xPlayer.addMoney(prezzo_totale)
            xPlayer.removeInventoryItem(nome_oggetto, quantita_oggetto)
            
        end
    end
end)
