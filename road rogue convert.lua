-- CHANGE THE RIGS TO YOUR OWN RIGS IN LINE 1014 TO 1018 
-- BULLET SYSTEM BY MELONSCRIPTER TY TY 
-- HATS:
-- https://www.roblox.com/catalog/14890554305/Green-Rocket-Launcher
-- https://www.roblox.com/catalog/15008433643/Slug-Rifle-Red
-- https://www.roblox.com/catalog/17465366506/Black-Rider-Motorcycle
-- https://www.roblox.com/catalog/4504231783/Elemental-Crystal-Golem-Shoulder-Rock

do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local UserInputType = Enum.UserInputType
	local MouseButton1 = UserInputType.MouseButton1
	local Touch = UserInputType.Touch

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil
	
	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 28, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)

				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Offset = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z) * CFrame.Angles(math.pi * 0.5, 0, 0)
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end
			
			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}
			
			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				
				tableclear(Tools)
				
				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)
					
					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end
				
				UnequipTools(Humanoid)
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)
			
			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")
				
				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end
			
			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end
	
	local OnInputBegan = function(InputObject)
		local UserInputType = InputObject.UserInputType
		
		if UserInputType == MouseButton1 or UserInputType == Touch then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character
						
						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end
						
						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end
	
	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end
	
	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints
			
			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace
            
			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		--{ MeshId = "", Name = "", Offset = CFrame.identity, TextureId = "" },		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },--95290698984301
		{ MeshId = "107967286632597", Names = { "Right Leg" }, Offset = CFrame.identity, TextureId = "102985284765894" }, -- right leg
		{ MeshId = "103047010743582", Names = { "Left Leg" }, Offset = CFrame.identity, TextureId = "87964706114912" }, -- left leg 
		{ MeshId = "95117930724031", Names = { "Left Arm" }, Offset = CFrame.identity, TextureId = "140157176544001" }, -- left arm   
		{ MeshId = "70462705900761", Names = { "Right Arm" }, Offset = CFrame.identity, TextureId = "95627133495096" }, -- right arm
		{ MeshId = "117372285989979", Name = "Torso", Offset = CFrame.identity, TextureId = "115992667121218" }, -- torso 
		
		{ MeshId = "125316291067216", Names = { "Right Leg" }, Offset = CFrame.identity, TextureId = "71605190160066" }, -- right leg
		{ MeshId = "92677557936015", Names = { "Left Leg" }, Offset = CFrame.identity, TextureId = "131484303858830" }, -- left leg 
		{ MeshId = "95516197193732", Names = { "Left Arm" }, Offset = CFrame.identity, TextureId = "70853524502594" }, -- left arm   
		{ MeshId = "99926986645193", Names = { "Right Arm" }, Offset = CFrame.identity, TextureId = "125033652108518" }, -- right arm
		{ MeshId = "77308971382779", Name = "Torso", Offset = CFrame.identity, TextureId = "138921646216332" }, -- torso 
	},
	ApplyDescription = true,
	BreakJointsDelay = 0,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = true,--{ MeshId="", TextureId = ""},
		Highlight = true,
		PredictionFling = true,
		Timeout = 1,
		ToolFling = true,"Laptop",
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, - 35, 0),
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = false,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})
wait(0.1)
local script = game:GetObjects("rbxassetid://129009914314538")[1]

local MODULE = script
local PLAYER = game.Players.LocalPlayer
local CHARACTER = workspace.DuskySpoon
local HUM = CHARACTER.Humanoid
local REMOTE = MODULE.Event

local m = game.Players.LocalPlayer:GetMouse()
Player = game:GetService("Players").LocalPlayer
Mouse = Player:GetMouse()
local ROOT = HUM.Torso
local HEAD = CHARACTER.Head
local TORSO = CHARACTER.Torso
local RIGHTARM = CHARACTER["Right Arm"]
local LEFTARM = CHARACTER["Left Arm"]
local RIGHTLEG = CHARACTER["Right Leg"]
local LEFTLEG = CHARACTER["Left Leg"]
local ROOTJOINT = ROOT["RootJoint"]
local NECK = TORSO["Neck"]
local MOTOR = MODULE.Motor
MOTOR.Parent = CHARACTER
MOTOR.Transparency = 1
local SMG = MODULE.Uzi
SMG.Parent = CHARACTER
SMG.Transparency = 1

local RIGHTSHOULDER = TORSO["Right Shoulder"]
local LEFTSHOULDER = TORSO["Left Shoulder"]
local RIGHTHIP = TORSO["Right Hip"]
local LEFTHIP = TORSO["Left Hip"]
local MOUSEPOS = m.hit.p
local MOUSEHIT = nil


IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

--//====================================================\\--
--||                       FE CODE
--\\====================================================//--
--nyoom

--//====================================================\\--
--||                  BACKGROUND VALUES
--\\====================================================//--

local ANIM_SPEED = 3
local MOUSE = PLAYER:GetMouse()
local FRAME_SPEED = 1 / 60 -- (1 / 30) OR (1 / 60)
local CHANGE = 2 / ANIM_SPEED
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local KEYHOLD = false
local MOUSEHOLD = false
local SINE = 0
local ATTACKING = false
local Debris = game:GetService("Debris")
local Effects = IT("Folder",CHARACTER)
Effects.Name = "FXFolder"
ROOTJOINT.C1 = CF(0,0,0)
NECK.C1 = CF(0,0,0)
RIGHTSHOULDER.C1 = CF(0,0,0)
LEFTSHOULDER.C1 = CF(0,0,0)
RIGHTHIP.C1 = CF(0,0,0)
LEFTHIP.C1 = CF(0,0,0)
local USEDEFAULTANIMATIONS = true

--//====================================================\\--
--||                     HEARTBEAT
--\\====================================================//--

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = FRAME_SPEED
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

-- THAnks to melonscripter btw  thank for bullet thingy 
local PLAYER = game.Players.LocalPlayer
local MOUSE = PLAYER:GetMouse()

local PLAYER = game.Players.LocalPlayer
local MOUSE = PLAYER:GetMouse()

loadstring(game:HttpGet("https://raw.githubusercontent.com/CatThatDrinksSprite/Moon-Convert/main/Scripts/Other/AlignCharacter.lua"))() -- FUCK THIS PERSON.. LOL
-- WELDERS
-- SHITTY CODE BTW
local asdf = game.Workspace.DuskySpoon
local motorcyclee = asdf["Accessory (Black Rider Motorcycle)"]
local uuzi = asdf["Accessory (Slug Rifle Black)"]
local bullett = asdf["RockAccessory"]
local bazoooka = asdf["defaultAccessory"]

