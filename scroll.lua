loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local OrionLib = require(game:GetService("ReplicatedStorage"):WaitForChild("OrionLib"))
local Window = OrionLib:MakeWindow({Name = "Auto Roll GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "AutoRoll"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Auto Roll",
	Default = false,
	Callback = function(Value)
		_G.AutoRoll = Value
		while _G.AutoRoll do
			pcall(function()
				local remote = game:GetService("ReplicatedStorage"):FindFirstChild("L5_z%Q1!Rx_")
				if remote then
					remote:FireServer()
				end
			end)
			wait(0.2)
		end
	end
})
