local RoBloomService = {}

--Yes I did copy and paste my own code
--https://github.com/The-Glit-ch/RobloxHTTP-Library

--Service
local HTTPService = game:GetService("HttpService")

--Vars
IsHTTPEnabled = IsHTTPEnabled
ShowWarnings = true --Should it show warn(). By default this would be set to true but it can be changed to your liking

--Functions
function RoBloomService:GetAndDecode(Url,NoCache,Headers)
	--Url: The web address you are requesting data from(Type: String)(Required)
	--NoCache: Whether the request stores (caches) the response(Type: Bool)(Optional)
	--Headers:Used to specify some HTTP request headers(Type: Variant)(Optional)

	--Info can be found here -> https://developer.roblox.com/en-us/api-reference/function/HttpService/GetAsync

	--Were just checking our inputs here
	assert(Url,"Error: Missing parameter 'Url'")
	assert(type(Url)=="string","Error: Url is not 'string' type. Please enter in a valid string or use 'string()'")

	if ShowWarnings == true then
		if NoCache == nil then
			warn("'NoCache' input value not provided. Defaulting to 'false'")
		end
		if Headers == nil then
			warn("'Headers' input value not provided. Defaulting to 'nil'")
		end
	end

	--
	local PcallReturn,DecodedMessage = pcall(function()
		return HTTPService:JSONDecode(HTTPService:GetAsync(Url,NoCache,Headers))
	end)
	return DecodedMessage
end

function RoBloomService:EncodeAndPost(Url,Data,ContentType,Compress,Headers)
	--Url:The destination address for the data(Type: String)--(Required)
	--Data:The data being sent(Type: Table)--(Required)
	--ContentType:Modifies the value in the Content-Type header sent with the request(Type: HttpContentType)--(Optional)
	--Compress:Determines whether the data is compressed (gzipped) when sent(Type: Bool)--(Optional)
	--Headers:Used to specify some HTTP request headers(Type: Variant)--(Optional)

	--Info can be found here -> https://developer.roblox.com/en-us/api-reference/function/HttpService/PostAsync

	--Again we check our inputs
	assert(Url,"Error: Missing parameter 'Url'")
	assert(type(Url)=="string","Error: Url is not 'string' type. Please enter in a valid string or use 'string()'")
	assert(Data,"Error: Missing parameter 'Data'")
	assert(type(Data)=="table","Error: Data is not 'table' type. Please enter in a valid table")

	if ShowWarnings == true then
		if ContentType == nil then
			warn("'ContentType' input value not provided. Defaulting to 'ApplicationJson'")
		end
		if Compress == nil then
			warn("'Compress' input value not provided. Defaulting to 'false'")
		end
		if Headers == nil then
			warn("'Headers' input value not provided. Defaulting to 'nil'")
		end
	end

	--
	local PcallReturn,Res = pcall(function()
		return HTTPService:PostAsync(Url,HTTPService:JSONEncode(Data),ContentType,Compress,Headers)
	end)
	return Res
end

function RoBloomService:UrlEncode(UnSafeUrl)
	--UnSafeUrl:The string (URL) to encode(Type: String)(Required)

	--Info can be found here -> https://developer.roblox.com/en-us/api-reference/function/HttpService/UrlEncode

	assert(UnSafeUrl,"Error: Missing parameter 'Url'. How did you mess that up. It's just a one parameter function")
	assert(type(UnSafeUrl)=="string","Error: Url is not 'string' type. Please enter in a valid string or use 'string()'")
	local SafeUrl = HTTPService:UrlEncode(UnSafeUrl)
	return SafeUrl
end

function RoBloomService:GGUID(GenerateCurlyBraces)
	--GenerateCurlyBraces:Whether the returned string should be wrapped in {curly braces}(Type: Bool)(Required)

	--Info can be found here -> https://developer.roblox.com/en-us/api-reference/function/HttpService/GenerateGUID

	assert(GenerateCurlyBraces,"Error: Missing parameter 'GenerateCurlyBraces'. How did you mess that up. It's just a one parameter function")
	assert(type(GenerateCurlyBraces)=="boolean","Error: GenerateCurlyBraces is not 'boolean' type. Please enter in a valid boolean")
	local Str = HTTPService:GenerateGUID(GenerateCurlyBraces)
	return Str
end

function RoBloomService:AutoAssert(Var,Type,VarName)
	assert(Var,"Error: A "..VarName.." must be provided in other to use the Ro-Bloom API")
	assert(type(Var)==Type,"Error: The input '"..VarName.."' must be a "..Type)
end

function RoBloomService:AutoWarn(Var,DefaultValue,VarName)
	if Var == nil then
		local DefaultString = tostring(DefaultValue)
		warn("Warning: "..VarName.." input not provided, defaulting to '"..DefaultString.."'")
	end
end

return RoBloomService
