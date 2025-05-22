-- Thiết lập phím để bật/tắt (F5)
local toggleKey = Enum.KeyCode.F5
local isRolling = false
local delay = 0.2 -- Thời gian chờ giữa các lần roll (giây)

-- Vòng lặp auto roll
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

-- Bắt sự kiện nhấn phím để bật/tắt auto roll
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == toggleKey and not gameProcessed then
        isRolling = not isRolling
        print("Auto Roll:", isRolling and "BẬT" or "TẮT")
    end
end)
