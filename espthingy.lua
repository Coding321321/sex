
local espModule = {}

-- // Services 


-- // Variables
local camera = workspace.CurrentCamera


-- // Stuff other than variables
local Create = Drawing.new()


function espModule:CreateLine(Visible, Thickness, Color3, Transparency, HRP)
	print(Visible, Thickness, Color3, Transparency, HRP)
	local Line = Create("Line")
	Line.Visible = Visible
	Line.Thickness = Thickness
	Line.Color = Color3
	Line.Transparency = Transparency
	
	game:GetService("RunService").RenderStepped:Connect(function()
	local vector, OnScreen = camera:worldToViewportPoint(HRP.Position) -- and not v = player :Shrug:
		if OnScreen then
			Line.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
			Line.To = Vector2.new(Vector.x, Vector.Y)
		end
		else
		Line.Visible = false	
	end)

end

return espModule
