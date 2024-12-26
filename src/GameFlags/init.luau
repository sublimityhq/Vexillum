--!strict
--!native
--!optimize 2

--[[
MIT License

Copyright (c) 2024 Sublimity

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--

--GameFlags v0.1
local UserInputService = game:GetService("UserInputService")
local Platform = if game:GetService("GuiService"):IsTenFootInterface() then "Console" elseif UserInputService.TouchEnabled and not UserInputService.MouseEnabled then "Mobile" else "Desktop"
local Flags = require(script.Flags) :: any

local GameFlags = {}

function GameFlags:Initialization()
	for Flag, Table in Flags do
		if Table.Type == "Unified" then
			local FlagInstance = Instance.new("BoolValue")
			Flags[Flag] = FlagInstance
			FlagInstance.Name = Flag
			FlagInstance.Value = Table.Value
			FlagInstance.Parent = script.Flags
		elseif Table.Type == "Platform" then
			local FlagInstance = Instance.new("BoolValue")
			Flags[Flag] = FlagInstance
			FlagInstance.Name = Flag
			FlagInstance.Value = Table.Value[Platform]
			FlagInstance.Parent = script.Flags
		else
			error("An FFlag is not typed correctly!")
		end
	end
	GameFlags.Intialized = true
	GameFlags.Flags = Flags
end

function GameFlags:CheckFlag(Name: string): boolean
	if not GameFlags.Intialized then
		error("You have not intialized the GameFlags module.")
	end
	if not Flags[Name] then
		error("Flag does not exist.")
		return false
	end
	return Flags[Name].Value
end

return GameFlags
