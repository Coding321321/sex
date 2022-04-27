local espModule = {}

-- // Services 


-- // Variables
local camera = camera


-- // Stuff other than variables


function espModule:CreateLine(Visible, Thickness, Color3, Transparency, HRP)

    local Line = Drawing.new("Line")
    Line.Visible = Visible
    Line.Thickness = Thickness
    Line.Color = Color3
    Line.Transparency = Transparency

    game.RunService.RenderStepped:Connect(function(dt)
        local Vector, OnScreen = camera:worldToViewportPoint(HRP.Position) -- and not v = player :Shrug:
        if OnScreen then
            
            Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
            
            Line.To = Vector2.new(Vector.x, Vector.Y)
          
    end
end)

end

function espModule:CreateCircle(Visible, Thickness, Color3, Transparency, Filled, Radius, Position)

    if Position == nil then
        Position = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    end

    local Circle = Drawing.new("Circle")
    Circle.Visible = Visible
    Circle.Thickness = Thickness
    Circle.Color3 = Color3
    Circle.Transparency = Transparency
    Circle.Filled = Filled
    Circle.Radius = Radius
    Circle.Position = Position

end

function espModule:CreateBox(Visible, Transparency, Color3, Thickness, Size, Item, Filled, Type)
    
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Thickness = Thickness
    BoxOutline.Filled = Filled
    BoxOutline.Color = Color3
    BoxOutline.Visible = Visible
    BoxOutline.Transparency = Transparency

    local Box = Drawing.new("Square")
    Box.Thickness = 1
    Box.Filled = false
    Box.Color = Color3.fromRGB(1,1,1)
    Box.Visible = false
    Box.Transparency = 1

    game:GetService"RunService".RenderStepped:Connect(function(dt)
       if Type == "Tool" then
        for i, v in pairs(Item:GetDescendants()) do
            if v:IsA("BasePart") and v.Name == "Handle" then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Position)
                if OnScreen then
                    BoxOutline.Size = Vector2.new(1000 / v.Size.Z, v.Size.Y)
                    BoxOutline.Position = Vector2.new(v.Position.X - BoxOutline.Size.X / 2, v.Position.Y - BoxOutline.Size.Y)
            
                    Box.Size = Vector2.new(1000 / v.Size.Z, v.Size.Y)
                    Box.Position = Vector2.new(v.Position.X - Box.Size.X / 2, v.Position.Y - Box.Size.Y)
                end
            elseif Type == "Player" then
                for i, v in pairs(game.Players:GetChildren()) do
                    if v.Character and v.Character:FindFirstChild"Humanoid" and v.Character:FindFirstChild"HumanoidRootPart" and v ~= game.Players.LocalPlayer and v.Character.Humanoid.Health > 0 then
                        local char = v.Character
                        local Vector, OnScreen = camera:worldToViewportPoint(char.HumanoidRootPart.Position)
                        
                        local offset1 = Vector3.new(0, 0.5, 0)
                        local offset2 = Vector3.new(0, 3, 0)

                        local HRP = char.HumanoidRootPart
                        local Head = char.Head
                        local HRPPos, HRPVis = worldToViewportPoint(camera, HRP.Position)
                        local HeadPos = worldToViewportPoint(camera, Head.Position + offset1)
                        local LegPos = worldToViewportPoint(camera, HRP.Position - offset2)
                        

                        if OnScreen then
                            BoxOutline.Size = Vector2.new(1000 / v.Size.Z, v.Size.Y)
                            BoxOutline.Position = Vector2.new(v.Position.X - BoxOutline.Size.X / 2, v.Position.Y - BoxOutline.Size.Y)
            
                            Box.Size = Vector2.new(1000 / v.Size.Z, v.Size.Y)
                            Box.Position = Vector2.new(v.Position.X - Box.Size.X / 2, v.Position.Y - Box.Size.Y)
                        else
                            Box.Visible = false
                            BoxOutline.Visible = false        
                        end
                    else
                        Box.Visible = false
                        BoxOutline.Visible = false        
                    end
                    Box.Visible = false
                    BoxOutline.Visible = false        
                end
            end
        end
       end
        
    end)

end

return espModule
