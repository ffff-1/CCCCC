script:Destroy()

getfenv(0).script = "LOCALCCCCC"

local LOCALEVENT = game.ReplicatedStorage:WaitForChild(owner.Name.."'s LOCALCCCCC", 1)
getfenv(0)["localevent"] = LOCALEVENT
LOCALEVENT = nil

local services = {}
services.http = {
	GetContent = function(LINK , CACHE , HEADER , RETRIES )
		localevent:FireServer("DOHTTPREQUEST", LINK , CACHE , HEADER , RETRIES)
        local CONTENT
        repeat 
            local SUBJECT , args = localevent.OnClientEvent:Wait()
            if SUBJECT == "GETHTTPREQUEST" then
                CONTENT = args[1]
            end
        until CONTENT
		return CONTENT
	end,

}

getfenv(0).http = services.http
services = nil

localevent.OnClientEvent:Connect(function(SUBJECT , ...)
    local args = {...}
    if SUBJECT == "RUNCODE" then
        local func = loadstring(args[1])
        local sus , err = pcall(func)
        if not sus then
            error(err,0)
        end
    end
end)

localevent:FireServer()