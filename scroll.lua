local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "RollMenu"
gui.ResetOnSpawn = false

-- Nút mở menu
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 80, 0, 80)
toggleButton.Position = UDim2.new(0, 20, 1, -100)
toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
toggleButton.Text = ""

-- Giao diện menu
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 300, 0, 220)
menu.Position = UDim2.new(0.5, -150, 0.5, -110)
menu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menu.Visible = false
Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 12)

-- Tiêu đề
local title = Instance.new("TextLabel", menu)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "AUTO ROLL MENU"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22

-- Nút Auto Roll
local rollBtn = Instance.new("TextButton", menu)
rollBtn.Size = UDim2.new(0.8, 0, 0, 40)
rollBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
rollBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
rollBtn.Text = "BẬT Auto Roll"

-- Ô nhập tốc độ
local speedBox = Instance.new("TextBox", menu)
speedBox.Size = UDim2.new(0.8, 0, 0, 35)
speedBox.Position = UDim2.new(0.1, 0, 0.65, 0)
speedBox.PlaceholderText = "Tốc độ (VD: 0.1)"
speedBox.Text = ""
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

-- Biến điều khiển
local isRolling = false
local delay = 0.2

-- Tự động roll
task.spawn(function()
	while true do
		if isRolling then
			pcall(function()
				local remote = game:GetService("ReplicatedStorage"):FindFirstChild("L5_z%Q1!Rx_")
				if remote then
					remote:FireServer()
				end
			end)
		end
		task.wait(delay)
	end
end)

-- Bật/tắt roll
rollBtn.MouseButton1Click:Connect(function()
	isRolling = not isRolling
	rollBtn.Text = isRolling and "TẮT Auto Roll" or "BẬT Auto Roll"
	rollBtn.BackgroundColor3 = isRolling and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 170, 0)
end)

-- Nhập tốc độ mới
speedBox.FocusLost:Connect(function()
	local value = tonumber(speedBox.Text)
	if value and value > 0 then
		delay = value
		speedBox.Text = ""
		speedBox.PlaceholderText = "Đặt thành: " .. tostring(value)
	end
end)

-- Mở/ẩn menu
toggleButton.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
end)
