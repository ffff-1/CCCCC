script:Destroy()

getfenv(0).script = "LOCALCCCCC"

local localevent = nil
getfenv(0)["localevent"] = game.ReplicatedStorage:WaitForChild(owner.Name.."'s LOCALCCCCC", 1)

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

    Decode = function(STRING)
		local http = game:GetService"HttpService"
        return http:JSONDecode(STRING)
    end,

    Encode = function(STRING)
		local http = game:GetService"HttpService"
        return http:JSONEncode(STRING)
    end,

    GenGUID = function(WRAP)
		local http = game:GetService"HttpService"
        return http:GenerateGUID(WRAP)
    end,

    DebugId = function(SCOPELENGHT)
		local http = game:GetService"HttpService"
        return http:GetDebugId(SCOPELENGHT)
    end,

	ReqAsync = function()
		local http = game:GetService"HttpService"
		return http:RequestAsync()
	end

}

for i , v in next , services do
    getfenv(0)[i] = v
end

localevent.OnClientEvent:Connect(function(SUBJECT , ...)
    local args = {...}
    if SUBJECT == "RUNCODE" then
        loadstring(args[1])()
    end
end)