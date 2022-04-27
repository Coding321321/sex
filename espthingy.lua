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
	
        if Players[HRP.Parent.Name] then
            Line:Remove()
        end
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


return espModule
