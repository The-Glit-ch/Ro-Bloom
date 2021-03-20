--	The_Glit-ch#4859
--	https://github.com/The-Glit-ch
--
--	Docs: https://github.com/The-Glit-ch/Ro-Bloom/blob/main/Doc.md
--
--	Started on 3/18/2021 7:05 PM
--
--

--AutoAssert
--:AutoAssert(Var,Type,VarName)

--AutoWarn
--:AutoWarn(Var,DefaultValue,VarName)


local RoBloomAPI = {}

--Start up
print("Attempting to load 'Ro-Bloom Services'")
local RoBloomService = require(script:WaitForChild("Ro-Bloom Services")) --Make sure you link the Ro-Bloom Services script
print("Ro-Bloom Services loaded")
--



--Vars
BaseURL = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/"
ShowWarnings = true

function RoBloomAPI:GetSymbol(DataTable,Select)
	
	RoBloomService:AutoAssert(DataTable,"table","DataTable")
	RoBloomService:AutoAssert(Select,"number","Select")
	
	return DataTable["quotes"][Select]["symbol"]
end

function RoBloomAPI:AutoComplete(APIKey,Query,Region)	
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Query,"string","Query")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/auto-complete?q="..Query.."&region="..Region,false,Headers)	
	end)
	
	return PcallValue, ReturnData
end

--Stock
function RoBloomAPI:GetSummary(APIKey,Symbol,Region)
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-summary?symbol="..Symbol.."&region="..Region,false,Headers)
	end)
	return PcallValue, ReturnData
end

function RoBloomAPI:GetRecommendations(APIKey,Symbol)
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-recommendations?symbol="..Symbol,false,Headers)
	end)
	
	return PcallValue, ReturnData
end

function RoBloomAPI:GetUpgradesDownGrades(APIKey,Symbol,Region)

	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-upgrades-downgrades?symbol="..Symbol.."&region="..Region,false,Headers)
	end)
	
	return PcallValue, ReturnData
	
end

function RoBloomAPI:GetChart(APIKey,Interval,Symbol,Range,Region)

	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Interval,"string","Interval")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	RoBloomService:AutoAssert(Range,"string","Range")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-chart?interval="..Interval.."&symbol="..Symbol.."&range="..Range.."&region="..Region,false,Headers)
	end)
	
	return PcallValue, ReturnData
	
end

function RoBloomAPI:GetStatistics(APIKey,Symbol,Region)
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-statistics?symbol="..Symbol.."&region="..Region,false,Headers)
	end)
	
	return PcallValue, ReturnData
end

function RoBloomAPI:GetHistoricalData(APIKey,Symbol,Region)
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v3/get-historical-data?symbol="..Symbol.."&region="..Region,false,Headers)
	end)
	
	return PcallValue, ReturnData
	
end

function RoBloomAPI:GetProfile(APIKey,Symbol,Region)
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-profile?symbol="..Symbol.."&region="..Region,false,Headers)
	end)
	
	return PcallValue, ReturnData
end

function RoBloomAPI:GetFinancials(APIKey,Symbol,Region)
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-financials?symbol="..Symbol.."&region="..Region,false,Headers)
	end)
	
	return PcallValue, ReturnData
end

function RoBloomAPI:GetTimeseries(APIKey,Symbol,Period2,Period1,Region)	
	
	RoBloomService:AutoAssert(APIKey,"string","APIKey")
	RoBloomService:AutoAssert(Symbol,"string","Symbol")
	RoBloomService:AutoAssert(Period2,"table","Period2")
	RoBloomService:AutoAssert(Period1,"table","Period1")
	
	if ShowWarnings then
		RoBloomService:AutoWarn(Region,"US","Region")
		Region = "US"
	end
	
	local Period2Time = os.time({
		year=Period2["year"],month=Period2["month"],day=Period2["day"],
		hour=Period2["hour"],min=Period2["min"],sec=Period2["sec"]
	})
	local Period1Time = os.time({
		year=Period1["year"],month=Period1["month"],day=Period1["day"],
		hour=Period1["hour"],min=Period1["min"],sec=Period1["sec"]
	})
	
	local Headers = {
		["x-rapidapi-key"] = APIKey,
		["x-rapidapi-host"] = "apidojo-yahoo-finance-v1.p.rapidapi.com",
		["useQueryString"] = "true",
	}
	
	local PcallValue, ReturnData = pcall(function()
		return RoBloomService:GetAndDecode(BaseURL.."/stock/v2/get-timeseries?symbol="..Symbol.."&period2="..Period2Time.."&period1="..Period1Time.."&region="..Region,false,Headers)
	end)
	return PcallValue, ReturnData
end

return RoBloomAPI
