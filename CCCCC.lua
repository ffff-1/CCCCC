-- CCCCC by fbd_1
script:Destroy()

if workspace:FindFirstChild(owner.Name.."'s CCCCC") then workspace:FindFirstChild(owner.Name.."'s CCCCC"):Destroy() end

local mod = Instance.new("Script",workspace)
mod.Name = owner.Name.."'s CCCCC"

getfenv(0).script = mod

-- SERVICES

if game.ReplicatedStorage:FindFirstChild(owner.Name.."'s LOCALCCCCC") then game.ReplicatedStorage:FindFirstChild(owner.Name.."'s LOCALCCCCC"):Destroy() end
local LOCALEVENT = Instance.new("RemoteEvent")
LOCALEVENT.Name = owner.Name.."'s LOCALCCCCC"
LOCALEVENT.Parent = game.ReplicatedStorage
getfenv(0)["localevent"] = LOCALEVENT

NLS(http.GetContent("https://raw.githubusercontent.com/ffff-1/CCCCC/main/LOCALCCCCC.lua" , false))
LOCALEVENT.OnServerEvent:Wait()

local services = {}
services.http = game:GetService"HttpService"
services.http = {
	GetContent = function(LINK : string , CACHE : boolean , HEADER : nil | any , RETRIES : nil | number )
		local http = game:GetService"HttpService"
		local CONTENT
		local retries

		if RETRIES then
			retries = RETRIES
		else
			retries = nil
		end

		repeat
			if retries then
				retries += 1
			end

			local tempCONTENT
			pcall(function()
				tempCONTENT = http:GetAsync(LINK , CACHE , HEADER )
			end)

			if tempCONTENT then
				CONTENT = tempCONTENT
				break
			end
			if RETRIES and retries and retries >= RETRIES then
				return nil
			end
			task.wait(1)
		until CONTENT

		return CONTENT
	end,

    Decode = function(STRING : string)
		local http = game:GetService"HttpService"
        return http:JSONDecode(STRING)
    end,

    Encode = function(STRING : string)
		local http = game:GetService"HttpService"
        return http:JSONEncode(STRING)
    end,

    GenGUID = function(WRAP : nil | boolean)
		local http = game:GetService"HttpService"
        return http:GenerateGUID(WRAP)
    end,

    DebugId = function(SCOPELENGHT : nil | number  )
		local http = game:GetService"HttpService"
        return http:GetDebugId(SCOPELENGHT)
    end,

	ReqAsync = function()
		local http = game:GetService"HttpService"
		return http:RequestAsync()
	end

}

-- VARS INIT

local FILES = {
	MODULES = {},
	FUNCTIONS = {
		lerp = function (a, b, t)
			return a + (b - a) * t
		end,
		require = function(modname : string)
			return loadstring(http.GetContent(modname,false))()
		end,
		runlocal = function(code : string)
			localevent:FireClient(owner,"RUNCODE",code)
		end
	},
	SERVICES = {},
	REPOSITORIES = {},
	COMMANDS = {},
	EXECUTABLES = {},
	User = {},
}

for i , v in next , services do
	FILES.SERVICES[i] = v
end

services = nil

for i , v in next , FILES.SERVICES do
	getfenv(0)[i] = v
	table.freeze(getfenv(0)[i])
end

for i , v in next  , FILES.FUNCTIONS do
	getfenv(0)[i] = v
end

getfenv(0)["FILES"] = FILES

FILES = nil

-- ENGINE

LOCALEVENT.OnServerEvent:Connect(function(plr , SUBJECT , ... )
	if plr ~= owner then return end
	local ARGS = {...}
	if SUBJECT == "DOHTTPREQUEST" then
		local LINK , CACHE , HEADER , RETRIES = ARGS[1] , ARGS[2] , ARGS[3] , ARGS[4]
		local CONTENT = http.GetContent(LINK , CACHE , HEADER , RETRIES)
		LOCALEVENT:FireClient(owner , "GETHTTPREQUEST" , CONTENT )
	elseif SUBJECT == "RUNCODE" then
		local func = loadstring(ARGS[1])
		local sus , e = pcall(func)
		if not sus then
			error(e,0)
		end
	end
end)

task.wait()

require("https://raw.githubusercontent.com/ffff-1/CCCCC/main/GUI.lua")()
