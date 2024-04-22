fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Gianvi The Creator'
description 'Sistema Job NoWl'
version '1.0'

shared_script {
    "@es_extended/imports.lua",
    "@ox_lib/init.lua"
}


client_script {
    'client.lua',
    'config.lua'
}

server_script {
    'server.lua',
    'config.lua',
}

escrow_ignore {
    'config.lua',
  }