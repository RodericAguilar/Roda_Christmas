
fx_version 'adamant'
game 'gta5'

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/app.js', 
	'html/style.css',
    'html/font/*.otf',
}

shared_script 'Config.lua'

server_scripts {
    'Server/*.lua'
}

client_scripts {
    'Client/*.lua',
}