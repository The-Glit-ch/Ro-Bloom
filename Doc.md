# Ro-Bloom API Doc

Quick Note: I dont know how to accurately describe these functions so I heavily suggest you look at the docs

[Yahoo Finance Docs](https://english.api.rakuten.net/apidojo/api/yahoo-finance1/endpoints)

---
## Vars:
``.BaseURL`` (Type:String)
The base url used for the GET requests

``.ShowWarnings`` (Type:Boolean)
Should the script show warnings(Mostly used for debug)

---
## GetSymbol:

``:GetSymbol(DataTable,Select)``
Returns the symbol located at "x" of the return JSON

**DataTable: Type:Table (Required)**

**Select: Type:Number (Required)**

Ex:
```lua
local ExampleReturnData = {
	["quotes"] = {
		[1] = {
			["symbol"] = "symbol 1"
		},
		[2] = {
			["symbol"] = "symbol 2"
		}
	}
}

RoBloom_API:GetSymbol(ExampleReturnData,2)
```
> returns symbol 2

---
## AutoComplete:

``:AutoComplete(APIKey,Query,Region)``

Returns a pcall value and a table that contains symbols and news about the given query

**APIKey: (Type:String, Required)**

**Query: (Type:String, Required)**

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:AutoComplete(APIKey,"roblox","US")
```
The "ReturnData" value can be used with :GetSymbol to get the symbol(crazy right)

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:AutoComplete(APIKey,"roblox","US")

local Symbol = RoBloom_API:GetSymbol(ReturnData,1)
```
> returns "RBLX"

---
## GetSummary:
``:GetSummary(APIKey,Symbol,Region)``

Returns a pcall value and a data table

**APIKey: (Type:String, Required)**

**Symbol: (Type:String, Required)**

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:GetSummary(APIKey,"RBLX","US")
```
> returns PcallValue, DataTable

---
## GetRecommendations:
``:GetRecommendations(APIKey,Symbol)``

Returns a pcall value and a data table

**APIKey: (Type:String, Required)**

**Symbol: (Type:String, Required)**

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:GetRecommendations(APIKey,"RBLX")
```
> returns PcallValue, DataTable
---
## GetUpgradesDownGrades:
``:GetUpgradesDownGrades(APIkey,Symbol,Region)``

Returns a pcall value and a data table

**APIKey: (Type:String, Required)**

**Symbol: (Type:String, Required)**

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:GetUpgradesDownGrades(APIKey,"RBLX","US")
```
> returns PcallValue, DataTable
---
## GetChart:
sadly dosent return a chart :cry:

Returns a pcall value and a data table

``:GetChart(APIKey,Interval,Symbol,Range,Region)``

**APIKey: (Type:String, Required)**

**Interval: (Type:String, Required)**

_One of the following is allowed 1m|2m|5m|15m|60m|1d_

**Symbol (Type:String, Required)**

**Range (Type:String, Required)**

_One of the following is allowed 1d|5d|1mo|3mo|6mo|1y|2y|5y|10y|ytd|max_

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex
```lua
local PcallValue, ReturnData = RoBloom_API:GetChart(APIKey,"5m","RBLX","5d","US")
```
> returns PcallValue, DataTable
---
## GetStatistics:
``:GetStatistics(APIKey,Symbol,Region)``

Returns a pcall value and a data table

**APIKey: (Type:String, Required)**

**Symbol: (Type:String, Required)**

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:GetStatistics(APIKey,"RBLX","US")
```
> returns PcallValue, DataTable
---
## GetHistoricalData:
``:GetHistoricalData(APIKey,Symbol,Region)``

Returns a pcall value and a data table

**APIKey: (Type:String, Required)**

**Symbol: (Type:String, Required)**

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex:
```lua
local PcallValue, ReturnData = RoBloom_API:GetHistoricalData(APIKey,"RBLX","US")
```
> returns PcallValue, DataTable
---
## GetTimeseries:
``:GetTimeseries(APIKey,Symbol,Period2,Period1,Region)``

Returns a pcall value and data table

**APIKey: (Type:String, Required)**

**Symbol: (Type:String, Required)**

**Period2 (Type:Table, Required)**

**Period1 (Type:Table, Required)**

**Region: (Type:String, Optional, Defaults to "US")**

_(One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)_

Ex
```lua
--More info on time can be found [here](https://developer.roblox.com/en-us/api-reference/lua-docs/os)

local Period2 = {
	["year"] = 2020,
	["month"] = 10,
	["day"] = 8,
	["hour"] = 19,
	["min"] = 30,
	["sec"] = 45
}

local Period1 = {
	["year"] = 2019,
	["month"] = 10,
	["day"] = 8,
	["hour"] = 19,
	["min"] = 30,
	["sec"] = 45
}

local PcallValue, ReturnData = RB_API:GetTimeseries(APIKey,"RBLX",Period2,Period1,"US")
```
> returns PcallValue, DataTable
---