bullett.Handle.AccessoryWeld:Destroy()
bazoooka.Handle.AccessoryWeld:Destroy()
motorcyclee.Handle.AccessoryWeld:Destroy()
uuzi.Handle.AccessoryWeld:Destroy()
AlignCharacter(bazoooka.Handle, script.Bazooka, Vector3.new(0, 0 , 0), Vector3.new(0, 1.45, -0.75))
AlignCharacter(uuzi.Handle, SMG, Vector3.new(0, 0.15, 0.55), Vector3.new(1.45, -3.15, -3.15))
AlignCharacter(motorcyclee.Handle, MOTOR, Vector3.new(0, -0.15, 0.55), Vector3.new(0, 0, 0))
local Bullet = Instance.new("Part")
Bullet.Name = "Bullet"
Bullet.Size = Vector3.new(1, 1, 1)
Bullet.Transparency = 0.95
Bullet.CanCollide = false
Bullet.Anchored = false
Bullet.Massless = true
Bullet.Parent = workspace.DuskySpoon

local BulletWeld = Instance.new("Weld")
BulletWeld.Name = "BulletWeld"
BulletWeld.Part0 = workspace.DuskySpoon["Right Arm"]
BulletWeld.Part1 = Bullet
BulletWeld.C0 = CFrame.new(0, 0.15, 0.55)
BulletWeld.Parent = Bullet


AlignCharacter(bullett.Handle, Bullet, Vector3.new(0, 0.15, 0.55), Vector3.new(0, -0.15, 0.55))
-- BULLET SYSTEM BY MELON THNAK YOU SM
local BulletStuff = {
	Speed = 0.145, -- 0.145 Recommended, anything lower might make the bullet spasm
	AttachedTo = "Motor", -- Motor or Arm
}

local SHOOTING = false

-- direct .position looks bad on server
-- pretty much a rework of my old bullet system from the elio blasio thing --

