local espModule = {}

-- // Services 


-- // Variables
local camera = workspace.CurrentCamera


-- // Stuff other than variables
local Create = Drawing.new()


function espModule:CreateLine(Visible, Thickness, Color3, Transparency, HRP)
local Line = Drawing.new("Line")
	Line.Visible = Visible
	Line.Thickness = Thickness
	Line.Color = Color3
	Line.Transparency = Transparency
	
	game:GetService("RunService").RenderStepped:Connect(function()
	local Vector, OnScreen = camera:worldToViewportPoint(HRP.Position) -- and not v = player :Shrug:
		

    
		if OnScreen then
		    
			Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
			
			Line.To = Vector2.new(Vector.X, Vector.Y)
		end
	
        HRP.Parent.Humanoid.Died:Connect(function()
            Line:Remove()
        end

        game.Players.PlayerRemoved:Connect(function(plr)
            if HRP.Parent.Name == plr.Name then
                Line:Remove()
            end
        end)

    end)

end

function espModule:CreateCircle(Visible, Thickness, Color3, Transparency, Filled, Radius)
	local Circle = Drawing.new("Circle")
	
	Circle.Visible = Visible
	Circle.Thickness = Thickness
	Circle.Color = Color3
	Circle.Transparency = Transparency
    	Circle.Filled = Filled
    	Circle.Radius = Radius
    
    	if Position == nil then
        	Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    	end

    
   	 game.RunService.RenderStepped:Connect(function()
       	 	Circle.Position = Position
  	 end)
    
end

function espModule:CreatePlayerBox(Visible, Thickness, Color3, Transparency, Filled, HRP)
	local Outline = Drawing.new("Square")
    Outline.Visible = Visible
    Outline.Color = Color3
    Outline.Thickness = Thickness
    Outline.Transparency = Transparency
    Outline.Filled = Filled

    local Box = Drawing.new("Square")
    Box.Visible = Visible
    Box.Color = Color3
    Box.Thickness = Thickness
    Box.Transparency = Transparency
    Box.Filled = Filled

    game:GetService"RunService".RenderStepped:Connect(function(dt)
        if HRP.Parent and HRP.Parent:FindFirstChild"Humanoid" and HRP.Parent:FindFirstChild"HumanoidRootPart" and HRP.Parent.Name ~= game.Players.LocalPlayer.Name and HRP.Parent.Humanoid.Health > 0 then

            local Head = HRP.Parent.Head
            local HRPPosition, HRPVis = worldToViewportPoint(camera, HRP.Position)
            local HeadPos = worldToViewportPoint(camera, Head.Position + Vector3.new(0, 0.5, 0))
            local LegPos = worldToViewportPoint(camera, HRP.Position - Vector3.new(0, 5, 0))

            local Vector, OnScreen = camera:worldToViewportPoint(HRP.Position) 

            if OnScreen then
                Outline.Size = Vector2.new(1000 / HRPPosition.Size.Z, HeadPos.Size.Y - LegPos)
                Outline.Position = Vector2.new(HRPPosition.X - Outline.Size.X / 2, HRPPosition.Y - Outline.Size.Y / 2)

                Box.Size = Vector2.new(1000 / HRPPosition.Size.Z, HeadPos.Size.Y - LegPos)
                Box.Position = Vector2.new(HRPPosition.X - OutlBoxine.Size.X / 2, HRPPosition.Y - Box.Size.Y / 2)

                local person = Players[v.Parent.Name]

                if person.TeamColor ~= game.Players.LocalPlayer.TeamColor then
                    Box.Color = Color3.fromRGB(255,0,0)
                else
                    Box.Color = Color3.fromRGB(50,205,50)
                end

            end

            HRP.Parent.Humanoid.Died:Connect(function()
                Outline:Remove()
                Box:Remove()
            end)

            game.Players.PlayerRemoved:Connect(function(plr)
                if HRP.Parent.Name == plr.Name then
                    Line:Remove()
                end
            end)
    

        end
    end)
end


return espModule
