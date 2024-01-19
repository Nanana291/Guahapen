local Library = {}





function Library.Set_Defaults(Defaults,Settings)

	if Settings and type(Settings) == "table" then else Settings = {} end

	for i,v in pairs(Defaults) do

		if Settings[i] == nil then

			Settings[i] = v

		end

	end

	return Settings

end



function Library:Tween(Obj,Style,Info,Callback)

	local Tw = game:GetService("TweenService"):Create(Obj,TweenInfo.new(Style[1],Enum.EasingStyle[Style[2]]),Info)

	Tw.Completed:Connect(Callback or function() end)

	Tw:Play()

end



function Library:Start(Main_Info)

	local Main_Settings = Library.Set_Defaults({Name = "Demonic HUB V2",Logo = 9421581064},Main_Info)

	local Gui = {CurrentTab = nil,UI_Status = true,Stop_Dragging = false}

	

	--// Drag Script \\--

	

	function Gui:AddDrag(Frame)

		local dragToggle

		local dragStart

		local startPos



		local function updateInput(input)

			if Gui.Stop_Dragging then return end

			local delta = input.Position - dragStart

			Library:Tween(Frame,{.1,"Linear"},{Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,startPos.Y.Scale, startPos.Y.Offset + delta.Y)})

		end



		Frame.InputBegan:Connect(function(input)

			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch  then

				dragToggle = true

				dragStart = input.Position

				startPos = Frame.Position

				input.Changed:Connect(function()

					if input.UserInputState == Enum.UserInputState.End then

						dragToggle = false

					end

				end)

			end

		end)



		game:GetService("UserInputService").InputChanged:Connect(function(input)

			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then

				if dragToggle then

					updateInput(input)

				end

			end

		end)



	end

	

	--// GUI \\--

	

	do

		-- StarterGui.Domenic HUB

		Gui["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"));

		Gui["1"]["IgnoreGuiInset"] = true;

		Gui["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;

		Gui["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Global

		Gui["1"]["Name"] = [[Domenic HUB]];



		-- StarterGui.Domenic HUB.Main

		Gui["2"] = Instance.new("Frame", Gui["1"]);

		Gui["2"]["BorderSizePixel"] = 0;

		Gui["2"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);

		Gui["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

		Gui["2"]["Size"] = UDim2.new(0, 520, 0, 320);

		Gui["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["2"]["Position"] = UDim2.new(0.4997635781764984, 0, 0.4994784891605377, 0);

		Gui["2"]["Name"] = [[Main]];



		-- StarterGui.Domenic HUB.Main.Title Holder

		Gui["3"] = Instance.new("Frame", Gui["2"]);

		Gui["3"]["BorderSizePixel"] = 0;

		Gui["3"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

		Gui["3"]["Size"] = UDim2.new(1, 0, 0.10000000149011612, 0);

		Gui["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["3"]["Name"] = [[Title Holder]];



		-- StarterGui.Domenic HUB.Main.Title Holder.UICorner

		Gui["4"] = Instance.new("UICorner", Gui["3"]);

		Gui["4"]["CornerRadius"] = UDim.new(0, 6);



		-- StarterGui.Domenic HUB.Main.Title Holder.Title

		Gui["5"] = Instance.new("TextLabel", Gui["3"]);

		Gui["5"]["BorderSizePixel"] = 0;

		Gui["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

		Gui["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;

		Gui["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/JosefinSans.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);

		Gui["5"]["TextSize"] = 14;

		Gui["5"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

		Gui["5"]["Size"] = UDim2.new(0.9769230484962463, 0, 0.9833332300186157, 0);

		Gui["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["5"]["Text"] = tostring(Main_Settings.Name);

		Gui["5"]["Name"] = [[Title]];

		Gui["5"]["BackgroundTransparency"] = 1;

		Gui["5"]["Position"] = UDim2.new(0.023076923564076424, 0, 0, 0);



		-- StarterGui.Domenic HUB.Main.Title Holder.Title.UIPadding

		Gui["6"] = Instance.new("UIPadding", Gui["5"]);

		Gui["6"]["PaddingTop"] = UDim.new(0, 5);



		-- StarterGui.Domenic HUB.Main.Title Holder.Line

		Gui["7"] = Instance.new("Frame", Gui["3"]);

		Gui["7"]["BorderSizePixel"] = 0;

		Gui["7"]["BackgroundColor3"] = Color3.fromRGB(81, 81, 81);

		Gui["7"]["Size"] = UDim2.new(1, 0, 0.10666639357805252, 0);

		Gui["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["7"]["Position"] = UDim2.new(0, 0, 0.9833335876464844, 0);

		Gui["7"]["Name"] = [[Line]];



		-- StarterGui.Domenic HUB.Main.DropShadowHolder

		Gui["8"] = Instance.new("Frame", Gui["2"]);

		Gui["8"]["ZIndex"] = 0;

		Gui["8"]["BorderSizePixel"] = 0;

		Gui["8"]["BackgroundTransparency"] = 1;

		Gui["8"]["Size"] = UDim2.new(1, 0, 1, 0);

		Gui["8"]["Name"] = [[DropShadowHolder]];



		-- StarterGui.Domenic HUB.Main.DropShadowHolder.DropShadow

		Gui["9"] = Instance.new("ImageLabel", Gui["8"]);

		Gui["9"]["ZIndex"] = 0;

		Gui["9"]["BorderSizePixel"] = 0;

		Gui["9"]["SliceCenter"] = Rect.new(49, 49, 450, 450);

		Gui["9"]["ScaleType"] = Enum.ScaleType.Slice;

		Gui["9"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["9"]["ImageTransparency"] = 0.5;

		Gui["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

		Gui["9"]["Image"] = [[rbxassetid://6015897843]];

		Gui["9"]["Size"] = UDim2.new(1, 47, 1, 47);

		Gui["9"]["Name"] = [[DropShadow]];

		Gui["9"]["BackgroundTransparency"] = 1;

		Gui["9"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);



		-- StarterGui.Domenic HUB.Main.UICorner

		Gui["a"] = Instance.new("UICorner", Gui["2"]);

		Gui["a"]["CornerRadius"] = UDim.new(0, 6);

		

		--//Navigation\\--

		

		-- StarterGui.Domenic HUB.Main.Navigation

		Gui["b"] = Instance.new("Frame", Gui["2"]);

		Gui["b"]["BorderSizePixel"] = 0;

		Gui["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

		Gui["b"]["BackgroundTransparency"] = 1;

		Gui["b"]["Size"] = UDim2.new(0.2890684902667999, 0, 0.828499972820282, 0);

		Gui["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["b"]["Position"] = UDim2.new(0.023076923564076424, 0, 0.13887500762939453, 0);

		Gui["b"]["Name"] = [[Navigation]];

		

		-- StarterGui.Domenic HUB.Main.Navigation.Line

		Gui["1e"] = Instance.new("Frame", Gui["b"]);

		Gui["1e"]["BorderSizePixel"] = 0;

		Gui["1e"]["BackgroundColor3"] = Color3.fromRGB(81, 81, 81);

		Gui["1e"]["Size"] = UDim2.new(0.020000001415610313, 0, 1.0754376649856567, 0);

		Gui["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["1e"]["Position"] = UDim2.new(1.0700000524520874, 0, -0.03605913370847702, 0);

		Gui["1e"]["Name"] = [[Line]];

		

		-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder

		Gui["c"] = Instance.new("ScrollingFrame", Gui["b"]);

		Gui["c"]["Active"] = true;

		Gui["c"]["BorderSizePixel"] = 0;

		Gui["c"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);

		Gui["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

		Gui["c"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;

		Gui["c"]["BackgroundTransparency"] = 1;

		Gui["c"]["Size"] = UDim2.new(1, 0, 1, 0);

		Gui["c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["c"]["ScrollBarThickness"] = 0;

		Gui["c"]["Name"] = [[Tabs Holder]];



		-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.UIListLayout

		Gui["d"] = Instance.new("UIListLayout", Gui["c"]);

		Gui["d"]["Padding"] = UDim.new(0, 8);

		Gui["d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		

		-- StarterGui.Domenic HUB.Main.Options Holder

		Gui["1f"] = Instance.new("Frame", Gui["2"]);

		Gui["1f"]["BorderSizePixel"] = 0;

		Gui["1f"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);

		Gui["1f"]["AnchorPoint"] = Vector2.new(1, 0);

		Gui["1f"]["BackgroundTransparency"] = 0.800000011920929;

		Gui["1f"]["Size"] = UDim2.new(0.662, 0, 0.897, 0);

		Gui["1f"]["ClipsDescendants"] = true;

		Gui["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["1f"]["Position"] = UDim2.new(1, 0, 0.10287126898765564, 0);

		Gui["1f"]["Name"] = [[Options Holder]];

		

		-- StarterGui.Domenic HUB.Main.Logo

		Gui["Logo"] = Instance.new("ImageButton", Gui["1"]);

		Gui["Logo"]["BorderSizePixel"] = 0;

		Gui["Logo"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

		Gui["Logo"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

		Gui["Logo"]["Image"] = "rbxassetid://"..tostring(Main_Settings.Logo);

		Gui["Logo"]["Size"] = UDim2.new(0, 40, 0, 40);

		Gui["Logo"]["Name"] = [[Logo]];

		Gui["Logo"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		Gui["Logo"]["Position"] = UDim2.fromOffset(math.floor(Gui["3"].AbsolutePosition.X)-40,math.floor(Gui["3"].AbsolutePosition.Y)+80)



		-- StarterGui.Domenic HUB.Main.Logo.UICorner

		Gui["Logo_Corner"] = Instance.new("UICorner", Gui["Logo"]);

		Gui["Logo_Corner"]["CornerRadius"] = UDim.new(0, 16);

		

		Gui["2"]:GetPropertyChangedSignal("Position"):Connect(function()

			Gui["Logo"].Position = UDim2.fromOffset(math.floor(Gui["3"].AbsolutePosition.X)-40,math.floor(Gui["3"].AbsolutePosition.Y)+80)

		end)

		

		Gui["Logo"].Activated:Connect(function()

			if Gui.UI_Status then

				Gui["3"]["Visible"] = false

				Gui["8"]["Visible"] = false

				Library:Tween(Gui["2"],{.6,"Quart","InOut"},{Size = UDim2.new()},function()

					Gui["2"]["Visible"] = false

					Gui.UI_Status = false

				end)

			else

				Gui["2"]["Visible"] = true

				Gui["3"]["Visible"] = true

				Gui["8"]["Visible"] = true

				Library:Tween(Gui["2"],{.8,"Quart","InOut"},{Size = UDim2.new(0, 520, 0, 320)},function()

					Gui.UI_Status = true

				end)

			end

		end)

		

		Gui["d"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

			Gui["c"]["CanvasSize"] = UDim2.fromOffset(0,Gui["d"].AbsoluteContentSize.Y+5)

		end)

		

	end

	

	--// Tab Script \\--

	

	function Gui:Tab(Tab_Info)

		local Tab_Settings = Library.Set_Defaults({Name = "Tab",Icon = 14355589134},Tab_Info)

		local Tab = {IsActive = false}

		

		--// Generate Tab \\--

		

		do

			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab

			Tab["16"] = Instance.new("TextButton", Gui["c"]);

			Tab["16"]["Active"] = false;

			Tab["16"]["BorderSizePixel"] = 0;

			Tab["16"]["AutoButtonColor"] = false;

			Tab["16"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

			Tab["16"]["TextSize"] = 14;

			Tab["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

			Tab["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

			Tab["16"]["Selectable"] = false;

			Tab["16"]["Size"] = UDim2.new(1, 0, 0.14000000059604645, 0);

			Tab["16"]["Name"] = [[Tab]];

			Tab["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

			Tab["16"]["Text"] = [[]];

			Tab["16"]["BackgroundTransparency"] = 0.4000000059604645;



			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.UIPadding

			Tab["17"] = Instance.new("UIPadding", Tab["16"]);





			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.Logo

			Tab["18"] = Instance.new("ImageLabel", Tab["16"]);

			Tab["18"]["ZIndex"] = 2;

			Tab["18"]["BorderSizePixel"] = 0;

			Tab["18"]["BackgroundColor3"] = Color3.fromRGB(201, 201, 201);

			Tab["18"]["Image"] = "rbxassetid://"..tostring(Tab_Settings.Icon);

			Tab["18"]["Size"] = UDim2.new(0.1599999964237213, 0, 0.75, 0);

			Tab["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

			Tab["18"]["Name"] = [[Logo]];

			Tab["18"]["BackgroundTransparency"] = 1;

			Tab["18"]["Position"] = UDim2.new(0.04673658311367035, 0, 0.12082616239786148, 0);



			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.Logo.UICorner

			Tab["19"] = Instance.new("UICorner", Tab["18"]);

			Tab["19"]["CornerRadius"] = UDim.new(0, 4);



			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.UICorner

			Tab["1a"] = Instance.new("UICorner", Tab["16"]);

			Tab["1a"]["CornerRadius"] = UDim.new(0, 7);



			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.TextLabel

			Tab["1b"] = Instance.new("TextLabel", Tab["16"]);

			Tab["1b"]["TextWrapped"] = true;

			Tab["1b"]["BorderSizePixel"] = 0;

			Tab["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

			Tab["1b"]["TextXAlignment"] = Enum.TextXAlignment.Left;

			Tab["1b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

			Tab["1b"]["TextSize"] = 14;

			Tab["1b"]["TextColor3"] = Color3.fromRGB(151, 151, 151);

			Tab["1b"]["Size"] = UDim2.new(0.5000000596046448, 0, 1, 0);

			Tab["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

			Tab["1b"]["Text"] = tostring(Tab_Settings.Name);

			Tab["1b"]["BackgroundTransparency"] = 1;

			Tab["1b"]["Position"] = UDim2.new(0.4002097547054291, 0, 0, 0);



			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.TextLabel.UICorner

			Tab["1c"] = Instance.new("UICorner", Tab["1b"]);

			Tab["1c"]["CornerRadius"] = UDim.new(0, 7);



			-- StarterGui.Domenic HUB.Main.Navigation.Tabs Holder.Deactivated Tab.TextLabel.UIPadding

			Tab["1d"] = Instance.new("UIPadding", Tab["1b"]);

			Tab["1d"]["PaddingTop"] = UDim.new(0, 2);

			

			-- StarterGui.Domenic HUB.Main.Options Holder.Options

			Tab["20"] = Instance.new("ScrollingFrame", Gui["1f"]);

			Tab["20"]["BorderSizePixel"] = 0;

			Tab["20"]["CanvasSize"] = UDim2.new(0, 0, 0, 700);

			Tab["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

			Tab["20"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;

			Tab["20"]["BackgroundTransparency"] = 1;

			Tab["20"]["Size"] = UDim2.new(1, 0, 1, 0);

			Tab["20"]["ScrollBarImageColor3"] = Color3.fromRGB(201, 201, 201);

			Tab["20"]["Selectable"] = false;

			Tab["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

			Tab["20"]["ScrollBarThickness"] = 1;

			Tab["20"]["Position"] = UDim2.new(0, 0, 0.007, 0);

			Tab["20"]["Name"] = [[Options]];

			Tab["20"]["SelectionGroup"] = false;

			Tab["20"]["Visible"] = false;

			

			-- StarterGui.Domenic HUB.Main.Options Holder.Options.UIListLayout

			Tab["21"] = Instance.new("UIListLayout", Tab["20"]);

			Tab["21"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;

			Tab["21"]["Padding"] = UDim.new(0, 8);

			Tab["21"]["SortOrder"] = Enum.SortOrder.LayoutOrder;



			-- StarterGui.Domenic HUB.Main.Options Holder.Options.UIPadding

			Tab["22"] = Instance.new("UIPadding", Tab["20"]);

			Tab["22"]["PaddingTop"] = UDim.new(0, 10);

			

			Tab["21"]:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

				Tab["20"]["CanvasSize"] = UDim2.fromOffset(0,Tab["21"].AbsoluteContentSize.Y+22)

			end)

		end

		

		--// Tab Script \\--

		

		do

			function Tab:Off()

				Gui.CurrentTab = nil

				Tab["20"]["Visible"] = false

				Library:Tween(Tab["1b"],{.3,"Linear","InOut"},{TextColor3 = Color3.fromRGB(150, 150, 150)})

			end

			

			Tab["16"].MouseEnter:Connect(function()

				Library:Tween(Tab["16"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(20, 20, 20)})

				Gui.Stop_Dragging = true

			end)

			

			Tab["16"].MouseLeave:Connect(function()

				Library:Tween(Tab["16"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(30, 30, 30)})

				Gui.Stop_Dragging = false

			end)

			

			Tab["16"].MouseButton1Click:Connect(function()

				if Gui.CurrentTab then Gui.CurrentTab:Off() end

				Gui.CurrentTab = Tab

				Tab["20"]["Visible"] = true

				Library:Tween(Tab["1b"],{.3,"Linear","InOut"},{TextColor3 = Color3.fromRGB(200, 200, 200)})

			end)

			

			if (not Gui.CurrentTab) then Gui.CurrentTab = Tab;Tab["20"]["Visible"] = true;Tab["1b"]["TextColor3"] = Color3.fromRGB(200,200,200) end

		end

		

		--// Section \\--

		

		function Tab:Section(Section_Info)

			local Section_Settings = Library.Set_Defaults({Name = "Section"},Section_Info)

			local Section = {}

			

			--// Generate Section \\--

			

			do

				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section

				Section["23"] = Instance.new("Frame", Tab["20"]);

				Section["23"]["BorderSizePixel"] = 0;

				Section["23"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

				Section["23"]["Size"] = UDim2.new(0.949999988079071, 0, 0.210999995470047, 0);

				Section["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Section["23"]["Position"] = UDim2.new(0.02499994821846485, 0, 0, 0);

				Section["23"]["Name"] = [[Section]];



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.UICorner

				Section["24"] = Instance.new("UICorner", Section["23"]);





				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Title Holder

				Section["25"] = Instance.new("Frame", Section["23"]);

				Section["25"]["BorderSizePixel"] = 0;

				Section["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

				Section["25"]["BackgroundTransparency"] = 1;

				Section["25"]["Size"] = UDim2.new(1, 0, 0.20000000298023224, 0);

				Section["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Section["25"]["Name"] = [[Title Holder]];



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Title Holder.Title

				Section["26"] = Instance.new("TextLabel", Section["25"]);

				Section["26"]["TextWrapped"] = true;

				Section["26"]["BorderSizePixel"] = 0;

				Section["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

				Section["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);

				Section["26"]["TextSize"] = 14;

				Section["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);

				Section["26"]["Size"] = UDim2.new(0, 169, 0, 36);

				Section["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Section["26"]["Text"] = tostring(Section_Settings.Name);

				Section["26"]["Name"] = [[Title]];

				Section["26"]["BackgroundTransparency"] = 1;

				Section["26"]["Position"] = UDim2.new(0.241628497838974, 0, 0, 0);



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Title Holder.Title.UIPadding

				Section["27"] = Instance.new("UIPadding", Section["26"]);





				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Title Holder.Right Line

				Section["28"] = Instance.new("Frame", Section["25"]);

				Section["28"]["BorderSizePixel"] = 0;

				Section["28"]["BackgroundColor3"] = Color3.fromRGB(81, 81, 81);

				Section["28"]["Size"] = UDim2.new(0, 72, 0, 3);

				Section["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Section["28"]["Position"] = UDim2.new(0, 248, 0, 18);

				Section["28"]["Name"] = [[Right Line]];



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Title Holder.Left Line

				Section["29"] = Instance.new("Frame", Section["25"]);

				Section["29"]["BorderSizePixel"] = 0;

				Section["29"]["BackgroundColor3"] = Color3.fromRGB(81, 81, 81);

				Section["29"]["Size"] = UDim2.new(0, 72, 0, 3);

				Section["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Section["29"]["Position"] = UDim2.new(0, 7, 0, 18);

				Section["29"]["Name"] = [[Left Line]];



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items

				Section["2a"] = Instance.new("Frame", Section["23"]);

				Section["2a"]["BorderSizePixel"] = 0;

				Section["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

				Section["2a"]["BackgroundTransparency"] = 1;

				Section["2a"]["Size"] = UDim2.new(1, 0, 0.9999999403953552, 0);

				Section["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

				Section["2a"]["Name"] = [[Items]];



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.UICorner

				Section["2b"] = Instance.new("UICorner", Section["2a"]);

				Section["2b"]["CornerRadius"] = UDim.new(0, 6);



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.UIPadding

				Section["2c"] = Instance.new("UIPadding", Section["2a"]);

				Section["2c"]["PaddingTop"] = UDim.new(0, 40);



				-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.UIListLayout

				Section["2d"] = Instance.new("UIListLayout", Section["2a"]);

				Section["2d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;

				Section["2d"]["Padding"] = UDim.new(0, 12);

				Section["2d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			end

			

			--// Section Script \\--

			

			function Section:Refresh()

				Section["23"]["Size"] = UDim2.new(0.949999988079071, 0, 0.210999995470047, Section["2d"].AbsoluteContentSize.Y);

			end

			

			--// Label \\--

			

			function Section:Label(Label_Info)

				local Label_Settings = Library.Set_Defaults({Name = "Label"},Label_Info)

				local Label = {}

				

				--// Generate Label \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Label

					Label["2e"] = Instance.new("TextLabel", Section["2a"]);

					Label["2e"]["TextWrapped"] = true;

					Label["2e"]["BorderSizePixel"] = 0;

					Label["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Label["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;

					Label["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);

					Label["2e"]["RichText"] = true

					Label["2e"]["TextSize"] = 14;

					Label["2e"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Label["2e"]["Text"] = tostring(Label_Settings.Name)

					Label["2e"]["Size"] = UDim2.new(0, 305, 0, 40);

					Label["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Label["2e"]["Name"] = [[Label]];

					Label["2e"]["BackgroundTransparency"] = 1;

					Label["2e"]["Position"] = UDim2.new(0.2500000596046448, 0, 0, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Label.UIPadding

					Label["2f"] = Instance.new("UIPadding", Label["2e"]);

					Label["2f"]["PaddingTop"] = UDim.new(0, 5);

					

					Section:Refresh()

				end

				

				--// Label Script \\--

				

				Label["2e"]:GetPropertyChangedSignal("Text"):Connect(function()

					Label["2e"].Size = UDim2.fromOffset(305,26+Label["2e"].TextBounds.Y)

					Section:Refresh()

				end)

				

				function Label:Refresh(Label_Refresh_Info)

					local Label_Refresh_Settings = Library.Set_Defaults({Name = "Label"},Label_Refresh_Info)

					Label["2e"]["Text"] = tostring(Label_Refresh_Settings.Name)

					Label["2e"].Size = UDim2.fromOffset(305,26+Label["2e"].TextBounds.Y)

					Section:Refresh()

				end

				

				return Label

			end

			

			function Section:Button(Button_Info,Callback)

				local Button_Settings = Library.Set_Defaults({Name = "Button"},Button_Info)

				if type(Callback) == "function" then else Callback = function() print("Clicked!") end end

				local Button = {}

				

				

				--// Generate Button \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Button

					Button["30"] = Instance.new("TextButton", Section["2a"]);

					Button["30"]["TextWrapped"] = true;

					Button["30"]["Active"] = false;

					Button["30"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;

					Button["30"]["BorderSizePixel"] = 0;

					Button["30"]["AutoButtonColor"] = false;

					Button["30"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);

					Button["30"]["TextSize"] = 14;

					Button["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Button["30"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Button["30"]["Size"] = UDim2.new(0, 305, 0, 40);

					Button["30"]["Name"] = [[Button]];

					Button["30"]["Text"] = tostring(Button_Settings.Name)

					Button["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Button["30"]["Position"] = UDim2.new(0.19414122402668, 0, 0.20089398324489594, 0);

					Button["30"]["BackgroundTransparency"] = 0.6000000238418579;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Button.UICorner

					Button["31"] = Instance.new("UICorner", Button["30"]);

					

					Section:Refresh()

				end

				

				--// Button Script \\--

				

				Button["30"].MouseEnter:Connect(function()

					Library:Tween(Button["30"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

					Gui.Stop_Dragging = true

				end)

				

				Button["30"].MouseLeave:Connect(function()

					Library:Tween(Button["30"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Gui.Stop_Dragging = false

				end)

				

				Button["30"].MouseButton1Down:Connect(function()

					Library:Tween(Button["30"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(80, 80, 80)})

				end)

				

				Button["30"].MouseButton1Up:Connect(function()

					Library:Tween(Button["30"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Callback()

				end)

				

				return Button

			end

			

			function Section:Toggle(Toggle_Info,Callback)

				local Toggle_Settings = Library.Set_Defaults({Name = "Toggle",Icon = 14189590169},Toggle_Info)

				if type(Callback) == "function" then else Callback = function(gg) print(gg) end end

				local Toggle = {Status = false}

				

				--// Generate Toggle \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle

					Toggle["32"] = Instance.new("TextButton", Section["2a"]);

					Toggle["32"]["Active"] = false;

					Toggle["32"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;

					Toggle["32"]["BorderSizePixel"] = 0;

					Toggle["32"]["AutoButtonColor"] = false;

					Toggle["32"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);

					Toggle["32"]["TextSize"] = 14;

					Toggle["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Toggle["32"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

					Toggle["32"]["Size"] = UDim2.new(0, 305, 0, 40);

					Toggle["32"]["Name"] = [[Toggle]];

					Toggle["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Toggle["32"]["Text"] = [[]];

					Toggle["32"]["Position"] = UDim2.new(0.19414122402668, 0, 0.20089398324489594, 0);

					Toggle["32"]["BackgroundTransparency"] = 0.6000000238418579;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle.UIStroke

					Toggle["33"] = Instance.new("UIStroke", Toggle["32"]);

					Toggle["33"]["Color"] = Color3.fromRGB(201, 201, 201);

					Toggle["33"]["Thickness"] = 0.800000011920929;

					Toggle["33"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle.UICorner

					Toggle["34"] = Instance.new("UICorner", Toggle["32"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle.Toggle Title

					Toggle["35"] = Instance.new("TextLabel", Toggle["32"]);

					Toggle["35"]["TextWrapped"] = true;

					Toggle["35"]["BorderSizePixel"] = 0;

					Toggle["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Toggle["35"]["TextXAlignment"] = Enum.TextXAlignment.Left;

					Toggle["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Toggle["35"]["TextSize"] = 14;

					Toggle["35"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Toggle["35"]["Size"] = UDim2.new(0.814754068851471, 0, 1, 0);

					Toggle["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Toggle["35"]["Text"] = tostring(Toggle_Settings.Name);

					Toggle["35"]["Name"] = [[Toggle Title]];

					Toggle["35"]["BackgroundTransparency"] = 1;

					Toggle["35"]["Position"] = UDim2.new(0.0526687353849411, 0, 0, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle.Toggle Box

					Toggle["36"] = Instance.new("Frame", Toggle["32"]);

					Toggle["36"]["BorderSizePixel"] = 0;

					Toggle["36"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

					Toggle["36"]["BackgroundTransparency"] = 1

					Toggle["36"]["Size"] = UDim2.new(0, 20, 0, 20);

					Toggle["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Toggle["36"]["Position"] = UDim2.new(0.9020000100135803, 0, 0.25, 0);

					Toggle["36"]["Name"] = [[Toggle Box]];



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle.Toggle Box.Toggle Image

					Toggle["37"] = Instance.new("ImageLabel", Toggle["36"]);

					Toggle["37"]["BorderSizePixel"] = 0;

					Toggle["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Toggle["37"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

					Toggle["37"]["Image"] = "rbxassetid://"..tostring(Toggle_Settings.Icon);

					Toggle["37"]["Visible"] = false

					Toggle["37"]["Size"] = UDim2.new(0.699999988079071, 0, 0.699999988079071, 0);

					Toggle["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Toggle["37"]["Name"] = [[Toggle Image]];

					Toggle["37"]["BackgroundTransparency"] = 1;

					Toggle["37"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Toggle.Toggle Box.UIStroke

					Toggle["38"] = Instance.new("UIStroke", Toggle["36"]);

					Toggle["38"]["Color"] = Color3.fromRGB(201, 201, 201);

					Toggle["38"]["Thickness"] = 0.800000011920929;

					Toggle["38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					

					Section:Refresh()

				end

				

				--// Toggle Script \\--

				

				function Toggle:Set(New_Status)

					Toggle.Status = New_Status

					if Toggle.Status then

						Toggle["36"]["BackgroundTransparency"] = 0

						Toggle["37"]["Visible"] = true

					else

						Toggle["36"]["BackgroundTransparency"] = 1

						Toggle["37"]["Visible"] = false

					end

					Callback(Toggle.Status)

				end

				

				Toggle["32"].MouseEnter:Connect(function()

					Library:Tween(Toggle["32"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

					Gui.Stop_Dragging = true

				end)



				Toggle["32"].MouseLeave:Connect(function()

					Library:Tween(Toggle["32"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Gui.Stop_Dragging = false

				end)



				Toggle["32"].MouseButton1Down:Connect(function()

					Library:Tween(Toggle["32"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(80, 80, 80)})

				end)



				Toggle["32"].MouseButton1Up:Connect(function()

					Library:Tween(Toggle["32"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Toggle.Status = not Toggle.Status

					Toggle:Set(Toggle.Status)

				end)

				

				return Toggle

			end

			

			function Section:Keybind(Keybind_Info,Callback)

				local Keybind_Settings = Library.Set_Defaults({Name = "Keybind"},Keybind_Info)

				if type(Callback) == "function" then else Callback = function(gg) print(gg) end end

				local Keybind = {Connection = nil,Blacklist = {Enum.KeyCode.Unknown, Enum.KeyCode.CapsLock, Enum.KeyCode.Escape, Enum.KeyCode.Tab, Enum.KeyCode.Return, Enum.KeyCode.Backspace, Enum.KeyCode.Space, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D}}

				

				--// Generate Keybind \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind 

					Keybind["39"] = Instance.new("Frame", Section["2a"]);

					Keybind["39"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;

					Keybind["39"]["BorderSizePixel"] = 0;

					Keybind["39"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);

					Keybind["39"]["BackgroundTransparency"] = 0.6000000238418579;

					Keybind["39"]["Size"] = UDim2.new(0, 305, 0, 40);

					Keybind["39"]["Selectable"] = true;

					Keybind["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Keybind["39"]["Position"] = UDim2.new(0.19414122402668, 0, 0.20089398324489594, 0);

					Keybind["39"]["Name"] = [[Keybind ]];



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind .UICorner

					Keybind["3a"] = Instance.new("UICorner", Keybind["39"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind .UIStroke

					Keybind["3b"] = Instance.new("UIStroke", Keybind["39"]);

					Keybind["3b"]["Color"] = Color3.fromRGB(201, 201, 201);

					Keybind["3b"]["Thickness"] = 0.800000011920929;

					Keybind["3b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind .Keybind Title

					Keybind["3c"] = Instance.new("TextLabel", Keybind["39"]);

					Keybind["3c"]["TextWrapped"] = true;

					Keybind["3c"]["BorderSizePixel"] = 0;

					Keybind["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Keybind["3c"]["TextXAlignment"] = Enum.TextXAlignment.Left;

					Keybind["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Keybind["3c"]["TextSize"] = 14;

					Keybind["3c"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Keybind["3c"]["Size"] = UDim2.new(0.7244653105735779, 0, 1, 0);

					Keybind["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Keybind["3c"]["Text"] = [[Keybind]];

					Keybind["3c"]["Name"] = [[Keybind Title]];

					Keybind["3c"]["BackgroundTransparency"] = 1;

					Keybind["3c"]["Position"] = UDim2.new(0.0526687353849411, 0, 0, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind .Keybind

					Keybind["3d"] = Instance.new("TextButton", Keybind["39"]);

					Keybind["3d"]["TextWrapped"] = true;

					Keybind["3d"]["BorderSizePixel"] = 0;

					Keybind["3d"]["AutoButtonColor"] = false;

					Keybind["3d"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30);

					Keybind["3d"]["TextSize"] = 14;

					Keybind["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Keybind["3d"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Keybind["3d"]["AnchorPoint"] = Vector2.new(1, 0.5);

					Keybind["3d"]["Size"] = UDim2.new(0, 30, 0, 25);

					Keybind["3d"]["Name"] = [[Keybind]];

					Keybind["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Keybind["3d"]["Text"] = [[X]];

					Keybind["3d"]["Position"] = UDim2.new(0.9673179984092712, 0, 0.5, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind .Keybind.UICorner

					Keybind["3e"] = Instance.new("UICorner", Keybind["3d"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Keybind .Keybind.UIStroke

					Keybind["3f"] = Instance.new("UIStroke", Keybind["3d"]);

					Keybind["3f"]["Color"] = Color3.fromRGB(201, 201, 201);

					Keybind["3f"]["Thickness"] = 0.800000011920929;

					Keybind["3f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					

					Section:Refresh()

				end



				--// Keybind Script \\--

				

				Keybind["3d"]:GetPropertyChangedSignal("TextBounds"):Connect(function()

					Keybind["3d"]["Size"] = UDim2.fromOffset(30+Keybind["3d"]["TextBounds"].X,25)

				end)

				

				Keybind["3d"].MouseEnter:Connect(function()

					Library:Tween(Keybind["39"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

					Gui.Stop_Dragging = true

				end)



				Keybind["3d"].MouseLeave:Connect(function()

					Library:Tween(Keybind["39"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Gui.Stop_Dragging = false

				end)



				Keybind["3d"].MouseButton1Down:Connect(function()

					Library:Tween(Keybind["3d"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(35, 35, 35)})

				end)



				Keybind["3d"].MouseButton1Up:Connect(function()

					Library:Tween(Keybind["3d"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(30, 30, 30)})

					if Keybind.Connection then Keybind.Connection:Disconnect();Keybind.Connection = nil end

					Keybind["3d"]["Text"] = "..."

					Keybind.Connection = game:GetService("UserInputService").InputBegan:Connect(function(input,gpe)

						if gpe then return end

						if not table.find(Keybind.Blacklist,input.KeyCode) then

							Keybind["3d"]["Text"] = input.KeyCode.Name

							Callback(input.KeyCode)

							Keybind.Connection:Disconnect()

							Keybind.Connection = nil

						end

					end)

				end)

				

				return Keybind

			end

			

			function Section:TextBox(TextBox_Info,Callback)

				local TextBox_Settings = Library.Set_Defaults({Name = "TextBox",PlacedText = ""},TextBox_Info)

				if type(Callback) == "function" then else Callback = function(gg) print(gg) end end

				local TextBox = {}

				

				--// Generate TextBox \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox 

					TextBox["40"] = Instance.new("Frame", Section["2a"]);

					TextBox["40"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;

					TextBox["40"]["BorderSizePixel"] = 0;

					TextBox["40"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);

					TextBox["40"]["BackgroundTransparency"] = 0.6000000238418579;

					TextBox["40"]["Size"] = UDim2.new(0, 305, 0, 40);

					TextBox["40"]["Selectable"] = true;

					TextBox["40"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					TextBox["40"]["Position"] = UDim2.new(0.19414122402668, 0, 0.20089398324489594, 0);

					TextBox["40"]["Name"] = [[TextBox ]];



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox .UICorner

					TextBox["41"] = Instance.new("UICorner", TextBox["40"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox .UIStroke

					TextBox["42"] = Instance.new("UIStroke", TextBox["40"]);

					TextBox["42"]["Color"] = Color3.fromRGB(201, 201, 201);

					TextBox["42"]["Thickness"] = 0.800000011920929;

					TextBox["42"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox .TextBox Title

					TextBox["43"] = Instance.new("TextLabel", TextBox["40"]);

					TextBox["43"]["TextWrapped"] = true;

					TextBox["43"]["BorderSizePixel"] = 0;

					TextBox["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					TextBox["43"]["TextXAlignment"] = Enum.TextXAlignment.Left;

					TextBox["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					TextBox["43"]["TextSize"] = 14;

					TextBox["43"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					TextBox["43"]["Size"] = UDim2.new(0.7244653105735779, 0, 1, 0);

					TextBox["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					TextBox["43"]["Text"] = [[TextBox]];

					TextBox["43"]["Name"] = [[TextBox Title]];

					TextBox["43"]["BackgroundTransparency"] = 1;

					TextBox["43"]["Position"] = UDim2.new(0.0526687353849411, 0, 0, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox .TextBox

					TextBox["44"] = Instance.new("TextBox", TextBox["40"]);

					TextBox["44"]["PlaceholderColor3"] = Color3.fromRGB(201, 201, 201);

					TextBox["44"]["BorderSizePixel"] = 0;

					TextBox["44"]["TextSize"] = 14;

					TextBox["44"]["TextWrapped"] = true;

					TextBox["44"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

					TextBox["44"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					TextBox["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					TextBox["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

					TextBox["44"]["Size"] = UDim2.new(0, 45, 0, 25);

					TextBox["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					TextBox["44"]["Text"] = [[]];

					TextBox["44"]["Position"] = UDim2.new(0.8950819969177246, 0, 0.5, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox .TextBox.UICorner

					TextBox["45"] = Instance.new("UICorner", TextBox["44"]);

					TextBox["45"]["CornerRadius"] = UDim.new(0, 6);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.TextBox .TextBox.UIStroke

					TextBox["46"] = Instance.new("UIStroke", TextBox["44"]);

					TextBox["46"]["Color"] = Color3.fromRGB(201, 201, 201);

					TextBox["46"]["Thickness"] = 0.800000011920929;

					TextBox["46"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					

					Section:Refresh()

				end

				

				--// TextBox Script \\--

				

				TextBox["44"].MouseEnter:Connect(function()

					Library:Tween(TextBox["40"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

					Gui.Stop_Dragging = true

				end)



				TextBox["44"].MouseLeave:Connect(function()

					Library:Tween(TextBox["40"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Gui.Stop_Dragging = false

				end)

				

				if game:GetService("UserInputService").TouchEnabled then

					TextBox["44"].InputBegan:Connect(function()

						TextBox["44"]:CaptureFocus()

					end)

				end

				

				TextBox["44"].Focused:Connect(function()

					Library:Tween(TextBox["44"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(35, 35, 35)})

				end)



				TextBox["44"].FocusLost:Connect(function()

					Library:Tween(TextBox["44"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(30, 30, 30)})

					Callback(TextBox["44"]["Text"])

				end)

				

				return TextBox

			end



			function Section:Slider(Slider_Info,Callback)

				local Slider_Settings = Library.Set_Defaults({Name = "Slider",Min = 0,Max = 100,Speed = .15},Slider_Info)

				if type(Callback) == "function" then else Callback = function(gg) print(gg) end end

				local Slider = {IsDone = false}

				

				--// Generate Slider \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider

					Slider["47"] = Instance.new("TextButton", Section["2a"]);

					Slider["47"]["Active"] = false;

					Slider["47"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;

					Slider["47"]["BorderSizePixel"] = 0;

					Slider["47"]["AutoButtonColor"] = false;

					Slider["47"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);

					Slider["47"]["TextSize"] = 14;

					Slider["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Slider["47"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["47"]["Size"] = UDim2.new(0, 305, 0, 65);

					Slider["47"]["Name"] = [[Slider]];

					Slider["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["47"]["Text"] = [[]];

					Slider["47"]["Position"] = UDim2.new(0.033565323799848557, 0, 0.6188114285469055, 0);

					Slider["47"]["BackgroundTransparency"] = 0.6000000238418579;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.UICorner

					Slider["48"] = Instance.new("UICorner", Slider["47"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.UIStroke

					Slider["49"] = Instance.new("UIStroke", Slider["47"]);

					Slider["49"]["Color"] = Color3.fromRGB(201, 201, 201);

					Slider["49"]["Thickness"] = 0.800000011920929;

					Slider["49"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Slider Title

					Slider["4a"] = Instance.new("TextLabel", Slider["47"]);

					Slider["4a"]["TextWrapped"] = true;

					Slider["4a"]["BorderSizePixel"] = 0;

					Slider["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Slider["4a"]["TextXAlignment"] = Enum.TextXAlignment.Left;

					Slider["4a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Slider["4a"]["TextSize"] = 14;

					Slider["4a"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Slider["4a"]["Size"] = UDim2.new(0.7239999771118164, 0, 0.5, 0);

					Slider["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["4a"]["Text"] = tostring(Slider_Settings.Name);

					Slider["4a"]["Name"] = [[Slider Title]];

					Slider["4a"]["BackgroundTransparency"] = 1;

					Slider["4a"]["Position"] = UDim2.new(0.0526687353849411, 0, 0.06779661029577255, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Result

					Slider["4b"] = Instance.new("TextLabel", Slider["47"]);

					Slider["4b"]["TextWrapped"] = true;

					Slider["4b"]["BorderSizePixel"] = 0;

					Slider["4b"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

					Slider["4b"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Slider["4b"]["Selectable"] = true;

					Slider["4b"]["TextSize"] = 14;

					Slider["4b"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Slider["4b"]["AnchorPoint"] = Vector2.new(1, 0.5);

					Slider["4b"]["Size"] = UDim2.new(0, 37, 0, 25);

					Slider["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["4b"]["Text"] = [[100]];

					Slider["4b"]["Name"] = [[Result]];

					Slider["4b"]["Position"] = UDim2.new(0.9673179984092712, 0, 0.30634766817092896, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Result.UICorner

					Slider["4c"] = Instance.new("UICorner", Slider["4b"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Result.UIStroke

					Slider["4d"] = Instance.new("UIStroke", Slider["4b"]);

					Slider["4d"]["Color"] = Color3.fromRGB(201, 201, 201);

					Slider["4d"]["Thickness"] = 0.800000011920929;

					Slider["4d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Drag Holder

					Slider["4e"] = Instance.new("Frame", Slider["47"]);

					Slider["4e"]["BorderSizePixel"] = 0;

					Slider["4e"]["BackgroundColor3"] = Color3.fromRGB(201, 201, 201);

					Slider["4e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

					Slider["4e"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.07999999821186066, 0);

					Slider["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["4e"]["Position"] = UDim2.new(0.5, 0, 0.7799999713897705, 0);

					Slider["4e"]["Name"] = [[Drag Holder]];



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Drag Holder.Drag

					Slider["4f"] = Instance.new("Frame", Slider["4e"]);

					Slider["4f"]["BorderSizePixel"] = 0;

					Slider["4f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

					Slider["4f"]["Size"] = UDim2.new(0.7741348147392273, 0, 0.9999998211860657, 0);

					Slider["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["4f"]["Name"] = [[Drag]];



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Drag Holder.Drag.UICorner

					Slider["50"] = Instance.new("UICorner", Slider["4f"]);

					Slider["50"]["CornerRadius"] = UDim.new(0, 2);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Drag Holder.Drag.Circle

					Slider["51"] = Instance.new("Frame", Slider["4f"]);

					Slider["51"]["BorderSizePixel"] = 0;

					Slider["51"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);

					Slider["51"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

					Slider["51"]["Size"] = UDim2.new(0, 15, 0, 15);

					Slider["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Slider["51"]["Position"] = UDim2.new(1, 0, 0.42399999499320984, 0);

					Slider["51"]["Name"] = [[Circle]];



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Drag Holder.Drag.Circle.UICorner

					Slider["52"] = Instance.new("UICorner", Slider["51"]);

					Slider["52"]["CornerRadius"] = UDim.new(0, 100);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Slider.Drag Holder.UICorner

					Slider["53"] = Instance.new("UICorner", Slider["4e"]);

					

					Section:Refresh()

				end

				

				--// Slider Script \\--

				

				Slider["47"].MouseEnter:Connect(function()

					Library:Tween(Slider["47"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

					Gui.Stop_Dragging = true

				end)



				Slider["47"].MouseLeave:Connect(function()

					Library:Tween(Slider["47"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Gui.Stop_Dragging = false

					if not Slider.IsDone then Slider.IsDone = true end

				end)



				Slider["47"].MouseButton1Down:Connect(function()

					Library:Tween(Slider["47"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(80, 80, 80)})

					Slider.IsDone = false

					repeat task.wait()

						local slider_calculate = math.clamp((game:GetService("Players").LocalPlayer:GetMouse().X-Slider["4e"].AbsolutePosition.X)/Slider["4e"].AbsoluteSize.X,0,1)

						Slider["4b"]["Text"] = math.round((Slider_Settings.Max-Slider_Settings.Min)*slider_calculate+Slider_Settings.Min)

						Library:Tween(Slider["4f"],{tonumber(Slider_Settings.Speed),"Linear","InOut"},{Size = UDim2.fromScale(slider_calculate,Slider["4f"]["Size"]["Y"]["Scale"])})

						Callback(tonumber(Slider["4b"]["Text"]))

					until Slider.IsDone

				end)



				Slider["47"].MouseButton1Up:Connect(function()

					Library:Tween(Slider["47"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Slider.IsDone = true

				end)

				

				return Slider

			end

			

			function Section:Dropdown(Dropdown_Info,Callback)

				

				local Dropdown_Settings = Library.Set_Defaults({Name = "Dropdown",Options = {"One","Two","Three"},Close_Icon = 14569402691,Open_Icon = 14569017448},Dropdown_Info)

				if type(Callback) == "function" then else Callback = function(gg) print(gg) end end

				local Dropdown = {Status = false}

				

				

				--// Generate Dropdown \\--

				

				do

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Closed Dropdown

					Dropdown["54"] = Instance.new("TextButton", Section["2a"]);

					Dropdown["54"]["Active"] = false;

					Dropdown["54"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;

					Dropdown["54"]["BorderSizePixel"] = 0;

					Dropdown["54"]["AutoButtonColor"] = false;

					Dropdown["54"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);

					Dropdown["54"]["TextSize"] = 14;

					Dropdown["54"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Dropdown["54"]["TextColor3"] = Color3.fromRGB(0, 0, 0);

					Dropdown["54"]["Size"] = UDim2.new(0, 305, 0, 40);

					Dropdown["54"]["Name"] = [[Closed Dropdown]];

					Dropdown["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Dropdown["54"]["Text"] = [[]];

					Dropdown["54"]["Position"] = UDim2.new(0.19414122402668, 0, 0.20089398324489594, 0);

					Dropdown["54"]["BackgroundTransparency"] = 0.6000000238418579;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Closed Dropdown.UICorner

					Dropdown["55"] = Instance.new("UICorner", Dropdown["54"]);





					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Closed Dropdown.UIStroke

					Dropdown["56"] = Instance.new("UIStroke", Dropdown["54"]);

					Dropdown["56"]["Color"] = Color3.fromRGB(201, 201, 201);

					Dropdown["56"]["Thickness"] = 0.800000011920929;

					Dropdown["56"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Closed Dropdown.Dropdown Title

					Dropdown["57"] = Instance.new("TextLabel", Dropdown["54"]);

					Dropdown["57"]["TextWrapped"] = true;

					Dropdown["57"]["BorderSizePixel"] = 0;

					Dropdown["57"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Dropdown["57"]["TextXAlignment"] = Enum.TextXAlignment.Left;

					Dropdown["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);

					Dropdown["57"]["TextSize"] = 14;

					Dropdown["57"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

					Dropdown["57"]["Size"] = UDim2.new(0, 234, 0, 40);

					Dropdown["57"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Dropdown["57"]["Text"] = tostring(Dropdown_Settings.Name).." :  None";

					Dropdown["57"]["Name"] = [[Dropdown Title]];

					Dropdown["57"]["BackgroundTransparency"] = 1;

					Dropdown["57"]["Position"] = UDim2.new(0.0526687353849411, 0, 0, 0);



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Closed Dropdown.Dropdown Title.Icon

					Dropdown["58"] = Instance.new("ImageLabel", Dropdown["57"]);

					Dropdown["58"]["BorderSizePixel"] = 0;

					Dropdown["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Dropdown["58"]["AnchorPoint"] = Vector2.new(0.5, 0.5);

					Dropdown["58"]["Image"] = "http://www.roblox.com/asset/?id="..tostring(Dropdown_Settings.Close_Icon);

					Dropdown["58"]["Size"] = UDim2.new(0, 25, 0, 25);

					Dropdown["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Dropdown["58"]["Name"] = [[Icon]];

					Dropdown["58"]["BackgroundTransparency"] = 1;

					Dropdown["58"]["Position"] = UDim2.new(1.1390000581741333, 0, 0.5199999809265137, 0);

					

					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Open Dropdown.Options

					Dropdown["59"] = Instance.new("ScrollingFrame", Dropdown["54"]);

					Dropdown["59"]["BorderSizePixel"] = 0;

					Dropdown["59"]["CanvasSize"] = UDim2.new(0, 0, 0, 97);

					Dropdown["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

					Dropdown["59"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;

					Dropdown["59"]["BackgroundTransparency"] = 1;

					Dropdown["59"]["Size"] = UDim2.new(0.907737672328949, 0, 0.6065018773078918, 0);

					Dropdown["59"]["ScrollBarImageColor3"] = Color3.fromRGB(201, 201, 201);

					Dropdown["59"]["Selectable"] = false;

					Dropdown["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

					Dropdown["59"]["ScrollBarThickness"] = 1;

					Dropdown["59"]["Position"] = UDim2.new(0.05000000074505806, 0, 0.3201647996902466, 0);

					Dropdown["59"]["Name"] = [[Options]];

					Dropdown["59"]["Visible"] = false

					Dropdown["59"]["SelectionGroup"] = false;



					-- StarterGui.Domenic HUB.Main.Options Holder.Options.Section.Items.Open Dropdown.Options.UIListLayout

					Dropdown["60"] = Instance.new("UIListLayout", Dropdown["59"]);

					Dropdown["60"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;

					Dropdown["60"]["Padding"] = UDim.new(0, 8);

					Dropdown["60"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

					

					Section:Refresh()

				end

				

				--// Dropdown Script \\--

				

				function Dropdown:Refresh(New_Options)

					if type(New_Options) ~= "table" then New_Options = {"One","Two","Three"} end

					if #New_Options < 1 then New_Options = {"One","Two","Three"} end

					for i,v in pairs(Dropdown["59"]:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end

					

					for i = 1,#New_Options do

						local Option_Button = {}

						

						Option_Button["60"] = Instance.new("TextButton", Dropdown["59"]);

						Option_Button["60"]["TextWrapped"] = true;

						Option_Button["60"]["Active"] = false;

						Option_Button["60"]["BorderSizePixel"] = 0;

						Option_Button["60"]["AutoButtonColor"] = false;

						Option_Button["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);

						Option_Button["60"]["TextSize"] = 14;

						Option_Button["60"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);

						Option_Button["60"]["TextColor3"] = Color3.fromRGB(201, 201, 201);

						Option_Button["60"]["Selectable"] = false;

						Option_Button["60"]["Size"] = UDim2.new(1, 0, 0.30000001192092896, 0);

						Option_Button["60"]["Name"] = [[Button]];

						Option_Button["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

						Option_Button["60"]["Text"] = tostring(New_Options[i]);

						Option_Button["60"]["Position"] = UDim2.new(-0.05244411528110504, 0, 0.5276162028312683, 0);

						Option_Button["60"]["BackgroundTransparency"] = 1;

						

						Option_Button["60"].MouseEnter:Connect(function()

							Option_Button["60"]["BackgroundColor3"] = Color3.fromRGB()

							Option_Button["60"]["BackgroundTransparency"] = .93

							Gui.Stop_Dragging = true

						end)



						Option_Button["60"].MouseLeave:Connect(function()

							Library:Tween(Option_Button["60"],{.3,"Linear","InOut"},{BackgroundTransparency = 1})

							Gui.Stop_Dragging = false

						end)



						Option_Button["60"].MouseButton1Down:Connect(function()

							Option_Button["60"]["BackgroundColor3"] = Color3.fromRGB(255,255,255)

							Option_Button["60"]["BackgroundTransparency"] = .96

						end)



						Option_Button["60"].MouseButton1Up:Connect(function()

							Library:Tween(Option_Button["60"],{.3,"Linear","InOut"},{BackgroundTransparency = 1})

							Dropdown["57"]["Text"] = tostring(Dropdown_Settings.Name).." : "..tostring(New_Options[i])

							Callback(tostring(New_Options[i]))

						end)

					end

					

					Dropdown_Settings.Options = New_Options

				end

				

				Dropdown["54"].MouseEnter:Connect(function()

					Library:Tween(Dropdown["54"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(50, 50, 50)})

					Gui.Stop_Dragging = true

				end)



				Dropdown["54"].MouseLeave:Connect(function()

					Library:Tween(Dropdown["54"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					Gui.Stop_Dragging = false

				end)



				Dropdown["54"].MouseButton1Down:Connect(function()

					Library:Tween(Dropdown["54"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(80, 80, 80)})

				end)



				Dropdown["54"].MouseButton1Up:Connect(function()

					Library:Tween(Dropdown["54"],{.3,"Linear","InOut"},{BackgroundColor3 = Color3.fromRGB(60, 60, 60)})

					if not Dropdown.Status then

						Dropdown.Status = true

						local Tween_Done = false

						task.spawn(function() repeat task.wait() Section:Refresh() until Tween_Done end)

						Library:Tween(Dropdown["54"],{.3,"Linear","InOut"},{Size= UDim2.fromOffset(305,150)},function() Tween_Done = true end)

						Dropdown["58"]["Image"] = "http://www.roblox.com/asset/?id="..tostring(Dropdown_Settings.Open_Icon)

						Dropdown["59"]["Visible"] = true

						Dropdown:Refresh(Dropdown_Settings.Options)

					else

						Dropdown.Status = false

						local Tween_Done = false

						task.spawn(function() repeat task.wait() Section:Refresh() until Tween_Done end)

						Library:Tween(Dropdown["54"],{.3,"Linear","InOut"},{Size= UDim2.fromOffset(305,40)},function() Tween_Done = true end)

						Dropdown["58"]["Image"] = "http://www.roblox.com/asset/?id="..tostring(Dropdown_Settings.Close_Icon)

						Dropdown["59"]["Visible"] = false

					end

				end)

				

				return Dropdown

				

			end

			

			

			return Section

		end

		

		return Tab

	end

	

	

	Gui:AddDrag(Gui["2"])

	

	return Gui

end



return Library
