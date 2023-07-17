-- CCCCC by fbd_1

-- SERVICES

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

			local tempCONTENT = http:GetAsync(LINK , CACHE , HEADER )

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
			local GetContent = function(LINK : string , CACHE : boolean )
				local http = game:GetService"HttpService"
				local CONTENT
				local retries = 0
		
				repeat
					if retries then
						retries += 1
					end
		
					local tempCONTENT = http:GetAsync(LINK , CACHE  )
		
					if tempCONTENT then
						CONTENT = tempCONTENT
						break
					end
					if retries and retries >= 10 then
						return nil
					end
					task.wait(9)
				until CONTENT
		
				return CONTENT
			end
			return loadstring(GetContent(modname , false))()
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

require("https://raw.githubusercontent.com/ffff-1/CCCCC/main/GUI.lua")()
