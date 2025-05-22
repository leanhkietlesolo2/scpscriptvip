-- Tạo GUI chính
local gui = Instance.new("ScreenGui")
gui.Name = "AutoRollUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Nút mở/ẩn menu (nút vuông ở góc trái)
local toggleMenuBtn = Instance.new("TextButton")
toggleMenuBtn.Size = UDim2.new(0, 50, 0, 50)
toggleMenuBtn.Position = UDim2.new(0, 10, 1, -60)
toggleMenuBtn.Text = "☰"
toggleMenuBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
toggleMenuBtn.TextColor3 = Color3.new(1,1,1)
toggleMenuBtn.TextSize = 28
toggleMenuBtn.Parent = gui

-- Frame menu chính
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 200, 0, 120)
menu.Position = UDim2.new(0.5, -100, 0.5, -60)
menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menu.Visible = false
menu.Active = true
menu.Draggable = true
menu.Parent = gui

-- Tựa đề
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Auto Roll Menu"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = menu

-- Nút bật/tắt auto roll
local toggleRoll = Instance.new("TextButton")
toggleRoll.Size = UDim2.new(0.8, 0, 0, 40)
toggleRoll.Position = UDim2.new(0.1, 0, 0.5, -20)
toggleRoll.Text = "BẬT Auto Roll"
toggleRoll.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
toggleRoll.TextColor3 = Color3.new(1, 1, 1)
toggleRoll.Font = Enum.Font.SourceSans
toggleRoll.TextSize = 18
toggleRoll.Parent = menu

-- Logic auto roll
local isRolling = false
local delay = 0.02

spawn(function()
    while true do
        if isRolling then
            pcall(function()
                local remote = game:GetService("ReplicatedStorage"):FindFirstChild("L5_z%Q1!Rx_")
                if remote then
                    remote:FireServer()
                end
            end)
        end
        wait(delay)
    end
end)

-- Bật/tắt Auto Roll
toggleRoll.MouseButton1Click:Connect(function()
    isRolling = not isRolling
    toggleRoll.Text = isRolling and "TẮT Auto Roll" or "BẬT Auto Roll"
    toggleRoll.BackgroundColor3 = isRolling and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(150, 0, 0)
end)

-- Bấm nút mở/ẩn menu
toggleMenuBtn.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)
