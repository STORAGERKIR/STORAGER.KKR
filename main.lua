
-- Create the ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "CustomMenu"

-- Create the Frame (Main Menu)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 700, 0, 750)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -375)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Add Rounded Corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Add Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0.2, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "STORAGER.KKR"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundTransparency = 1
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.Parent = MainFrame

-- Add Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseButton.Parent = MainFrame

-- Make the Frame Draggable from the Title Bar
local dragging, dragInput, dragStart, startPos
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Close Menu Functionality
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Default Keybinds
local menuKeybind = Enum.KeyCode.K
local aimbotKeybind = Enum.KeyCode.T

-- Keybind to Reopen Menu
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == menuKeybind then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- Add a Button to Change Menu Keybind
local ChangeMenuKeybindButton = Instance.new("TextButton")
ChangeMenuKeybindButton.Size = UDim2.new(0.8, 0, 0.1, 0)
ChangeMenuKeybindButton.Position = UDim2.new(0.1, 0, 0.25, 0)
ChangeMenuKeybindButton.Text = "Change Menu Keybind"
ChangeMenuKeybindButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ChangeMenuKeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeMenuKeybindButton.Parent = MainFrame

ChangeMenuKeybindButton.MouseButton1Click:Connect(function()
    ChangeMenuKeybindButton.Text = "Press a Key..."
    local connection
    connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            menuKeybind = input.KeyCode
            ChangeMenuKeybindButton.Text = "Menu Keybind: " .. input.KeyCode.Name
            connection:Disconnect()
        end
    end)
end)

-- Add a Button to Change Aimbot Keybind
local ChangeAimbotKeybindButton = Instance.new("TextButton")
ChangeAimbotKeybindButton.Size = UDim2.new(0.8, 0, 0.1, 0)
ChangeAimbotKeybindButton.Position = UDim2.new(0.1, 0, 0.4, 0)
ChangeAimbotKeybindButton.Text = "Change Aimbot Keybind"
ChangeAimbotKeybindButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ChangeAimbotKeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeAimbotKeybindButton.Parent = MainFrame

ChangeAimbotKeybindButton.MouseButton1Click:Connect(function()
    ChangeAimbotKeybindButton.Text = "Press a Key..."
    local connection
    connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            aimbotKeybind = input.KeyCode
            ChangeAimbotKeybindButton.Text = "Aimbot Keybind: " .. input.KeyCode.Name
            connection:Disconnect()
        end
    end)
end)

-- Add a Button to Toggle ESP
local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.8, 0, 0.1, 0)
ESPButton.Position = UDim2.new(0.1, 0, 0.55, 0)
ESPButton.Text = "ESP: OFF"
ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Parent = MainFrame

local espEnabled = false
ESPButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    ESPButton.Text = "ESP: " .. (espEnabled and "ON" or "OFF")
end)

-- Add a Slider for FOV
local SliderLabel = Instance.new("TextLabel")
SliderLabel.Size = UDim2.new(0.8, 0, 0.05, 0)
SliderLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
SliderLabel.Text = "FOV: 50"
SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderLabel.BackgroundTransparency = 1
SliderLabel.Parent = MainFrame

local Slider = Instance.new("Frame")
Slider.Size = UDim2.new(0.8, 0, 0.05, 0)
Slider.Position = UDim2.new(0.1, 0, 0.9, 0)
Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Slider.Parent = MainFrame

local SliderIndicator = Instance.new("Frame")
SliderIndicator.Size = UDim2.new(0.1, 0, 1, 0)
SliderIndicator.Position = UDim2.new(0.5, 0, 0, 0)
SliderIndicator.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
SliderIndicator.Parent = Slider

local fov = 50
local draggingSlider = false

Slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingSlider = true
    end
end)

Slider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingSlider = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mouseX = input.Position.X
        local sliderStart = Slider.AbsolutePosition.X
        local sliderWidth = Slider.AbsoluteSize.X
        local relativeX = math.clamp((mouseX - sliderStart) / sliderWidth, 0, 1)
        fov = math.floor(10 + (relativeX * 90)) -- Map to range 10-100
        SliderIndicator.Position = UDim2.new(relativeX, 0, 0, 0)
        SliderLabel.Text = "FOV: " .. fov
    end
end)

-- Draw FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.Radius = fov
fovCircle.Color = Color3.fromRGB(255, 0, 0) -- Red circle
fovCircle.Filled = false
fovCircle.Visible = true

game:GetService("RunService").RenderStepped:Connect(function()
    local mouseLocation = game:GetService("UserInputService"):GetMouseLocation()
    fovCircle.Position = Vector2.new(mouseLocation.X, mouseLocation.Y)
    fovCircle.Radius = fov
end)

-- Aimbot Functionality
local holdingAimbotKey = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == aimbotKeybind then
        holdingAimbotKey = true
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.KeyCode == aimbotKeybind then
        holdingAimbotKey = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if holdingAimbotKey then
        local closestPlayer = nil
        local shortestDistance = fov

        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local character = player.Character
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                local screenPoint = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
                local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude

                if distance < shortestDistance then
                    closestPlayer = rootPart
                    shortestDistance = distance
                end
            end
        end

        if closestPlayer then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, closestPlayer.Position)
        end
    end
end)

-- ESP Functionality
local espEnabled = false
local espBoxes = {}

