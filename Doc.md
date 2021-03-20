# Ro-Bloom API Doc
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

**APIKey: Type:String (Required)**

**Query: Type:String (Required)**

**Region: Type:String (Optional, Defaults to "US")** (One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)

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

Returns a pcall value and a summary of the given symbol

**APIKey: Type:String (Required)**

**Symbol: Type:String (Required)**

**Region: Type:String (Optional, Defaults to "US")** (One of the following is allowed US|BR|AU|CA|FR|DE|HK|IN|IT|ES|GB|SG)

Ex:
```lua
local PcallValue, ReturnTable = RoBloom_API:GetSummary(APIKey,"RBLX","US")
```
> returns Table

---
