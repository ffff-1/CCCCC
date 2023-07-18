local SURFACE = workspace:FindFirstChild(owner.Name.."'s CCCCC"):FindFirstChild("CCCCCGUI"):FindFirstAncestorOfClass("SurfaceGuiBase")

local TEXTBOX = Instance.new"TextBox"
TEXTBOX.BackgroundColor3 = Color3.new(0.164705, 0.215686, 0.101960)
TEXTBOX.BackgroundTransparency = 0.75
TEXTBOX.BorderSizePixel = 0
TEXTBOX.Size = UDim2.fromScale(1,0.03)
TEXTBOX.AnchorPoint = Vector2.new(0,1)
TEXTBOX.Position = UDim2.fromScale(0,1)
TEXTBOX.TextColor3 = Color3.new(0.517647, 1, 0)
TEXTBOX.TextScaled = true
TEXTBOX.TextXAlignment = Enum.TextXAlignment.Left
TEXTBOX.TextDirection =Enum.TextDirection.Auto
TEXTBOX.Parent = SURFACE