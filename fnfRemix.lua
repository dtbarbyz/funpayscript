

local vim = game:GetService("VirtualInputManager")
local rs = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local main = plr.PlayerGui.Main
 
_G.Auto = true
 
local Player = 0

spawn(function()
while wait() and _G.Auto do
if plr.File.CurrentPlayer.Value == "Player1" then
Player = 1
else
Player = 2
end
end
end)

function lol(num,keke)
rs.Stepped:Connect(function()
if _G.Auto then
if Player > 0 then
for i,v in pairs(main.MatchFrame["KeySync".. Player]["Arrow".. num].Notes:GetChildren()) do
if v:IsA("ImageLabel") then
if v.Position.Y.Scale <= 0.01 then
vim:SendKeyEvent(1,Enum.KeyCode[keke],0,nil)
vim:SendKeyEvent(0,Enum.KeyCode[keke],0,nil) 
print(num,keke,v.Name,v.Position.Y.Scale)
end
end
end
end
end
end)
end
 
spawn(function()
lol(1,"A")
end)
spawn(function()
lol(2,"S")
end)
spawn(function()
lol(3,"W")
end)
spawn(function()
lol(4,"D")
end)
 
 
repeat
wait()
until _G.Auto == false
