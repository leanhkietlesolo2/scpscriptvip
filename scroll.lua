-- Tạo GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AutoRollMenu"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 60)
frame.Position = UDim2.new(0, 100, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Text = ""
toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 80, 0, 40)
label.Position = UDim2.new(0, 60, 0, 10)
label.BackgroundTransparency = 1
label.Text = "TẮT"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 20
label.Parent = frame

-- Auto roll logic
local isRolling = false
local delay = 0.2

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

-- Bật/tắt khi bấm nút
toggleBtn.MouseButton1Click:Connect(function()
    isRolling = not isRolling
    toggleBtn.BackgroundColor3 = isRolling and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(150, 0, 0)
    label.Text = isRolling and "BẬT" or "TẮT"
end)