local function createESP(player)
    local box = Drawing.new("Square")
    box.Thickness = 2
    box.Color = Color3.fromRGB(0, 255, 0) -- Green box
    box.Filled = false
    box.Visible = false
    espBoxes[player] = box
end

local function updateESP()
    for player, box in pairs(espBoxes) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local screenPoint, onScreen = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)
            if onScreen and espEnabled then
                box.Size = Vector2.new(50, 50) -- Adjust size as needed
                box.Position = Vector2.new(screenPoint.X - 25, screenPoint.Y - 25)
                box.Visible = true
            else
                box.Visible = false
            end
        else
            box.Visible = false
        end
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        createESP(player)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    if player ~= game.Players.LocalPlayer then
        createESP(player)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    if espBoxes[player] then
        espBoxes[player]:Remove()
        espBoxes[player] = nil
    end
end)

game:GetService("RunService").RenderStepped:Connect(updateESP)

-- Add a Button to Toggle ESP
local ESPButton = Instance.new("TextButton")
ESPButton.Size = UDim2.new(0.8, 0, 0.1, 0)
ESPButton.Position = UDim2.new(0.1, 0, 0.55, 0)
ESPButton.Text = "ESP: OFF"
ESPButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Parent = MainFrame

ESPButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    ESPButton.Text = "ESP: " .. (espEnabled and "ON" or "OFF")
end)

-- Flying Functionality
local flying = false
local flySpeed = 50 -- Default flying speed

local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
bodyVelocity.Velocity = Vector3.zero

local bodyGyro = Instance.new("BodyGyro")
bodyGyro.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
bodyGyro.CFrame = CFrame.new()

local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0.8, 0, 0.1, 0)
FlyButton.Position = UDim2.new(0.1, 0, 0.65, 0)
FlyButton.Text = "Fly: OFF"
FlyButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Parent = MainFrame

FlyButton.MouseButton1Click:Connect(function()
    flying = not flying
    FlyButton.Text = "Fly: " .. (flying and "ON" or "OFF")
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if flying then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character.HumanoidRootPart

            -- Attach BodyVelocity and BodyGyro
            bodyVelocity.Parent = rootPart
            bodyGyro.Parent = rootPart

            -- Update Velocity and Rotation
            local moveDirection = Vector3.zero
            local userInputService = game:GetService("UserInputService")

            if userInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + workspace.CurrentCamera.CFrame.LookVector
            end
            if userInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - workspace.CurrentCamera.CFrame.LookVector
            end
            if userInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - workspace.CurrentCamera.CFrame.RightVector
            end
            if userInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + workspace.CurrentCamera.CFrame.RightVector
            end
            if userInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end

            if moveDirection.Magnitude > 0 then
                bodyVelocity.Velocity = moveDirection.Unit * flySpeed
            else
                bodyVelocity.Velocity = Vector3.zero
            end

            bodyGyro.CFrame = workspace.CurrentCamera.CFrame
        end
    else
        -- Detach BodyVelocity and BodyGyro
        bodyVelocity.Parent = nil
        bodyGyro.Parent = nil
    end
end)

-- Add a Slider for Flying Speed
local FlySpeedLabel = Instance.new("TextLabel")
FlySpeedLabel.Size = UDim2.new(0.8, 0, 0.05, 0)
FlySpeedLabel.Position = UDim2.new(0.1, 0, 0.75, 0)
FlySpeedLabel.Text = "Fly Speed: " .. flySpeed
FlySpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedLabel.BackgroundTransparency = 1
FlySpeedLabel.Parent = MainFrame

local FlySpeedSlider = Instance.new("Frame")
FlySpeedSlider.Size = UDim2.new(0.8, 0, 0.05, 0)
FlySpeedSlider.Position = UDim2.new(0.1, 0, 0.8, 0)
FlySpeedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlySpeedSlider.Parent = MainFrame

local FlySpeedIndicator = Instance.new("Frame")
FlySpeedIndicator.Size = UDim2.new(0.1, 0, 1, 0)
FlySpeedIndicator.Position = UDim2.new(0.5, 0, 0, 0)
FlySpeedIndicator.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
FlySpeedIndicator.Parent = FlySpeedSlider

local draggingFlySpeed = false

FlySpeedSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFlySpeed = true
    end
end)

FlySpeedSlider.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFlySpeed = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if draggingFlySpeed and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mouseX = input.Position.X
        local sliderStart = FlySpeedSlider.AbsolutePosition.X
        local sliderWidth = FlySpeedSlider.AbsoluteSize.X
        local relativeX = math.clamp((mouseX - sliderStart) / sliderWidth, 0, 1)
        flySpeed = math.floor(10 + (relativeX * 190)) -- Map to range 10-200
        FlySpeedIndicator.Position = UDim2.new(relativeX, 0, 0, 0)
        FlySpeedLabel.Text = "Fly Speed: " .. flySpeed
    end
end)

-- Noclip Functionality
local noclipEnabled = false

local NoclipButton = Instance.new("TextButton")
NoclipButton.Size = UDim2.new(0.8, 0, 0.1, 0)
NoclipButton.Position = UDim2.new(0.1, 0, 0.85, 0)
NoclipButton.Text = "Noclip: OFF"
NoclipButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
NoclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipButton.Parent = MainFrame

NoclipButton.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    NoclipButton.Text = "Noclip: " .. (noclipEnabled and "ON" or "OFF")
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false -- Disable collisions
                end
            end
        end
    end
end)
