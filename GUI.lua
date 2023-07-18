local function INIT()
    if game.ReplicatedStorage:FindFirstChild(owner.Name.."'s CCCCCGUIREMOTEEVENT") then game.ReplicatedStorage:FindFirstChild(owner.Name.."'s CCCCCGUIREMOTEEVENT"):Destroy() end

    local REMOTE1 : RemoteEvent = Instance.new"RemoteEvent"
    REMOTE1.Name = owner.Name.."'s CCCCCGUIREMOTEEVENT"
    REMOTE1.Parent = game.ReplicatedStorage

    if game.ReplicatedStorage:FindFirstChild(owner.Name.."'s CCCCCGUIREMOTEFUNCTION") then game.ReplicatedStorage:FindFirstChild(owner.Name.."'s CCCCCGUIREMOTEFUNCTION"):Destroy() end

    local REMOTE2 : RemoteFunction = Instance.new"RemoteFunction"
    REMOTE2.Name = owner.Name.."'s CCCCCGUIREMOTEFUNCTION"
    REMOTE2.Parent = game.ReplicatedStorage

    local CHAR do
        if not owner.Character then
            repeat
                task.wait()
            until owner.Character
        end
        CHAR = owner.Character
    end

    local CHARROOT = CHAR:WaitForChild("HumanoidRootPart",0.25)
    if not CHARROOT then
        CHAR = owner.CharacterAdded:Wait()
        CHARROOT = CHAR:WaitForChild("HumanoidRootPart",0.25)

        CHARROOT = CHARROOT.CFrame * CFrame.new(0,3,-16) * CFrame.Angles(math.rad(-10),math.rad(180),0)
    else
        CHARROOT = CHARROOT.CFrame * CFrame.new(0,3,-16) * CFrame.Angles(math.rad(-10),math.rad(180),0)
    end

    local PART = Instance.new"Part"
    PART.CanQuery , PART.CanTouch , PART.CanCollide = false , false , false
    PART.Name = "CCCCCGUI"
    PART.Anchored = true
    PART.Transparency = 1
    PART.Massless = true
    PART.Size = Vector3.new(0,0,0)
    PART.CFrame = CHARROOT
    PART.Parent = script

    local SURFACE = Instance.new"SurfaceGui"
    SURFACE.Adornee = PART
    SURFACE.LightInfluence = 0
    SURFACE.Brightness = 2
    SURFACE.PixelsPerStud = (32+16)*2
    SURFACE.Parent = PART

    local BACKGROUND = Instance.new"Frame"
    BACKGROUND.BorderSizePixel = 0
    BACKGROUND.Size = UDim2.fromScale(1,1)
    BACKGROUND.BackgroundColor3 = Color3.new(0.098039, 0.082352, 0.105882)
    BACKGROUND.Parent = SURFACE

    local TEXT = Instance.new"TextLabel"
    TEXT.BackgroundColor3 = Color3.new(0.164705, 0.215686, 0.101960)
    TEXT.BackgroundTransparency = 0.75
    TEXT.BorderSizePixel = 0
    TEXT.Size = UDim2.fromScale(1,0.03)
    TEXT.AnchorPoint = Vector2.new(0,1)
    TEXT.Position = UDim2.fromScale(0,1)
    TEXT.TextColor3 = Color3.new(0.517647, 1, 0)
    TEXT.TextScaled = true
    TEXT.TextXAlignment = Enum.TextXAlignment.Left
    TEXT.TextDirection =Enum.TextDirection.Auto
    TEXT.Text = "CCCCC :<}-> "
    TEXT.Parent = SURFACE

    runlocal([[
        local SURFACE = workspace:WaitForChild(owner.Name.."'s CCCCC"):WaitForChild("CCCCCGUI"):FindFirstAncestorOfClass("SurfaceGui")

        local TEXTBOX = Instance.new"TextBox"
        TEXTBOX.BackgroundColor3 = Color3.new(0.164705, 0.215686, 0.101960)
        TEXTBOX.BackgroundTransparency = 0.75
        TEXTBOX.BorderSizePixel = 0
        TEXTBOX.Size = UDim2.fromScale(1,0.03)
        TEXTBOX.AnchorPoint = Vector2.new(0,1)
        TEXTBOX.Position = UDim2.fromScale(0,1.03)
        TEXTBOX.TextColor3 = Color3.new(0.517647, 1, 0)
        TEXTBOX.TextScaled = true
        TEXTBOX.Text = ""
        TEXTBOX.PlaceholderText = "Write Command Here"
        TEXTBOX.ZIndex = 3
        TEXTBOX.TextXAlignment = Enum.TextXAlignment.Left
        TEXTBOX.TextDirection = Enum.TextDirection.Auto
        TEXTBOX.Parent = SURFACE

        print(SRUFACE , TEXTBOX)
    ]])

    local divider = 2
    local smoother = 1

    local i = 1
    local speed = 0
    repeat 
        game:GetService"RunService".PreAnimation:Wait()

        i-=(0.005+speed)
        smoother = smoother*(math.sin(smoother+speed)*2)

        PART.Size = Vector3.new( lerp(32 , i/smoother , i  )/divider , lerp(16 , i/smoother, i  )/divider , 0)
        speed +=0.025
    until PART.Size.X >= Vector3.new( 32/divider , 16/divider , 0 ).X and PART.Size.Y >= Vector3.new( 32/divider , 16/divider , 0 ).Y
    PART.Size = Vector3.new(32/divider , 16/divider , 0)
    smoother,i,speed = nil , nil , nil
end

return INIT