fx_version "cerulean"

description "Basic React (TypeScript) & Lua Game Scripts Boilerplate"
author "Project Error"
version '1.0.0'
repository 'https://github.com/project-error/fivem-react-boilerplate-lua'

lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'web/build/index.html'

files {
  'web/build/index.html',
  'web/build/**/*',
}

shared_scripts {
  '@es_extended/imports.lua',
  '@es_extended/locale.lua',
}

client_scripts {
  'config.lua',
  './client/utils.lua',
  "./client/client.lua",
}
server_script {
  '@oxmysql/lib/MySQL.lua',
  'config.lua',
  "./server/server.lua",
}

dependency 'es_extended'