function makeafuckingtween(fuckingposition) -- mightve got mad making this lol
	local fuckingtween = game:GetService("TweenService"):Create(Bullet, TweenInfo.new(0.001, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {Position = fuckingposition})
	fuckingtween:Play()
end

MOUSE.Button1Down:Connect(function()
	SHOOTING = true
	repeat
		task.wait()
		makeafuckingtween(MOUSE.Hit.Position)
		task.wait(BulletStuff.BulletSpeed)
		makeafuckingtween(workspace.DuskySpoon["Right Arm"].Position)
		task.wait()
	until SHOOTING == false
end)

MOUSE.Button1Up:Connect(function()
	SHOOTING = false
	repeat task.wait()
		if BulletStuff.AttachedTo == "Motor" then
			makeafuckingtween(workspace.DuskySpoon["Motor"].Position)
		elseif BulletStuff.AttachedTo == "Arm" then
			makeafuckingtween(workspace.DuskySpoon["Right Arm"].Position)
		end
	until SHOOTING == true
end)

--//====================================================\\--
--||                       CLERP
--\\====================================================//--

function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end

function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end

function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

--//====================================================\\--
--||                     FUNCTIONS
--\\====================================================//--

function WeldParts(A,B)
	local WLD = IT("ManualWeld")
	WLD.Part0 = A
	WLD.Part1 = B
	WLD.C1 = B.CFrame:inverse() * A.CFrame
	WLD.Parent = A
	return WLD
end

--NewSound({ID = 0,PARENT = ROOT,VOLUME = 0.5,PITCH = 1,LOOP = false,MAXDISTANCE = 1000,EMITTERSIZE = 10,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
function NewSound(TABLE)
	local ID = "rbxassetid://"..(TABLE.ID or 0)
	local PARENT = (TABLE.PARENT or ROOT)
	local VOLUME = (TABLE.VOLUME or 0.5)
	local PITCH = (TABLE.PITCH or 1)
	local LOOP = (TABLE.LOOP or false)
	local MAXDISTANCE = (TABLE.MAXDISTANCE or 100)
	local EMITTERSIZE = (TABLE.EMITTERSIZE or 10)
	local PLAYING = (TABLE.PLAYING or true)
	local PLAYONREMOVE = (TABLE.PLAYONREMOVE or false)
	local DOESDEBRIS = (TABLE.DOESDEBRIS or true)
	if ID ~= "rbxassetid://0" then
		local SOUND = IT("Sound",PARENT)
		SOUND.SoundId = ID
		SOUND.Volume = VOLUME
		SOUND.Pitch = PITCH
		SOUND.Looped = LOOP
		SOUND.MaxDistance = MAXDISTANCE
		SOUND.EmitterSize = EMITTERSIZE
		SOUND.PlayOnRemove = PLAYONREMOVE
		if DOESDEBRIS == true and PLAYING == true and LOOP == false then
			Debris:AddItem(SOUND,SOUND.TimeLength+5)
		end
		if PLAYING == true then
			SOUND:Play()
		end
		return SOUND
	end
end

function OofOuchBlood(LOCATION,TO,AMOUNT)
	local P = CreatePart(3, Effects, "Granite", 0, 1, BRICKC("Pearl"), "Blood", VT(0,0,0), true)
	P.CFrame = CF(LOCATION,TO)
	local BLOOD = MODULE.Blood:Clone()
	BLOOD.Parent = P
	BLOOD:Emit(AMOUNT)
	Debris:AddItem(P,2)
end

function AttachmentCFrame(A)
	return A.Parent.CFrame*CF(A.Position)
end

function CastProperRay(StartPos, EndPos, Distance, Ignore)
	local DIRECTION = CF(StartPos,EndPos).lookVector
	return Raycast(StartPos, DIRECTION, Distance, Ignore)
end

function ManSlaughter(MAN)
	if MAN then
		local ROOT = MAN:FindFirstChild("HumanoidRootPart")
		if ROOT then
			ROOT:Remove()
		end
		local MANHUM = MAN:FindFirstChildOfClass("Humanoid")
		if MANHUM then
			MANHUM.BreakJointsOnDeath = true
			MANHUM.Health = 0
		end
		if MAN:FindFirstChild("R6Ragdoll") == nil and MAN:FindFirstChild("R15Ragdoll") == nil then
			if MAN:FindFirstChild("UpperTorso") then
				local SCRIPT = script.R15Ragdoll:Clone()
				SCRIPT.Parent = MAN
				SCRIPT.Disabled = false
			else
				local SCRIPT = script.R6Ragdoll:Clone()
				SCRIPT.Parent = MAN
				SCRIPT.Disabled = false
			end
			local TORSO = MAN:FindFirstChild("Torso") or MAN:FindFirstChild("UpperTorso")
			if TORSO then
				NewSound({ID = 146594648,PARENT = TORSO,VOLUME = 1,PITCH = MRANDOM(8,12)/10,LOOP = false,MAXDISTANCE = 75,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			end
		end
		MAN:BreakJoints()
		if MAN:FindFirstChild("Slaughtered") == nil then
			local MARK = IT("Folder",MAN)
			MARK.Name = "Slaughtered"
		else
			if MAN:FindFirstChild("Slaughtered") then
				local TORSO = MAN:FindFirstChild("Torso") or MAN:FindFirstChild("UpperTorso")
				if TORSO then
					TORSO.RotVelocity = VT(0,MRANDOM(-25,25),0)
				end
			end
		end
	end
end

function ApplyDamageTo(HUM,DAMAGE)
	if HUM.Health >= 0 then
		HUM.Health = HUM.Health 
		if HUM.Health <= 0 then
			--ManSlaughter(HUM.Parent)
		end
	end
end

function AreaOfEffect(AREA,RANGE,MIN,MAX,RETURN)
	local HIT = {}
	for index, CHILD in pairs(workspace:GetChildren()) do
		if CHILD:FindFirstChildOfClass("Humanoid") and CHILD ~= CHARACTER then
			local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
			local ROOT = HUMAN.Torso
			if ROOT then
				if (ROOT.Position - AREA).Magnitude <= RANGE then
					if RETURN == true then
						table.insert(HIT,{CHILD,HUMAN,ROOT})
					else
						--	ApplyDamageTo(HUMAN,MRANDOM(MIN,MAX))
					end
				end
			end
		end
	end
	if RETURN == true then
		return HIT
	end
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = ROOT.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

function Raycast(POSITION, DIRECTION, RANGE, TABLE)
	local TABLE = ((type(TABLE) == "table" and TABLE) or {TABLE})
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(POSITION, DIRECTION * RANGE), TABLE)
end

function CameraShake(AREA,RANGE,SHAKE,TIMER)
	for index, CHILD in pairs(workspace:GetChildren()) do
		if CHILD:FindFirstChildOfClass("Humanoid") then
			local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
			local ROOT = HUMAN.Torso
			if ROOT and game.Players:GetPlayerFromCharacter(CHILD) then
				if (ROOT.Position - AREA).Magnitude <= RANGE then
					if CHILD:FindFirstChild("CamShake") then
						Debris:AddItem(CHILD:FindFirstChild("CamShake"),0.05)
					end
					local CAMSHAKE = script.CamShake:Clone()
					CAMSHAKE.Parent = CHILD
					local TIMER_V = IT("NumberValue",CAMSHAKE)
					TIMER_V.Name = "Timer"
					TIMER_V.Value = TIMER
					local SHAKE_V = IT("NumberValue",CAMSHAKE)
					SHAKE_V.Name = "Shake"
					SHAKE_V.Value = SHAKE
					CAMSHAKE.Disabled = false
					Debris:AddItem(CAMSHAKE,15)
				end
			end
		end
	end
end

--//====================================================\\--
--||                     CHARACTER
--\\====================================================//--

local DIED = false
local TRACKS = {{2598781800,1.75},{373410757,2},{327466331,2.7},{193170682,2.2},{2496169936,2.5},{1703313447,2.3},{2884982022,4.25},{3397313642,3},{601814175,2.2}}
local TRACK = 1
local MOLOTOVPROP = MODULE.Molotov
MOLOTOVPROP.Parent = nil
local MISILEPROP = MODULE.Missile
MISILEPROP.Parent = nil
local BULLETPROP = MODULE.Bullet
BULLETPROP.Parent = nil
local FRONTWHEEL = MODULE.FrontWheel
local BACKWHEEL = MODULE.BackWheel
FRONTWHEEL.Transparency = 1
BACKWHEEL.Transparency = 1
local FRONTC1 = FRONTWHEEL.CFrame:inverse() * MOTOR.CFrame
local BACKC1 = BACKWHEEL.CFrame:inverse() * MOTOR.CFrame
local BACKUPWHEEL = FRONTWHEEL:Clone()
BACKUPWHEEL.Parent = nil
BACKUPWHEEL.CanCollide = true
BACKUPWHEEL.Anchored = false
local WHEELS = {{FRONTWHEEL,FRONTC1},{BACKWHEEL,BACKC1}}
local WHEELJOINTS = {}
local MOTORMODEL = IT("Model",MOTORMODEL)
MOTORMODEL.Name = "MotorThings"
for i = 1, #WHEELS do
	WHEELS[i][1].Anchored = false
	WHEELS[i][1].Parent = CHARACTER
	local JOINT = IT("Motor6D")
	JOINT.Parent = MOTOR
	JOINT.C1 = WHEELS[i][2]
	JOINT.Part0 = MOTOR
	JOINT.Part1 = WHEELS[i][1]
	JOINT.Parent = WHEELS[i][1]
	table.insert(WHEELJOINTS,JOINT)
end
MOTOR.Anchored = false
MOTOR.Parent = CHARACTER



SMG.Anchored = false
local MOTORWELD = IT("Motor6D")
MOTORWELD.Part0 = TORSO
MOTORWELD.Part1 = MOTOR
MOTORWELD.Name = "MotorJoint"
MOTORWELD.Parent = TORSO
local SMGGRIP = IT("Motor6D")
SMGGRIP.Part0 = RIGHTARM
SMGGRIP.Part1 = SMG
SMGGRIP.Name = "SmgGrip"
SMGGRIP.Parent = RIGHTARM
local SMGTIGHTGRIP = IT("Motor6D")
SMGTIGHTGRIP.Part0 = RIGHTARM
SMGTIGHTGRIP.Part1 = SMG
SMGTIGHTGRIP.Name = "SmgGrip"
SMGTIGHTGRIP.C0 = CF(0,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(-180))*ANGLES(RAD(0),RAD(0),RAD(0))
local MOTORHUM = NewSound({ID = 122292723,PARENT = ROOT,VOLUME = 1.5,PITCH = 1,LOOP = true,MAXDISTANCE = 125,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
MOTORHUM.Name = "MOTORHUM"
local JOINT1 = IT("Attachment",TORSO)
local JOINT2 = IT("Attachment",RIGHTARM)
JOINT1.Position = VT(1.575,0.8,0)
JOINT2.Position = VT(0,1,0)
local SHOULDER = IT("BallSocketConstraint",TORSO)
SHOULDER.Attachment0 = JOINT1
SHOULDER.Attachment1 = JOINT2
SHOULDER.Radius = 0.05
local MOTORHITBOX = CreatePart(3,MOTORMODEL,"Neon",0,1,"Grey","Hitbox",MOTOR.Size*1.5,false)
MOTORHITBOX.Massless = true
MOTORHITBOX.CFrame = MOTOR.CFrame
WeldParts(MOTOR,MOTORHITBOX)
local MOTORHIT = MOTORHITBOX.Touched:Connect(function(HIT)
	if HUM.WalkSpeed > 80 then
		if HIT.Parent:FindFirstChildOfClass("Humanoid") and HIT.Parent ~= CHARACTER then
			if HIT.Parent:FindFirstChildOfClass("Humanoid").Health > 0 and HIT.Parent:FindFirstChild("Roadrogue") == nil then
				CameraShake(HIT.Position,25,5,55)
				local BV = IT("BodyVelocity")
				BV.MaxForce = BV.MaxForce * 500
				BV.Velocity = CF(ROOT.Position-VT(0,2,0),HIT.Position+VT(0,1,0)).lookVector*(HUM.WalkSpeed/2)
				BV.Parent = HIT
				Debris:AddItem(BV,0.5)
				OofOuchBlood(HIT.Position,ROOT.Position,150)
				----ManSlaughter(HIT.Parent)
				NewSound({ID = 314390675,PARENT = ROOT,VOLUME = 5,PITCH = MRANDOM(8,12)/12,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			end
		end
	end
end)
local BOOST = false
local BAZOOKA = MODULE.Bazooka
BAZOOKA.Transparency = 1

BAZOOKA.Parent = CHARACTER
BAZOOKA.Anchored = false
local BAZOOKAWELD = IT("Motor6D")
BAZOOKAWELD.Part0 = TORSO
BAZOOKAWELD.Part1 = BAZOOKA
BAZOOKAWELD.Parent = TORSO
local BC0 = CF(0,0,0.75)*ANGLES(RAD(90),RAD(-40),RAD(90))*ANGLES(RAD(0),RAD(0),RAD(0))
BAZOOKAWELD.C0 = BC0
for _, c in pairs(CHARACTER:GetDescendants()) do
	if c:IsA("BasePart") then
		c.Locked = true
		c.Anchored = false
	end
end
local GUI = MODULE.ControlsGUI
GUI.Parent = game.CoreGui
GUI.ToggleButton.MouseButton1Click:Connect(function()
	if GUI.ToggleButton.Controls.Visible == false then
		GUI.ToggleButton.Controls.Visible = true
	elseif GUI.ToggleButton.Controls.Visible == true then
		GUI.ToggleButton.Controls.Visible = false
	end
end)

local MARKME = IT("Beam",CHARACTER)
MARKME.Name = "Roadrogue"
local LOCKEDSPEED = 150
local HASBAZOOKAEQUIPPED = false

--//====================================================\\--
--||                     ABILITIES
--\\====================================================//--

function Fire()
	local DROPSOUNDS = {3182143803,3182144291,3182144511}
	ATTACKING = true
	RIGHTSHOULDER.Parent = nil
	SMGGRIP.Parent = nil
	SMGTIGHTGRIP.Parent = RIGHTARM
	local DETECTKILL = function(HIT,POS,FORCE)
		if HIT.Parent:FindFirstChildOfClass("Humanoid") then
			if HIT.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then

			else
			end
			----ManSlaughter(HIT.Parent)
			NewSound({ID = 1489924400,PARENT = HIT,VOLUME = 1,PITCH = MRANDOM(9,11)/10,LOOP = false,MAXDISTANCE = 75,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		elseif HIT.Parent.Parent:FindFirstChildOfClass("Humanoid") then
			if HIT.Parent.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
				if HIT.Parent.Parent:FindFirstChildOfClass("Humanoid").Torso then

				end
			else
			end
			--ManSlaughter(HIT.Parent.Parent)
			NewSound({ID = 1489924400,PARENT = HIT,VOLUME = 1,PITCH = MRANDOM(9,11)/10,LOOP = false,MAXDISTANCE = 75,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		else
			--Debree({Delay = 1.5,Variant = "Loose",Location = POS,Color = HIT.Color,Size = 0.2,Distance = 1,Material = HIT.Material,Scatter = 60,Amount = 1,DebreeCount = 4})
		end
	end
	local DOFIRE = 0
	local GYRO = IT("BodyGyro")
	GYRO.D = 20
	GYRO.P = 500
	GYRO.MaxTorque = VT(4000000,4000000,4000000)
	GYRO.CFrame = CF(RIGHTARM.CFrame*CF(0,0.8,0).p,m.hit.p)*ANGLES(RAD(90),RAD(45),0)
	GYRO.Parent = RIGHTARM
	repeat
		Swait()
		DOFIRE = DOFIRE + 1
		if DOFIRE > 4 then
			DOFIRE = 0
			local PROP = BULLETPROP:Clone()
			PROP.Anchored = false
			PROP.Parent = workspace
			PROP.CFrame = SMG.CFrame*ANGLES(RAD(90),0,0)
			local BV = IT("BodyVelocity")
			BV.MaxForce = BV.MaxForce * 500
			BV.Velocity = CF(SMG.Position,SMG.CFrame*CF(-1,0,0).p).lookVector*45
			BV.Parent = PROP
			Debris:AddItem(BV,0.1)
			Debris:AddItem(PROP,1)
			NewSound({ID = DROPSOUNDS[MRANDOM(1,#DROPSOUNDS)],PARENT = PROP,VOLUME = 0.35,PITCH = MRANDOM(9,11)/10,LOOP = false,MAXDISTANCE = 65,EMITTERSIZE = 10,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			local HIT,POS = CastProperRay(AttachmentCFrame(SMG.Nuzzle).p,m.hit.p,1000,CHARACTER)
			local DISTANCE = (POS - AttachmentCFrame(SMG.Nuzzle).p).Magnitude
			if HIT then
			end
			SMG.Nuzzle.Flash:Emit(10)
			NewSound({ID = 1583819337,PARENT = SMG,VOLUME = 0.45,PITCH = MRANDOM(9,11)/7.5,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 10,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		end
		GYRO.CFrame = CF(RIGHTARM.CFrame*CF(0,0.8,0).p,m.hit.p)*ANGLES(RAD(90),RAD(45),0)
	until MOUSEHOLD == false
	wait(0.1)
	GYRO:Remove()
	RIGHTSHOULDER.Parent = TORSO
	SMGGRIP.Parent = RIGHTARM
	SMGTIGHTGRIP.Parent = nil
	ATTACKING = false
end

function Boost()
	if HUM.WalkSpeed > 10 then
		BOOST = true
		USEDEFAULTANIMATIONS = false
		HUM.WalkSpeed = LOCKEDSPEED*2
		MOTOR.RightPipe.Fire.Enabled = true	
		MOTOR.LeftPipe.Fire.Enabled = true
		NewSound({ID = 142472270,PARENT = MOTOR,VOLUME = 10,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 10,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		for i=0, 4, 0.1 / ANIM_SPEED do
			Swait()
			local SPINVELOCITY = -ROOT.RotVelocity.Y/12.5
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,1.4,1.5)*ANGLES(RAD(35),RAD(0)-SPINVELOCITY/6,RAD(0)-SPINVELOCITY/2)*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.45,-0.3)*ANGLES(RAD(-30),RAD(0)-SPINVELOCITY/2,RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0,-1.7,-0.5)*ANGLES(RAD(0),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.3,0.5,-0.3)*ANGLES(RAD(110),RAD(15),RAD(15))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0.2,-1.1,-0.4)*ANGLES(RAD(90),RAD(0),RAD(-160))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.4,-0.1)*ANGLES(RAD(64.6),RAD(-5),RAD(-5))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.7,-1.4,0.1)*ANGLES(RAD(-50),RAD(0),RAD(10))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.7,-1.4,0.1)*ANGLES(RAD(-50),RAD(0),RAD(-10))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
			if ROOT.Velocity.Magnitude <= 0.5 then
				break

			end
		end
		MOTOR.RightPipe.Fire.Enabled = false	
		MOTOR.LeftPipe.Fire.Enabled = false
		USEDEFAULTANIMATIONS = true
		BOOST = false
	end
end

function Molotov()
	if ATTACKING == false then
		ATTACKING = true		
		USEDEFAULTANIMATIONS = false
		NewSound({ID = 2764683507,PARENT = ROOT,VOLUME = 5,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 35,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		for i=0, 0.1, 0.1 / ANIM_SPEED do
			Swait()
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,1.3,-0.5)*ANGLES(RAD(-20),RAD(10),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.5,0.1)*ANGLES(RAD(15.2),RAD(-9.7),RAD(2.6))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0.1,-2.5,-0.4)*ANGLES(RAD(20.3),RAD(-9.4),RAD(3.5))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.5,1.1,-0.7)*ANGLES(RAD(119.3),RAD(6.7),RAD(13.4))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0.6,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(-155))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.2,-0.1)*ANGLES(RAD(30.4),RAD(-8.6),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.8,-2,-0.2)*ANGLES(RAD(-20.9),RAD(-5.1),RAD(11.1))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.7,-2,-0.2)*ANGLES(RAD(-29.6),RAD(-3.7),RAD(-8.6))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
		end
		local MOLOTOV = MOLOTOVPROP:Clone()
		MOLOTOV.CanCollide = false
		MOLOTOV.Parent = Effects
		MOLOTOV.CFrame = CF(RIGHTARM.Position,m.hit.p)*ANGLES(RAD(45),0,0)
		MOLOTOV.Anchored = false
		local IMPACT = false
		local FORCE = 15 + (MOLOTOV.Position-m.hit.p).Magnitude
		if FORCE > 300 then
			FORCE = 300
		end
		local BV = IT("BodyVelocity")
		BV.MaxForce = BV.MaxForce * 500
		BV.Velocity = CF(MOLOTOV.Position,m.hit.p+VT(0,6,0)).lookVector*FORCE
		BV.Parent = MOLOTOV
		Debris:AddItem(BV,0.05)
		MOLOTOV.RotVelocity = VT(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5))
		wait(0.1)
		MOLOTOV.CanCollide = true
		local BOOM = function(CHECKMODEL)
			if IMPACT == false then
				IMPACT = true
				local FLOOR,POS = Raycast(MOLOTOV.Position+VT(0,5,0),CF(VT(0,0,0),VT(0,-1,0)).lookVector,12,{CHARACTER,CHECKMODEL})
				if FLOOR then
					CameraShake(POS,35,5,6)
					for i = 1, MRANDOM(3,5) do
						coroutine.resume(coroutine.create(function()
							local FIRE = CreatePart(3,Effects,"Neon",0,1,"Grey","Fire",VT(10,2,10),true)
							FIRE.CFrame = CF(POS)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,0,(i-1)*5)
							NewSound({ID = 3303579709,PARENT = FIRE,VOLUME = 6,PITCH = MRANDOM(8,12)/10,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 35,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
							local BURN = script.AoEFire:Clone()
							BURN.Parent = FIRE
							BURN.Enabled = true
							local TOUCH = FIRE.Touched:Connect(function(HIT)
								if HIT.Parent:FindFirstChildOfClass("Humanoid") and HIT.Parent ~= CHARACTER and HIT.Parent:FindFirstChild("Roadrogue") == nil then
									if HIT.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
										NewSound({ID = 3303579709,PARENT = HIT,VOLUME = 3,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 35,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
										for index, CHILD in pairs(HIT.Parent:GetChildren()) do
											if CHILD:IsA("BasePart") and CHILD:FindFirstChild("Fire") == nil then

											end
										end
									end
									----ManSlaughter(HIT.Parent)
								end
							end)
							wait(MRANDOM(90,175)/10)
							BURN.Enabled = false
							TOUCH:Disconnect()
						end))
					end
				end
				MOLOTOV.Transparency = 1
				MOLOTOV.Anchored = true
				MOLOTOV.CanCollide = false
				MOLOTOV.Head.Fire.Enabled = false
				Debris:AddItem(MOLOTOV,5)
				NewSound({ID = 156444949,PARENT = MOLOTOV,VOLUME = 7.5,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 35,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			end
		end
		local HIT = MOLOTOV.Touched:Connect(function(PART)
			if PART.Anchored == true then
				local CHECKMODEL = nil
				if PART.Parent ~= workspace and PART.Anchored == false then
					CHECKMODEL = PART.Parent
				end
				BOOM(CHECKMODEL)
			end
		end)
		for i=0, 0.3, 0.1 / ANIM_SPEED do
			Swait()
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,1.3,-0.5)*ANGLES(RAD(-20),RAD(10),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.5,0.1)*ANGLES(RAD(15.2),RAD(-9.7),RAD(2.6))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0.1,-2.5,-0.4)*ANGLES(RAD(20.3),RAD(-9.4),RAD(3.5))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.5,1.1,-0.7)*ANGLES(RAD(119.3),RAD(6.7),RAD(13.4))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0.6,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(-155))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.2,-0.1)*ANGLES(RAD(30.4),RAD(-8.6),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.8,-2,-0.2)*ANGLES(RAD(-20.9),RAD(-5.1),RAD(11.1))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.7,-2,-0.2)*ANGLES(RAD(-29.6),RAD(-3.7),RAD(-8.6))*ANGLES(RAD(0),RAD(0),RAD(0)),2.25 / ANIM_SPEED)
		end
		USEDEFAULTANIMATIONS = true
		ATTACKING = false
	end
end

function LooseBike()
	if ROOT.Velocity.Magnitude <= 1 then
		USEDEFAULTANIMATIONS = false
		ATTACKING = true
		BOOST = true
		HUM.WalkSpeed = 0
		HUM.JumpPower = 0
		for i = 1, 60 do
			Swait()
			ROOT.CFrame = ROOT.CFrame*ANGLES(0,RAD(-i/2),0)
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0.2,-0.6,0.5)*ANGLES(RAD(-3.5),RAD(3.5),RAD(-44.9))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.5,0)*ANGLES(RAD(5),RAD(45),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0,-1.7,-0.6)*ANGLES(RAD(5),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.5,0.8,-0.2)*ANGLES(RAD(95),RAD(50),RAD(60))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(180))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.4,0)*ANGLES(RAD(60),RAD(-10),RAD(-5))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.7,-1.6,-0.3)*ANGLES(RAD(-20),RAD(0),RAD(10))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.7,-1.6,-0.3)*ANGLES(RAD(-20),RAD(0),RAD(-10))*ANGLES(RAD(0),RAD(0),RAD(0)),2 / ANIM_SPEED)
		end
		ROOT.CFrame = CF(ROOT.Position,VT(m.hit.p.X,ROOT.Position.Y,m.hit.p.Z))
		coroutine.resume(coroutine.create(function()
			local FAKEMOTOR = MOTOR:Clone()
			FAKEMOTOR.ManualWeld:Remove()
			FAKEMOTOR.CFrame = CF(MOTOR.Position,VT(m.hit.p.X,MOTOR.Position.Y+0.5,m.hit.p.Z))
			FAKEMOTOR.Anchored = true
			local DIDHIT = false
			FAKEMOTOR.RightPipe.Fire.Enabled = true
			FAKEMOTOR.LeftPipe.Fire.Enabled = true
			FAKEMOTOR.Dust.Dust.Enabled = true
			FAKEMOTOR.Parent = Effects
			local VROT = NewSound({ID = 122292723,PARENT = FAKEMOTOR,VOLUME = 1.5,PITCH = 3,LOOP = true,MAXDISTANCE = 125,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			NewSound({ID = 142472270,PARENT = FAKEMOTOR,VOLUME = 10,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 35,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			for i = 1, 200 do
				Swait()
				local FLOOR,POS = Raycast(FAKEMOTOR.Position,CF(VT(0,0,0),VT(0,-1,0)).lookVector,5.5,CHARACTER)
				if FLOOR then
					FAKEMOTOR.CFrame = CF(FAKEMOTOR.Position.X,POS.Y+FAKEMOTOR.Size.Y/2,FAKEMOTOR.Position.Z)*ANGLES(0,RAD(FAKEMOTOR.Orientation.Y),0) * CF(0,0,-2.5)
					local HIT = Raycast(FAKEMOTOR.Position,FAKEMOTOR.CFrame.lookVector,2.6,CHARACTER)
					if HIT then
						DIDHIT = true
						break
					end
				else
					break
				end
			end
			VROT:Remove()
			if DIDHIT == true then
				FAKEMOTOR.Core.Core.Size = NumberSequence.new(10,25)
				FAKEMOTOR.Core.Dust:Emit(200)
				FAKEMOTOR.Core.Black:Emit(15)
				FAKEMOTOR.Core.Core:Emit(100)
				for index, CHILD in pairs(FAKEMOTOR:GetChildren()) do
					if CHILD.Name ~= "Core" then
						CHILD:Remove()
					end
				end
				local B = IT("Explosion")
				B.BlastPressure = 0
				B.BlastRadius = 50
				B.Parent = workspace
				B.Position = FAKEMOTOR.Position
				B.Hit:Connect(function(PART)
					if PART.Parent:FindFirstChildOfClass("Humanoid") == nil and PART.Parent.Parent:FindFirstChildOfClass("Humanoid") == nil then
						if PART.Anchored == false then
							PART:BreakJoints()
							local BV = IT("BodyVelocity")
							BV.MaxForce = BV.MaxForce * 500
							BV.Velocity = CF(FAKEMOTOR.Position,PART.Position+VT(0,5,0)).lookVector*MRANDOM(35,75)
							BV.Parent = PART
							Debris:AddItem(BV,0.5)
							if MRANDOM(1,3) == 1 then
							end
						end
					end
				end)
				CameraShake(FAKEMOTOR.Position,150,10,75)
				local VICTIMS = AreaOfEffect(FAKEMOTOR.Position,65,0,0,true)
				if #VICTIMS > 0 then
					for E = 1, #VICTIMS do
						local VROOT = VICTIMS[E][1]:FindFirstChild("Torso") or VICTIMS[E][1]:FindFirstChild("LowerTorso")
						if VROOT then
							local BV = IT("BodyVelocity")
							BV.MaxForce = BV.MaxForce * 500
							BV.Velocity = CF(FAKEMOTOR.Position,VROOT.Position+VT(0,5,0)).lookVector*MRANDOM(35,75)
							BV.Parent = VROOT
							Debris:AddItem(BV,0.5)
						end
						--ManSlaughter(VICTIMS[E][1])
						for index, CHILD in pairs(VICTIMS[E][1]:GetChildren()) do
							if CHILD:IsA("BasePart") and MRANDOM(1,3) == 1 then

							end
						end
					end
				end
				NewSound({ID = 243702774,PARENT = FAKEMOTOR,VOLUME = 7.5,PITCH = 1.5,LOOP = false,MAXDISTANCE = 550,EMITTERSIZE = 75,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
				FAKEMOTOR.Transparency = 1
				for i = 1, 2 do
					local WHEEL = BACKUPWHEEL:Clone()
					WHEEL.Parent = workspace
					WHEEL.CFrame = FAKEMOTOR.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
					WHEEL.RotVelocity = VT(MRANDOM(-5,5),MRANDOM(-5,5),MRANDOM(-5,5))
					local BV = IT("BodyVelocity")
					BV.MaxForce = BV.MaxForce * 500
					BV.Velocity = WHEEL.CFrame.lookVector*85
					BV.Parent = WHEEL
					Debris:AddItem(BV,0.12)
					Debris:AddItem(WHEEL,15)
				end
				Debris:AddItem(FAKEMOTOR,7.1)
			else
				FAKEMOTOR.CanCollide = true
				FAKEMOTOR.Parent = workspace
				FAKEMOTOR.Anchored = false
				FAKEMOTOR.Dust.Dust.Enabled = false
				FAKEMOTOR.RightPipe.Fire.Enabled = false
				FAKEMOTOR.LeftPipe.Fire.Enabled = false
				Debris:AddItem(FAKEMOTOR,15)
			end
		end))
		MOTOR.Transparency = 1
		FRONTWHEEL.Transparency = 1
		BACKWHEEL.Transparency = 1		
		for i=0, 0.4, 0.1 / ANIM_SPEED do
			Swait()
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,1.8,0.5)*ANGLES(RAD(10),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.4,-0.4)*ANGLES(RAD(-25),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.4,-0.2,0.2)*ANGLES(RAD(20),RAD(-20),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(180))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.2,0)*ANGLES(RAD(-0.3),RAD(-2.6),RAD(-14.8))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.5,-1.5,-0.1)*ANGLES(RAD(-45),RAD(-5),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.5,-1.8,0.2)*ANGLES(RAD(-15),RAD(5),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
		end
		ATTACKING = false
		for i=0, 2, 0.1 / ANIM_SPEED do
			Swait()
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,-1,0.6)*ANGLES(RAD(-5),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.5,0)*ANGLES(RAD(5),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.5,-0.1,0)*ANGLES(RAD(24.9),RAD(1.7),RAD(4.7))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(-180))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-0.4,0.4,-1)*ANGLES(RAD(80.9),RAD(5.7),RAD(48.4))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.5,-0.9,-1.1)*ANGLES(RAD(-10),RAD(-10),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.5,-1.5,0)*ANGLES(RAD(-60),RAD(10),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1.35 / ANIM_SPEED)
		end
		coroutine.resume(coroutine.create(function()
			for i = 1, 10 do
				Swait()
				MOTOR.Transparency = MOTOR.Transparency - 1/10
			end
			MOTOR.Transparency = 1
			FRONTWHEEL.Transparency = 1
			BACKWHEEL.Transparency = 1
		end))
		for i=0, 0.25, 0.1 / ANIM_SPEED do
			Swait()
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,1.8,0.5)*ANGLES(RAD(10),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.4,-0.4)*ANGLES(RAD(-25),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.4,-0.2,0.2)*ANGLES(RAD(20),RAD(-20),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(180))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.2,0)*ANGLES(RAD(-0.3),RAD(-2.6),RAD(-14.8))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.5,-1.5,-0.1)*ANGLES(RAD(-45),RAD(-5),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.5,-1.8,0.2)*ANGLES(RAD(-15),RAD(5),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1 / ANIM_SPEED)
		end
		BOOST = false
		USEDEFAULTANIMATIONS = true
		HUM.WalkSpeed = 5
		HUM.JumpPower = 85
	end
