--[[local Players=game:GetService('Players')
local RunS=game:GetService('RunService')
local StarterGui = game:GetService("StarterGui")
local UIS=game:GetService('UserInputService')
local Plr=Players.LocalPlayer

local Location=nil

local function Notification(ti,tex)
	StarterGui:SetCore("SendNotification", {
		Title=ti,
		Text=tex,
	})
end

local function SpawnF(char)
	if Location and typeof(Location)=='Vector3' then
		local HRP=char:WaitForChild('HumanoidRootPart')
		HRP.Position=Location
		Notification('Sucesso','Tentativa de teleporte feita.')
		local SafetyCon
		local now=time()
		SafetyCon=RunS.Heartbeat:Connect(function()
			if time()-now>=3 then SafetyCon:Disconnect(); SafetyCon=nil return end
			local Dist=(HRP.Position-Location).Magnitude
			if Dist>=50 then
				HRP.Position=Location
				Notification('ERRO','Algo de errado não ta certo (Anti cheat talvez?)')
			end
		end)
	end
end

UIS.InputBegan:Connect(function(input,ist)
	if ist then return end
	
	if input.KeyCode==Enum.KeyCode.E then
		Location=Plr.Character.HumanoidRootPart.Position
		Notification('Sucesso','Spawn atualizado.')
	end
end)

Plr.CharacterAdded:Connect(SpawnF)
--]]
