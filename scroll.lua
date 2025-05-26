local replicated = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "AuraDecisionGui"
gui.ResetOnSpawn = false

-- Khung hiển thị giữ hay skip
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 120)
frame.Position = UDim2.new(0.5, -150, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0.4, 0)
title.Text = "Bạn roll được aura xịn!\nBạn muốn giữ không?"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.BackgroundTransparency = 1

local keep = Instance.new("TextButton", frame)
keep.Size = UDim2.new(0.4, 0, 0.3, 0)
keep.Position = UDim2.new(0.1, 0, 0.6, 0)
keep.Text = "Giữ"
keep.BackgroundColor3 = Color3.fromRGB(0, 200, 0)

local skip = Instance.new("TextButton", frame)
skip.Size = UDim2.new(0.4, 0, 0.3, 0)
skip.Position = UDim2.new(0.5, 0, 0.6, 0)
skip.Text = "Skip"
skip.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

-- Danh sách aura hiếm (có thể sửa/tùy chỉnh)
local rareAuras = {
    ["Nuke"] = true,
    ["Radiance"] = true,
    ["Golden Apple"] = true,
    ["Heaven"] = true
}

local autoRolling = true
local delay = 0.2

-- Quay + kiểm tra aura
task.spawn(function()
    while true do
        if autoRolling then
            replicated.Remotes.ZachRLL:InvokeServer()
            task.wait(0.25) -- đợi aura load xong

            local currentAura = replicated.CurrentAura:InvokeServer()
            if rareAuras[currentAura] then
                autoRolling = false
                title.Text = "Aura hiếm: " .. currentAura .. "\nBạn muốn giữ không?"
                frame.Visible = true
            end
        end
        task.wait(delay)
    end
end)

-- Giữ
keep.MouseButton1Click:Connect(function()
    replicated.ConfirmAura:FireServer({[1] = "keep"})
    frame.Visible = false
    autoRolling = true
end)

-- Skip
skip.MouseButton1Click:Connect(function()
    replicated.ConfirmAura:FireServer({[1] = "skip"})
    frame.Visible = false
    autoRolling = true
end)
