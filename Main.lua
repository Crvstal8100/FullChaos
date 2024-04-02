local Chaos = {}

local function Tween(UI, Time, Goal)
	local TweenService = game:GetService("TweenService")

	local tweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

	local Tween = TweenService:Create(UI, tweenInfo, Goal)
	Tween:Play()

	return Tween.Completed
end

local function FindEvent(Event, Events, ReturnIndex)
	local Found = nil
	local Index = nil
	ReturnIndex = ReturnIndex or false

	for i,v in pairs(Events) do
		if v["Name"] == Event["Name"] then
			Index = i
			Found = v
		end
	end

	if ReturnIndex then
		return Index
	else
		return Found
	end
end

local function ChooseEvent(Events, CurrentEvents)
	local ChosenEvent = nil

	repeat
		task.wait()
		ChosenEvent = Events[math.random(1, #Events)]
	until FindEvent(ChosenEvent, CurrentEvents, false) == nil

	return ChosenEvent
end

local function ShowEvent(Event, Frame)
	local TextLabel = Instance.new("TextLabel")

	if Event["Duration"] then
		local Inner = Instance.new("Frame")
		local Outer = Instance.new("Frame")

		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0, 0, 0.0485981293, 0)
		TextLabel.Size = UDim2.new(0.314285755, 0, 0.0467289723, 0)
		TextLabel.Font = Enum.Font.ArialBold
		TextLabel.Text = Event["Name"]
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = 0.600
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Right

		Inner.Name = "Inner"
		Inner.Parent = TextLabel
		Inner.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
		Inner.BackgroundTransparency = 0.100
		Inner.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Inner.BorderSizePixel = 0
		Inner.Position = UDim2.new(1.200001, 0, 0.200000003, 0)
		Inner.Size = UDim2.new(1.66686022, 0, 0.600000024, 0)

		Outer.Name = "Outer"
		Outer.Parent = TextLabel
		Outer.BackgroundColor3 = Color3.fromRGB(218, 218, 218)
		Outer.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Outer.BorderSizePixel = 0
		Outer.Position = UDim2.new(1.20000219, 0, 0.200000003, 0)
		Outer.Size = UDim2.new(1.67376673, 0, 0.240000069, 9)
		Outer.ZIndex = 2
	else
		local Frame2 = Instance.new("Frame")

		Frame2.Parent = Frame
		Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame2.BackgroundTransparency = 1.000
		Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame2.BorderSizePixel = 0
		Frame2.Position = UDim2.new(-0.00571428612, 0, 0, 0)
		Frame2.Size = UDim2.new(0.577142835, 0, 0.0485981293, 0)

		TextLabel.Parent = Frame2
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(1.0301007, 0, -0.0384615399, 0)
		TextLabel.Size = UDim2.new(0.544554532, 0, 0.961538434, 0)
		TextLabel.Font = Enum.Font.ArialBold
		TextLabel.Text = Event["Name"]
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = 0.600
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Right
	end

	return TextLabel
end

function Chaos:CreateUI(Options)
	if game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(Options["Name"] or "ChaosUI") then
		game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(Options["Name"] or "ChaosUI"):Destroy()
	end

	local Information = {
		Cooldown = false,
		CurrentEvents = {},
		Events = {}
	}

	local ChaosUI = Instance.new("ScreenGui")
	local Inner = Instance.new("Frame")
	local Outer = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local Events = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	ChaosUI.Name = Options["Name"] or "ChaosUI"
	ChaosUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ChaosUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Inner.Name = "Inner"
	Inner.Parent = ChaosUI
	Inner.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Inner.BackgroundTransparency = 0.300
	Inner.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Inner.BorderSizePixel = 0
	Inner.Size = UDim2.new(1, 0, -0.00165562914, 36)

	Outer.Name = "Outer"
	Outer.Parent = Inner
	Outer.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
	Outer.BackgroundTransparency = 0.400
	Outer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Outer.BorderSizePixel = 0
	Outer.Size = UDim2.new(0, 0, -0.00165557861, 36)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(49, 49, 49)), ColorSequenceKeypoint.new(0.46, Color3.fromRGB(68, 68, 68)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(49, 49, 49))}
	UIGradient.Parent = Inner

	Events.Name = "Events"
	Events.Parent = ChaosUI
	Events.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Events.BackgroundTransparency = 1.000
	Events.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Events.BorderSizePixel = 0
	Events.Position = UDim2.new(0.881467819, 0, 0.105679706, 0)
	Events.Size = UDim2.new(0.114349179, 0, 0.788620234, 0)

	UIListLayout.Parent = Events
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local Event = {}

	function Event:CreateEvent(Settings)
		if typeof(Settings) ~= "table" then
			return
		end

		table.insert(Information["Events"], Settings)

		local Options = {}

		function Options:DeleteEvent()
			local Index = FindEvent(Settings["Name"], Information["Events"], true)

			if Index then
				table.remove(Information["Events"], Index)
			end
		end

		return Options
	end

	game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
		if Information["Cooldown"] ~= true and #Information["Events"] > 0 then
			Information["Cooldown"] = true
			
			local Completed = Tween(Outer, Options["Cooldown"], {Size = UDim2.new(1, 0, Outer.Size.Y.Scale, 36)})
			Completed:Wait()
			
			Outer.Size = UDim2.new(0, 0, -0.00165557861, 36)
			
			Information["Cooldown"] = false
			
			local ChosenEvent = ChooseEvent(Information["Events"], Information["CurrentEvents"])

			if ChosenEvent then
				table.insert(Information["CurrentEvents"], ChosenEvent)
				local Text = ShowEvent(ChosenEvent, Events)
				
				if ChosenEvent["Duration"] then
					
					coroutine.wrap(function()
						repeat
							task.wait()
							if ChosenEvent and ChosenEvent["Callback"] then
								pcall(ChosenEvent["Callback"]) 
							end
						until FindEvent(ChosenEvent, Information["CurrentEvents"], false) == nil
						if ChosenEvent["EndCallback"] then
							pcall(ChosenEvent["EndCallback"])
						end
					end)()
					
					coroutine.wrap(function()
						local Completed = Tween(Text:FindFirstChild("Outer"), ChosenEvent["Duration"], {Size = UDim2.new(0, 0, 0, 15)})
						Completed:Wait()
						task.delay(ChosenEvent["Disappear"] or 0, function()
							Text:Destroy()
						end)

						local Index = FindEvent(ChosenEvent, Information["CurrentEvents"], true)

						if Index then
							table.remove(Information["CurrentEvents"], Index)
						end
					end)()
				else
					pcall(ChosenEvent["Callback"])
					
					local Index = FindEvent(ChosenEvent, Information["CurrentEvents"], true)

					if Index then
						table.remove(Information["CurrentEvents"], Index)
					end
					
					task.delay(ChosenEvent["Disappear"] or 0, function()
						Text.Parent:Destroy()
					end)
				end
			end
		end
	end)

	return Event
end

return Chaos
