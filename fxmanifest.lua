fx_version 'cerulean'
game 'gta5'

author 'Khazadream'
description 'Use Items to place objects'
version '0.0.1'

lua54 'yes'

client_scripts { "client/*.lua" }
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua",
}