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
Returns the Symbol located at "x" of the return JSON

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

**Region: Type:String (Optional, Defaults to "US")**

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
