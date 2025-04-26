while wait(1) do
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Part") and v.Name == "Coin" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
        end
    end
end
