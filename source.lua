local UILibrary = {}

-- Function to make the UI draggable
local function makeDraggable(frame, dragHandle)
    local UIS = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- CreateWindow function
function UILibrary:CreateWindow(title)
    -- Error handling: Check if title is provided
    if not title then
        error("Title is required for the window!")
    end

    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MainFrameCorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local CloseButton = Instance.new("TextButton")
    local MinimizeButton = Instance.new("TextButton")
    local Sidebar = Instance.new("Frame")
    local ContentFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local TabButtons = {} -- To store tab buttons

    -- ScreenGui
    ScreenGui.Name = "CustomUILibrary"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- MainFrame
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BorderSizePixel = 0

    -- MainFrame Corner
    MainFrameCorner.Parent = MainFrame
    MainFrameCorner.CornerRadius = UDim.new(0, 10)

    -- TopBar
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BorderSizePixel = 0

    -- Close Button (White X Icon)
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Size = UDim2.new(0, 40, 1, 0)
    CloseButton.Position = UDim2.new(1, -40, 0, 0)
    CloseButton.Text = ""
    CloseButton.Image = "rbxassetid://6031090057" -- White X Icon

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
    Sidebar.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    Sidebar.Size = UDim2.new(0, 150, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BorderSizePixel = 0

    -- Content Frame
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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

    -- Add tabs to Sidebar
    local function addTab(tabName, content)
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = Sidebar
        TabButton.Name = tabName
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        TabButton.Font = Enum.Font.SourceSansBold
        TabButton.TextSize = 16

        -- When the tab is clicked, show its content
        TabButton.MouseButton1Click:Connect(function()
            for _, button in pairs(TabButtons) do
                button.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
            end
            TabButton.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
            ContentFrame:ClearAllChildren()
            content(ContentFrame)
        end)

        table.insert(TabButtons, TabButton)
    end

    -- Example: Adding some tabs
    addTab("Tab 1", function(parent)
        local Label = Instance.new("TextLabel")
        Label.Parent = parent
        Label.Text = "This is Tab 1 content!"
        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.TextColor3 = Color3.fromRGB(0, 0, 0)
        Label.BackgroundTransparency = 1
    end)

    addTab("Tab 2", function(parent)
        local Label = Instance.new("TextLabel")
        Label.Parent = parent
        Label.Text = "This is Tab 2 content!"
        Label.Size = UDim2.new(1, 0, 1, 0)
        Label.TextColor3 = Color3.fromRGB(0, 0, 0)
        Label.BackgroundTransparency = 1
    end)

    -- Make MainFrame draggable using TopBar
    makeDraggable(MainFrame, TopBar)

    self.MainFrame = MainFrame
    self.Sidebar = Sidebar
    self.ContentFrame = ContentFrame
    return self
end

return UILibrary
