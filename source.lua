local UILibrary = {}

function UILibrary:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MainFrameCorner = Instance.new("UICorner")
    local MainFrameGradient = Instance.new("UIGradient")
    local TopBar = Instance.new("Frame")
    local TopBarCorner = Instance.new("UICorner")
    local TopBarGradient = Instance.new("UIGradient")
    local TopBarBorder = Instance.new("Frame")
    local CloseButton = Instance.new("TextButton")
    local MinimizeButton = Instance.new("TextButton")
    local Sidebar = Instance.new("Frame")
    local SidebarCorner = Instance.new("UICorner")
    local SidebarGradient = Instance.new("UIGradient")
    local SidebarBorder = Instance.new("Frame")
    local ContentFrame = Instance.new("Frame")
    local ContentFrameCorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")

    -- ScreenGui
    ScreenGui.Name = "CustomUILibrary"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- MainFrame (Acrylic Glass Effect)
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.BackgroundTransparency = 0.5
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BorderSizePixel = 0

    -- MainFrame Corner
    MainFrameCorner.Parent = MainFrame
    MainFrameCorner.CornerRadius = UDim.new(0, 10)

    -- MainFrame Gradient
    MainFrameGradient.Parent = MainFrame
    MainFrameGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 240)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    }
    MainFrameGradient.Rotation = 90

    -- TopBar
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BackgroundTransparency = 0.3
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BorderSizePixel = 0

    -- TopBar Corner
    TopBarCorner.Parent = TopBar
    TopBarCorner.CornerRadius = UDim.new(0, 10)

    -- TopBar Gradient
    TopBarGradient.Parent = TopBar
    TopBarGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 240)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    }
    TopBarGradient.Rotation = 90

    -- TopBar Border
    TopBarBorder.Name = "TopBarBorder"
    TopBarBorder.Parent = TopBar
    TopBarBorder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TopBarBorder.BackgroundTransparency = 0.8
    TopBarBorder.Size = UDim2.new(1, 0, 0, 1)
    TopBarBorder.Position = UDim2.new(0, 0, 1, 0)
    TopBarBorder.BorderSizePixel = 0

    -- Close Button
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CloseButton.Size = UDim2.new(0, 40, 1, 0)
    CloseButton.Position = UDim2.new(1, -40, 0, 0)
    CloseButton.Text = "X"
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextSize = 16
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Close Button Functionality
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Minimize Button
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Parent = TopBar
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    MinimizeButton.Size = UDim2.new(0, 40, 1, 0)
    MinimizeButton.Position = UDim2.new(1, -80, 0, 0)
    MinimizeButton.Text = "-"
    MinimizeButton.Font = Enum.Font.SourceSansBold
    MinimizeButton.TextSize = 16
    MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)

    -- Minimize Button Functionality
    local minimized = false
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        MainFrame.Visible = not minimized
    end)

    -- Sidebar
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sidebar.BackgroundTransparency = 0.5
    Sidebar.Size = UDim2.new(0, 150, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BorderSizePixel = 0

    -- Sidebar Corner
    SidebarCorner.Parent = Sidebar
    SidebarCorner.CornerRadius = UDim.new(0, 10)

    -- Sidebar Gradient
    SidebarGradient.Parent = Sidebar
    SidebarGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 240, 240)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
    }
    SidebarGradient.Rotation = 90

    -- Sidebar Border
    SidebarBorder.Name = "SidebarBorder"
    SidebarBorder.Parent = Sidebar
    SidebarBorder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    SidebarBorder.BackgroundTransparency = 0.8
    SidebarBorder.Size = UDim2.new(0, 1, 1, 0)
    SidebarBorder.Position = UDim2.new(1, 0, 0, 0)
    SidebarBorder.BorderSizePixel = 0

    -- Content Frame
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContentFrame.BackgroundTransparency = 0.5
    ContentFrame.Size = UDim2.new(1, -150, 1, -40)
    ContentFrame.Position = UDim2.new(0, 150, 0, 40)
    ContentFrame.BorderSizePixel = 0

    -- ContentFrame Corner
    ContentFrameCorner.Parent = ContentFrame
    ContentFrameCorner.CornerRadius = UDim.new(0, 10)

    -- Title Label
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -80, 1, 0)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.Text = title or "UI Library"
    TitleLabel.TextSize = 20
    TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    self.MainFrame = MainFrame
    self.Sidebar = Sidebar
    self.ContentFrame = ContentFrame
    self.Tabs = {}
    return self
end
