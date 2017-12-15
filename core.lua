local api = {}
local https = require('ssl.https')
local multipart = require('multipart-post')
local ltn12 = require('ltn12')
local json = require('dkjson')

function api.configure(token, debug)
    if not token or type(token) ~= 'string' then
        token = nil
    end
    api.debug = debug and true or false
    api.token = assert(token, 'Please specify your bot API token you received from @BotFather!')
    repeat
        api.info = api.get_me()
    until api.info.result
    api.info = api.info.result
    api.info.name = api.info.first_name
    return api
end
