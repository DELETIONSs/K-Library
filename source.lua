local UILibrary = {}

function UILibrary:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local CloseButton = Instance.new("TextButton")
    local MinimizeButton = Instance.new("TextButton")
    local Sidebar = Instance.new("Frame")
    local ContentFrame = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local TitleLabel = Instance.new("TextLabel")

    -- ScreenGui
    ScreenGui.Name = "CustomUILibrary"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- MainFrame (Glassy Background)
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.BackgroundTransparency = 0.8
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BorderSizePixel = 0

    -- TopBar
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BackgroundTransparency = 0.7
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BorderSizePixel = 0

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
    Sidebar.BackgroundTransparency = 0.85
    Sidebar.Size = UDim2.new(0, 150, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BorderSizePixel = 0

    UIListLayout.Parent = Sidebar
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Content Frame
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContentFrame.BackgroundTransparency = 0.8
    ContentFrame.Size = UDim2.new(1, -150, 1, -40)
    ContentFrame.Position = UDim2.new(0, 150, 0, 40)
    ContentFrame.BorderSizePixel = 0

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

function UILibrary:AddTab(tabName)
    local TabButton = Instance.new("TextButton")
    local TabContentFrame = Instance.new("Frame")
    local TabUIListLayout = Instance.new("UIListLayout")

    -- Tab Button
    TabButton.Name = tabName
    TabButton.Parent = self.Sidebar
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 0.7
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.Text = tabName
    TabButton.TextSize = 16
    TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)

    -- Tab Content Frame
    TabContentFrame.Name = tabName
    TabContentFrame.Parent = self.ContentFrame
    TabContentFrame.BackgroundTransparency = 1
    TabContentFrame.Size = UDim2.new(1, 0, 1, 0)
    TabContentFrame.Visible = false

    TabUIListLayout.Parent = TabContentFrame
    TabUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Handle Tab Switching
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(self.Tabs) do
            tab.ContentFrame.Visible = false
        end
        TabContentFrame.Visible = true
    end)

    self.Tabs[tabName] = {Button = TabButton, ContentFrame = TabContentFrame}
    return TabContentFrame
end

function UILibrary:AddButton(tabName, text, callback)
    local Button = Instance.new("TextButton")
    local TabContentFrame = self.Tabs[tabName].ContentFrame

    Button.Name = text
    Button.Parent = TabContentFrame
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundTransparency = 0.7
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.Font = Enum.Font.SourceSans
    Button.Text = text
    Button.TextSize = 16
    Button.TextColor3 = Color3.fromRGB(0, 0, 0)

    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

return UILibrary
