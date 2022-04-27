local espModule = {}

-- // Services 


-- // Variables
local camera = workspace.CurrentCamera


-- // Stuff other than variables


function espModule:CreateLine(Visible, Thickness, Color3, Transparency, HRP)

    local Line = Drawing.new("Line")
    Line.Visible = Visible
    Line.Thickness = Thickness
    Line.Color = Color3
    Line.Transparency = Transparency

    game.RunService.RenderStepped:Connect(function(dt)
        local Vector, OnScreen = workspace.CurrentCamera:worldToViewportPoint(HRP.Position) -- and not v = player :Shrug:
        if OnScreen then
            
            Line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
            
            Line.To = Vector2.new(Vector.x, Vector.Y)
          
    end
end)

end

return espModule
