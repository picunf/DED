-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local InputBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game:GetService("CoreGui")

-- Рамка
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.05, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 220, 0, 80)
UICorner.Parent = Frame

-- Заголовок
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0.5, 0)
Title.Text = "Скорость: 16"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

-- Поле ввода
InputBox.Parent = Frame
InputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
InputBox.Position = UDim2.new(0.1, 0, 0.55, 0)
InputBox.Size = UDim2.new(0.8, 0, 0.35, 0)
InputBox.Text = "Введите число"
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.Font = Enum.Font.SourceSans
InputBox.TextSize = 18
UICorner:Clone().Parent = InputBox

-- Логика изменения скорости
local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")
local currentSpeed = 16
humanoid.WalkSpeed = currentSpeed

InputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newSpeed = tonumber(InputBox.Text)
        if newSpeed and newSpeed >= 0 and newSpeed <= 50 then
            currentSpeed = newSpeed
            humanoid.WalkSpeed = currentSpeed
            Title.Text = "Скорость: " .. currentSpeed
        else
            InputBox.Text = "Ошибка (0-50)"
            task.wait(1.5)
            InputBox.Text = "Введите число"
        end
    end
end)