end

function GrabBazooka()
	if HASBAZOOKAEQUIPPED == false then
		local ONCOOLDOWN = false
		NewSound({ID = 171140306,PARENT = ROOT,VOLUME = 1,PITCH = MRANDOM(9,11)/15,LOOP = false,MAXDISTANCE = 75,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		HASBAZOOKAEQUIPPED = true
		BAZOOKAWELD.Part0 = RIGHTARM
		BAZOOKAWELD.C0 = CF(-0.4,-0.9,-0.7)*ANGLES(RAD(-88.7),RAD(4.8),RAD(-15.1))*ANGLES(RAD(0),RAD(0),RAD(0))
		local Fire = function()
			local LOCKONTOPART = nil
			if MOUSEHIT then
				local HUM = MOUSEHIT.Parent:FindFirstChildOfClass("Humanoid") or MOUSEHIT.Parent.Parent:FindFirstChildOfClass("Humanoid")
				if HUM then
					if HUM.Health > 0 and HUM.Torso then
						LOCKONTOPART = HUM.Torso
					end
				end
			end
			local GOTO = m.hit.p
			local ROCKET = MISILEPROP:Clone()
			ROCKET.Parent = Effects
			ROCKET.CFrame = CF(BAZOOKA.CFrame*CF(0,0,-2).p,GOTO)
			NewSound({ID = 440145223,PARENT = BAZOOKA,VOLUME = 5,PITCH = MRANDOM(9,11)/10,LOOP = false,MAXDISTANCE = 80,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			NewSound({ID = 440145223,PARENT = ROCKET,VOLUME = 5,PITCH = MRANDOM(9,11)/10,LOOP = false,MAXDISTANCE = 80,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			for i = 1, 200 do
				Swait()
				local HIT,POS = Raycast(ROCKET.Position,ROCKET.CFrame.lookVector,4,CHARACTER)
				if HIT then
					ROCKET.CFrame = CF(POS)
					break
				end
				if LOCKONTOPART then
					ROCKET.CFrame = Clerp(ROCKET.CFrame,CF(ROCKET.Position,LOCKONTOPART.Position),0.2)*CF(0,0,-2.25)
				else
					ROCKET.CFrame = ROCKET.CFrame*CF(0,0,-3)
				end
			end
			ROCKET.Transparency = 1
			ROCKET.Hind:Remove()
			ROCKET.CFrame = CF(ROCKET.Position)
			ROCKET.Size = VT(0,0,0)
			NewSound({ID = 142070127,PARENT = ROCKET,VOLUME = 7,PITCH = MRANDOM(8,12)/10,LOOP = false,MAXDISTANCE = 300,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			local B = IT("Explosion")
			B.BlastPressure = 0
			B.BlastRadius = 15
			B.Position = ROCKET.Position
			B.Parent = workspace
			CameraShake(ROCKET.Position,55,2,7)
			Debris:AddItem(ROCKET,2)
		end
		wait(0.5)
		game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
			if KeyPressed == "v" and ATTACKING == false and USEDEFAULTANIMATIONS == true and HASBAZOOKAEQUIPPED == true then
				wait(0.1)
				NewSound({ID = 171140306,PARENT = ROOT,VOLUME = 1,PITCH = MRANDOM(9,11)/15,LOOP = false,MAXDISTANCE = 75,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
				HASBAZOOKAEQUIPPED = false
				BAZOOKAWELD.Part0 = TORSO
				BAZOOKAWELD.C0 = BC0
			end
		end)
		game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function(KeyPressed)
			if ATTACKING == false then
				if HASBAZOOKAEQUIPPED == true and ONCOOLDOWN == false then
					ONCOOLDOWN = true
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.5,0.4,0.7)*ANGLES(RAD(90),RAD(15),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),2.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(0.5,0.3,-0.9)*ANGLES(RAD(91.4),RAD(-16.9),RAD(19.9))*ANGLES(RAD(0),RAD(0),RAD(0)),2.5 / ANIM_SPEED)
					coroutine.resume(coroutine.create(function()
						wait(0.25)
						ONCOOLDOWN = false
					end))
					Fire()
				end
			end
		end)
	end
end

--//====================================================\\--
--||                       WRAP
--\\====================================================//--

game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function(KeyPressed)
	if ATTACKING == false then
		if HASBAZOOKAEQUIPPED == false then
			MOUSEHOLD = true
			Fire()
		end
	end
end)

game.Players.LocalPlayer:GetMouse().Button1Up:Connect(function(KeyPressed)
	MOUSEHOLD = false
end)
 
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == "v" and ATTACKING == false and USEDEFAULTANIMATIONS == true and HASBAZOOKAEQUIPPED == false then
		GrabBazooka()
	elseif KeyPressed == "c" and ATTACKING == false and HASBAZOOKAEQUIPPED == false then
		LooseBike()
	elseif KeyPressed == "x" and ATTACKING == false and HASBAZOOKAEQUIPPED == false then
		Molotov()
	elseif KeyPressed == "z" and ATTACKING == false and HASBAZOOKAEQUIPPED == false then
		Boost()
	end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == "t" then
		NewSound({ID = 159882462,PARENT = ROOT,VOLUME = 10,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 50,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
	elseif KeyPressed == "y" then
		NewSound({ID = 463770058,PARENT = ROOT,VOLUME = 10,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 50,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
	elseif KeyPressed == "u" then
		NewSound({ID = 159882546,PARENT = ROOT,VOLUME = 10,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 50,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
	elseif KeyPressed == "g" then
		NewSound({ID = 159882441,PARENT = ROOT,VOLUME = 10,PITCH = 1,LOOP = false,MAXDISTANCE = 125,EMITTERSIZE = 50,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
	end
end)


game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == "e" then
		if ROOT:FindFirstChild("BGM_MUSIC") then
			ROOT:FindFirstChild("BGM_MUSIC"):Remove()
		else
			local M = NewSound({ID = TRACKS[TRACK][1],PARENT = ROOT,VOLUME = TRACKS[TRACK][2],PITCH = 1,LOOP = true,MAXDISTANCE = 300,EMITTERSIZE = 300,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			M.Name = "BGM_MUSIC"
		end
	end
end)

--==============================================

local M = NewSound({ID = 2598781800,PARENT = ROOT,VOLUME = 2.75,PITCH = 1,LOOP = true,MAXDISTANCE = 300,EMITTERSIZE = 300,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
M.Name = "BGM_MUSIC"

HUM.PlatformStand = false
script.Parent = PLAYER.Backpack
HUM.WalkSpeed = 5
HUM.JumpPower = 85
while true do
	Swait()
	SINE = SINE + CHANGE
	if CHARACTER:FindFirstChild("Animate") then
		CHARACTER:FindFirstChild("Animate"):Destroy()
	end
	if CHARACTER:FindFirstChild("Sound") then
		CHARACTER:FindFirstChild("Sound"):Destroy()
	end
	for _,v in next, HUM:GetPlayingAnimationTracks() do
		v:Stop();
	end
	local TORSOVELOCITY = (ROOT.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = ROOT.Velocity.y
	local HITFLOOR = Raycast(ROOT.Position, (CF(ROOT.Position, ROOT.Position + VT(0, -1, 0))).lookVector, 4+HUM.HipHeight, CHARACTER)
	local WALKSPEEDVALUE = 4 / (HUM.WalkSpeed / 16)
	if ROOT:FindFirstChild("MOTORHUM") == nil then
		MOTORHUM = NewSound({ID = 122292723,PARENT = ROOT,VOLUME = 1.5,PITCH = 1,LOOP = true,MAXDISTANCE = 125,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
		MOTORHUM.Name = "MOTORHUM"
	else
		if ROOT:FindFirstChild("MOTORHUM").Playing == false then
			ROOT:FindFirstChild("MOTORHUM").Playing = true
		end
	end
	local SPINVELOCITY = -ROOT.RotVelocity.Y/12.5
	if HASBAZOOKAEQUIPPED == true then
		RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.5,0.4,0.3)*ANGLES(RAD(90),RAD(15),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
		SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-1.1,0.2)*ANGLES(RAD(10),RAD(0),RAD(-180))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
		LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(0.5,0.3,-1.3)*ANGLES(RAD(91.4),RAD(-16.9),RAD(19.9))*ANGLES(RAD(0),RAD(0),RAD(0)),0.5 / ANIM_SPEED)
	end
	if TORSOVELOCITY > 0.5 then
		ANIM = "Drive"
	else
		ANIM = "Idle"
	end
	if HITFLOOR then
		if TORSOVELOCITY < 1 and HITFLOOR ~= nil then
			MOTOR.Dust.Dust.Enabled = false
			if USEDEFAULTANIMATIONS == true then
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(-0.6,0.2,0.6)*ANGLES(RAD(0),RAD(15),RAD(10))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0,CF(0,1.5,0)*ANGLES(RAD(0),RAD(-15),RAD(-5))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0.5,-1.5,-0.5)*ANGLES(RAD(-2.7),RAD(-14.8),RAD(-5.3))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				if HASBAZOOKAEQUIPPED == false then
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.4,0.3,0.4)*ANGLES(RAD(31.3),RAD(-39.9),RAD(55.5))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
					SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(-0.1,-1.1,-0.4)*ANGLES(RAD(98.3),RAD(-4.8),RAD(-168.1))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.3,-0.65)*ANGLES(RAD(89.9),RAD(-4.8),RAD(15))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				end
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(1.2,-1.6,0.1)*ANGLES(RAD(-14.6),RAD(-11.9),RAD(-14.6))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.7,-2.2,0)*ANGLES(RAD(3.7),RAD(-1.1),RAD(-14.5))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			end
		elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
			MOTOR.Dust.Dust.Enabled = true
			if USEDEFAULTANIMATIONS == true then
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,0.5,0.5)*ANGLES(RAD(-15),RAD(0)-SPINVELOCITY/6,RAD(0)-SPINVELOCITY/2)*ANGLES(RAD(0),RAD(0),RAD(0)),0.4 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0,CF(0,1.425,0.1)*ANGLES(RAD(15),RAD(0)-SPINVELOCITY/2,RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),0.4 / ANIM_SPEED)
				MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0,-1.5,-0.9)*ANGLES(RAD(15),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),0.4 / ANIM_SPEED)
				if HASBAZOOKAEQUIPPED == false then
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.7,0.1,-0.1)*ANGLES(RAD(47.7),RAD(-32.8),RAD(49.9))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
					SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-1.1,-0.5)*ANGLES(RAD(90),RAD(0),RAD(-180))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.5,0.3,0)*ANGLES(RAD(89.9),RAD(-4.8),RAD(-1.3))*ANGLES(RAD(0),RAD(0),RAD(0)),0.4 / ANIM_SPEED)
				end
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.7,-1.5,-0.6)*ANGLES(RAD(-15),RAD(0),RAD(10))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.7,-1.5,-0.6)*ANGLES(RAD(-15),RAD(0),RAD(-10))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			end
		end
	else
		MOTOR.Dust.Dust.Enabled = false
		if USEDEFAULTANIMATIONS == true then
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,CF(0,0.5,0.6)*ANGLES(RAD(10.2),RAD(9.8),RAD(-1.8))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0,CF(0,1.5,-0.3)*ANGLES(RAD(-15.1),RAD(-10),RAD(-0.9))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			MOTORWELD.C0 = Clerp(MOTORWELD.C0,CF(0.1,-1.5,-0.3)*ANGLES(RAD(0.2),RAD(-9.8),RAD(1.8))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			if HASBAZOOKAEQUIPPED == false then
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0,CF(1.3,0.4,-0.2)*ANGLES(RAD(146),RAD(32.6),RAD(13.5))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				SMGGRIP.C0 = Clerp(SMGGRIP.C0,CF(0,-0.9,-0.4)*ANGLES(RAD(103.5),RAD(6.2),RAD(-178.6))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0,CF(-1.4,0.3,0)*ANGLES(RAD(75),RAD(0),RAD(0))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			end
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0,CF(0.8,-1.6,0.1)*ANGLES(RAD(-40.2),RAD(-16.1),RAD(8))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0,CF(-0.8,-1.6,0)*ANGLES(RAD(-33.9),RAD(-1.7),RAD(-17.1))*ANGLES(RAD(0),RAD(0),RAD(0)),1.2 / ANIM_SPEED)
		end
	end
	for i = 1, #WHEELJOINTS do
		WHEELJOINTS[i].C1 = ANGLES(RAD((HUM.WalkSpeed-5)),0,0) * WHEELJOINTS[i].C1
	end
	if LOCKEDSPEED == 75 then
		MOTOR.Safelock.Light.Enabled = true
	else
		MOTOR.Safelock.Light.Enabled = false
	end
	if BOOST == false then
		if ANIM == "Drive" then
			if HUM.WalkSpeed < LOCKEDSPEED then
				HUM.WalkSpeed = HUM.WalkSpeed + 0.75
			else
				HUM.WalkSpeed = LOCKEDSPEED
			end
		else
			if HUM.WalkSpeed > 5 then
				HUM.WalkSpeed = HUM.WalkSpeed - 3.75
			else
				HUM.WalkSpeed = 5
			end
		end
	end
	MOTORHUM.Pitch = HUM.WalkSpeed/10
	if MOTORHUM.Pitch > 3.25 then
		MOTORHUM.Pitch = 3.25
	end
	HUM.Sit = false
	HUM.PlatformStand = false
end
