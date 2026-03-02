-- Sick ass gun script I decided to fix and convert once again
-- HATS:
-- https://www.roblox.com/catalog/4504231783/Elemental-Crystal-Golem-Shoulder-Rock
-- https://www.roblox.com/catalog/15008447503/Slug-Rifle-Blue
-- CHANGE THE RIGS TO YOUR OWN RIGS IN LINE 1012 TO 1016 (Autorig is recommended btw)

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
	PermanentDeath = true,
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

local script = game:GetObjects("rbxassetid://10170885565")[1]

local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local UIS,Mouse,CrossClient=nil,nil,nil
Player = game.Players.LocalPlayer

--// Shortcuts
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palatte
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local CosSin=math.CosSin
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--// Basic functions
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1,Pitch=Pitch or 1,MaxDistance=MaxDistance or 500,EmitterSize=EmitterSize or 5,Looped=Looped or false,SoundId="rbxassetid://"..Id,Parent=Parent})
	S:Play()
	coroutine.wrap(function()
		if S.Looped then return end
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
--// Setup 1
for i,v in pairs(Player.Character:GetDescendants()) do
	if (v.Name=="Animate" and v:IsA("LocalScript")) or v:IsA("Animator") then
		Instance.Remove(v)
	end
end
--// Character indexing
local LockWS,LockJP=false,false
local Type="R6"
local Char,char=Workspace.DuskySpoon,Workspace.DuskySpoon
local Hum,hum=Char:FindFirstChildOfClass("Humanoid"),Char:FindFirstChildOfClass("Humanoid")
local hrp,HRP=Char.HumanoidRootPart,Char.HumanoidRootPart
local h,t,rs,ls,rl,ll
local nec,rs,ls,rh,lh,rutj
local necC0,necC1=cf(),cf()
local rutjC0,rutjC1=cf(),cf()
local rsC0,rsC1=cf(),cf()
local lsC0,lsC1=cf(),cf()
local rhC0,rhC1=cf(),cf()
local lhC0,lhC1=cf(),cf()
local h,ut,lt,rua,rla,rh,lua,lla,lh,ral,rll,rf,lul,lll,lf
local CFs={}
local Joints={}
if Type=="R6" then
	h,t,ra,la,rl,ll=char.Head,char.Torso,char["Right Arm"],char["Left Arm"],char["Right Leg"],char["Left Leg"]
	nec,rutj,rs,ls,rh,lh=t.Neck,hrp.RootJoint,t["Right Shoulder"],t["Left Shoulder"],t["Right Hip"],t["Left Hip"]
	necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
	rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
	rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
	lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
	rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
	lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)

	nec=ins("Motor6D",{Name="Neck",Part0=t,Part1=h,C0=necC0,C1=necC1,Parent=t,})
	rutj=ins("Motor6D",{Name="RootJoint",Part0=hrp,Part1=t,C0=rutjC0,C1=rutjC1,Parent=hrp,})
	rs=ins("Motor6D",{Name="Right Shoulder",Part0=t,Part1=ra,C0=rsC0,C1=rsC1,Parent=t,})
	ls=ins("Motor6D",{Name="Left Shoulder",Part0=t,Part1=la,C0=lsC0,C1=lsC1,Parent=t,})
	rh=ins("Motor6D",{Name="Right Hip",Part0=t,Part1=rl,C0=rhC0,C1=rhC1,Parent=t,})
	lh=ins("Motor6D",{Name="Left Hip",Part0=t,Part1=ll,C0=lhC0,C1=lhC1,Parent=t,})
elseif Type=="R15" then
	h,hrp=Char.Head,Char.HumanoidRootPart
	ut,lt=Char.UpperTorso,Char.LowerTorso
	rua,rla,rh=Char.RightUpperArm,Char.RightLowerArm,Char.RightHand
	lua,lla,lh=Char.LeftUpperArm,Char.LeftLowerArm,Char.LeftHand
	rul,rll,rf=Char.RightUpperLeg,Char.RightLowerLeg,Char.RightFoot
	lul,lll,lf=Char.LeftUpperLeg,Char.LeftLowerLeg,Char.LeftFoot
	for i,v in pairs(Char:GetDescendants()) do
		if v:IsA("Motor6D") then
			local CFData={C0=cf(v.C0.Position),C1=cf(v.C1.Position),Part0=v.Part0,Part1=v.Part1,Parent=v.Parent}
			local Joint=ins("Motor6D",{C0=CFData.C0,C1=CFData.C1,Part0=CFData.Part0,Part1=CFData.Part1,Name=v.Name,Parent=CFData.Parent,})
			CFs[v.Name]=CFData
			Joints[v.Name]=setmetatable({Object=Joint,Link=CFData,Remove=function(Time) Instance.Remove(Joint,Time) end},{__index=Joint,__newindex=function(self,k,v) Joint[k]=v end})
		end
	end
end
--// Variables
local Using=false
local Muted=false
local Holding=false
local TimePos=0
local Sine=0
local Change=1
local WS,JP=16,50
local Step="R"
local StepSounds={Plastic=2812418291,SmoothPlastic=2812418291,Neon=2812418291,ForceField=2812418291,Metal=2812417769,DiamondPlate=2812417769,CorrodedMetal=2812417769,Foil=2812417769,Sand=619188333,Grass=619188333,Slate=941640049,Concrete=941640049,Granite=941640049,Pebble=941640049,Marble=941640049,Cobblestone=941640049,Brick=941640049,Water=685857471,Wood=2812419402,WoodPlanks=2812419402,Fabric=133705377,Snow=619083295}
--// Setup 2
local Effects=ins("Model",{Name="Effects",Parent=Char})
local Theme=Sound(243924503,not Muted and 1.5 or 0,1,t,250,15,true)
ins("ForceField",{Parent=char,Visible=false})
local Rifle=script.Data.Models.Rifle Rifle.Parent=t
local RW=ins("Motor6D",{Parent=t,Part0=ra,Part1=Rifle.Dark,C0=cf(-.1,-ra.Size.Y/2,0),C1=cf(Rifle.Dark.HandlePos.Position)*angles(-90,180,90,true)})
--// Functions
function Kill(Model,StartPart,HUM)
	if Model==Char then return end
	local function CheckWeldedParts(Part)
		local Parts={}
		for i,v in pairs(Model:GetDescendants()) do
			if v:IsA("Motor6D") or v:IsA("Weld") then
				if v.Part1==Part then
					table.insert(Parts,v.Part0)
				elseif v.Part0==Part then
					table.insert(Parts,v.Part1)
				end
			end
		end
		return Parts
	end
	local NewThread
	NewThread=function(Parts)
		if #Parts<1 then return end
		for i,v in pairs(Parts) do
			local Parts=CheckWeldedParts(v)
			v:BreakJoints()
			local Time=random(.4,.9,100)
			Instance.Remove(v,Time*2)
			v.Material="Neon"
			v.Color=bc("Neon orange").Color
			v.Anchored=true
			v.CanCollide=false
			v.Massless=true
			v.Locked=true
			v.Transparency=0
			v:ClearAllChildren()
			v.Parent=Effects
			Tween(v,{Transparency=1},{Time,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0})
			NewThread(CheckWeldedParts(Parts))
			local E=script.Data.Models.Emit:Clone()
			E.Parent=v
			v:GetPropertyChangedSignal("Transparency"):Connect(function()
				if v.Transparency>.8 then
					E.Enabled=false
				end
			end)
			wait(random(.01,.05,100))
		end
	end
	local Parts=CheckWeldedParts(StartPart)
	StartPart:BreakJoints()
	local Time=random(.4,.9,100)
	Instance.Remove(StartPart,Time*2)
	StartPart.Material="Neon"
	StartPart.Color=bc("Neon orange").Color
	StartPart.Anchored=true
	StartPart.CanCollide=false
	StartPart.Massless=true
	StartPart.Locked=true
	StartPart.Transparency=0
	StartPart:ClearAllChildren()
	StartPart.Parent=Effects
	Tween(StartPart,{Transparency=1},{Time,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0})
	local E=script.Data.Models.Emit:Clone()
	E.Parent=StartPart
	StartPart:GetPropertyChangedSignal("Transparency"):Connect(function()
		if StartPart.Transparency>.8 then
			E.Enabled=false
		end
	end)
	NewThread(Parts)
	for i,v in pairs(Clone:GetDescendants()) do
		if v:IsA("BasePart") then
			v:BreakJoints()
			local Time=random(.4,.9,100)
			Instance.Remove(v,Time*2)
			v.Material="Neon"
			v.Color=bc("Neon orange").Color
			v.Anchored=true
			v.CanCollide=false
			v.Massless=true
			v.Locked=true
			v.Transparency=0
			v:ClearAllChildren()
			v.Parent=Effects
			Tween(v,{Transparency=1},{Time,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0})
			local E=script.Data.Models.Emit:Clone()
			E.Parent=v
			v:GetPropertyChangedSignal("Transparency"):Connect(function()
				if v.Transparency>.8 then
					E.Enabled=false
				end
			end)
			wait(random(.01,.05,100))
		end
	end
	Instance.Remove(Clone)
end

local S,E=pcall(function()
	Instance.Remove(Bullet,0.6)
	Bullet.Anchored=true
	for i,v in pairs(Bullet:GetChildren()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Enabled=false
		end
	end
	local HUM
	if (RHit.Parent and RHit.Parent:FindFirstChildOfClass("Humanoid")) or (RHit.Parent.Parent and RHit.Parent.Parent:FindFirstChildOfClass("Humanoid")) then
		HUM=RHit.Parent:FindFirstChildOfClass("Humanoid") or RHit.Parent.Parent:FindFirstChildOfClass("Humanoid")
	end
	for i=1,random(3,7) do
		local Time=random(.15,.5,100)
		local Scale=random(.75,1.25,1000)
		local Spark=script.Data.Models.PhysicalSpark:Clone()
		Spark.CFrame=cf(RPos)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true)
		Spark.Attachment1.Position=Spark.Attachment1.Position*v3(1,Scale,1)
		Spark.Attachment2.Position=Spark.Attachment2.Position*v3(1,Scale,1)
		Spark.Parent=workspace
		ins("BodyVelocity",{MaxForce=v3(huge,huge,huge),Velocity=-cf(RPos,RPos-RNID).LookVector*random(5,40),Parent=Spark})
		ins("BodyAngularVelocity",{MaxTorque=v3(huge,huge,huge),AngularVelocity=v3(random(-20,20),random(-20,20),random(-20,20)),Parent=Spark})
		Tween(Spark.Attachment1,{Position=Spark.Attachment1.Position*v3(1,0,1)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
		Tween(Spark.Attachment2,{Position=Spark.Attachment2.Position*v3(1,0,1)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
		Instance.Remove(Spark,Time*2.5)
	end
	if HUM then
		HUM.BreakJointsOnDeath=true
		Kill(HUM.Parent,RHit,HUM)
	end
	Instance.Remove(ins("BodyVelocity",{Parent=RHit,MaxForce=v3(7500,0,7500),Velocity=v3(clamp(Direction.X,-1,1),clamp(Direction.Y,-1,1),clamp(Direction.Z,-1,1))*15}),.1)
end)
if not S then warn(E) end

function CreateBullet()
	local B=script.Data.Models.Bullet:Clone()
	B.CFrame=cf((Rifle.Tubes.CFrame*cf(Rifle.Tubes.FireEffect.Position)).Position,Mouse.Hit.Position)
	pcall(function() B:SetNetworkOwner(Player) end)
	B.Parent=Effects
	Instance.Remove(B,5)
end

--// Moves

function Fire(Start)
	Using=true
	if Start then
		local Time=.25
		Tween(nec,{C0=necC0*cf(0,0,0)*angles(0,85,0,true)*angles(0,0,-40,true)},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(rutj,{C1=rutjC1*(cf(0,0,0)*angles(0,-85,0,true)):Inverse()},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(rs,{C0=rsC0*cf(.1,-.2,-.2)*angles(90,0,0,true)*angles(0,0,-85,true)*angles(10,0,0,true)},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(ls,{C0=lsC0*cf(.7,-.35,.1)*angles(90,0,0,true)*angles(0,0,-45,true)*angles(50,90,0,true)},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(rh,{C1=rhC1*(cf(0,0,0)*angles(0,0,0,true)):Inverse()},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(lh,{C1=lhC1*(cf(0,0,0)*angles(0,0,0,true)):Inverse()},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		Tween(RW,{C0=cf(-.1,-ra.Size.Y/2,0)*angles(-10,0,0,true)},{Time,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0})
		wait(Time)
	end
	if not Holding then Using=false return end
	Using=true
	local Time=.025
	Tween(nec,{C0=necC0*cf(0,0,0)*angles(0,85,0,true)*angles(0,0,-40,true)*angles(5,0,0,true)},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Tween(rutj,{C1=rutjC1*(cf(0,0,.05)*angles(5,0,0,true)*angles(0,-85,0,true)):Inverse()},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Tween(rs,{C0=rsC0*cf(.1,-.2,-.2)*angles(90,0,0,true)*angles(0,0,-85,true)*angles(5,0,0,true)*angles(10,0,0,true)},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Tween(ls,{C0=lsC0*cf(.7,-.275,.1)*angles(90,0,0,true)*angles(0,0,-45,true)*angles(5,0,0,true)*angles(50,90,0,true)},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Tween(rh,{C1=rhC1*(cf(0,0,0)*angles(0,0,5,true)):Inverse()},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Tween(lh,{C1=lhC1*(cf(0,0,0)*angles(0,0,5,true)):Inverse()},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Tween(RW,{C0=cf(-.1,-ra.Size.Y/2,0)*angles(-10,0,0,true)},{Time,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out,0,false,0})
	Sound(1905343596,1.5,random(.9,1.1,100),Rifle.Tubes,150,7.5)
	Rifle.TubesGlow.Color=rgb(255,65,0)
	Tween(Rifle.TubesGlow,{Color=c3(0,0,0)},{1,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
	coroutine.wrap(function()
		wait(.1)
		Sound(2781583369,.5,random(5,6.5,100),Rifle.Tubes,65,5)
	end)()
	for i=1,random(3,7) do
		local Time=random(.15,.5,100)
		local Scale=random(.75,1.25,1000)
		local Spark=script.Data.Models.PhysicalSpark:Clone()
		Spark.CFrame=Rifle.Tubes.CFrame*cf(Rifle.Tubes.FireEffect.Position)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true)
		Spark.Attachment1.Position=Spark.Attachment1.Position*v3(1,Scale,1)
		Spark.Attachment2.Position=Spark.Attachment2.Position*v3(1,Scale,1)
		Spark.Parent=workspace
		ins("BodyVelocity",{MaxForce=v3(huge,huge,huge),Velocity=Rifle.Tubes.CFrame.RightVector*random(5,40),Parent=Spark})
		ins("BodyAngularVelocity",{MaxTorque=v3(huge,huge,huge),AngularVelocity=v3(random(-20,20),random(-20,20),random(-20,20)),Parent=Spark})
		Tween(Spark.Attachment1,{Position=Spark.Attachment1.Position*v3(1,0,1)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
		Tween(Spark.Attachment2,{Position=Spark.Attachment2.Position*v3(1,0,1)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
		Instance.Remove(Spark,Time*2.5)
	end
	for i,v in pairs(Rifle.Tubes:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			if v:FindFirstChild("Amount") then
				v:Emit(clamp(v.Amount.Value+random(-5,5),1,25))
			end
			if v.Name==v.ClassName then
				coroutine.wrap(function()
					v.Enabled=true
					wait(.225)
					v.Enabled=false
				end)()
			end
		end
	end
	CreateBullet()
	wait(.025)
	local Time=.2
	Tween(nec,{C0=necC0*cf(0,0,0)*angles(0,85,0,true)*angles(0,0,-40,true)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	Tween(rutj,{C1=rutjC1*(cf(0,0,0)*angles(0,-85,0,true)):Inverse()},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	Tween(rs,{C0=rsC0*cf(.1,-.2,-.2)*angles(90,0,0,true)*angles(0,0,-85,true)*angles(10,0,0,true)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	Tween(ls,{C0=lsC0*cf(.7,-.35,.1)*angles(90,0,0,true)*angles(0,0,-45,true)*angles(50,90,0,true)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	Tween(rh,{C1=rhC1*(cf(0,0,0)*angles(0,0,0,true)):Inverse()},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	Tween(lh,{C1=lhC1*(cf(0,0,0)*angles(0,0,0,true)):Inverse()},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	Tween(RW,{C0=cf(-.1,-ra.Size.Y/2,0)*angles(-10,0,0,true)},{Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
	wait(Time-.05)
	Using=false
end
Mouse = Player:GetMouse()
Mouse.Button1Down:connect(function()
	Holding=true
	Fire(true)
	Fire()
	Holding=false
end)

game:GetService("RunService").Heartbeat:Connect(function()
	Sine=Sine+Change
	if not Effects or not Effects.Parent then
		Instance.Remove(Effects)
		Effects=ins("Model",{Name="Effects",Parent=Char})
	end
	if not Theme or Theme.Parent~=t then
		Instance.Remove(Theme)
		Theme=Sound(243924503,not Muted and 1.5 or 0,1,t,250,15,true)
	end
	Theme:Resume()
	Theme.SoundId="rbxassetid://"..243924503
	Theme.Pitch=1
	Theme.Volume=not Muted and 1.5 or 0
	Theme.Looped=true
	Theme.MaxDistance=250
	Theme.EmitterSize=15
	TimePos=Theme.TimePosition
	local Direction=hum.MoveDirection
	if Direction.Magnitude==0 then Direction=hrp.Velocity/7.5 end
	local MoveZ=clamp((Direction*(t or lt).CFrame.LookVector).X+(Direction*(t or lt).CFrame.LookVector).Z,-1,1)
	local MoveX=clamp((Direction*(t or lt).CFrame.RightVector).X+(Direction*(t or lt).CFrame.RightVector).Z,-1,1)
	local Moving=(hrp.Velocity*v3(1,0,1)).Magnitude>.01
	local VerY=hrp.Velocity.Y
	local StandR,RPos,RNID=Raycast(hrp.CFrame*cf(hrp.Size.X/4,-hrp.Size.Y/2,0).Position,-hrp.CFrame.UpVector,{char},3,false)
	local StandL,LPos,LNID=Raycast(hrp.CFrame*cf(-hrp.Size.X/4,-hrp.Size.Y/2,0).Position,-hrp.CFrame.UpVector,{char},3,false)
	local Stand=StandR or StandL
	hum.WalkSpeed,hum.JumpPower=(LockWS and WS or hum.WalkSpeed),(LockJP and JP or hum.JumpPower)
	if not Moving and Stand then
		Change=1
		local IdleVal=20
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(sin(Sine/IdleVal)*2,CosSin(Sine/(IdleVal*3))*7.5,0,true)*cf(0,0,0)*angles(-2,0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,.05*cos(Sine/IdleVal),0)*angles(CosSin(Sine/(IdleVal*1.5))*2.5,cos(Sine/(IdleVal*2))*2.5,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,-.05*cos(Sine/IdleVal),0)*angles(sin(Sine/IdleVal)*-3,0,0,true)*cf(0,-.15,-.1)*angles(40,0,-60,true)*angles(-20,50,25,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,-.05*cos(Sine/IdleVal),0)*angles(sin(Sine/IdleVal)*-3,0,0,true)*cf(-.15,-.1,-.5)*angles(60,0,15,true)*angles(0,100,0,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,-.05*cos(Sine/IdleVal),0)*angles(CosSin(Sine/(IdleVal*1.5))*-3.65,0,0,true)*angles(cos(Sine/(IdleVal*2))*-2,0,0,true)*cf(0,0,0)*angles(0,-5,2.5,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,-.05*cos(Sine/IdleVal),0)*angles(CosSin(Sine/(IdleVal*1.5))*-3.65,0,0,true)*angles(cos(Sine/(IdleVal*2))*2,0,0,true)*cf(0,0,0)*angles(0,5,-2.5,true),.1)
		RW.C0=RW.C0:Lerp(cf(-.1,-ra.Size.Y/2,0)*angles(5,0,-10,true),.1)
	elseif Moving and Stand then
		local WSVal=6/clamp(hum.WalkSpeed/16,.25,2)*hrp.Size.Y/2
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(cos(Sine/(WSVal/2))*-5,CosSin(Sine/WSVal)*-10,0,true)*cf(0,0,0)*angles(2.5*MoveZ,-55*MoveX,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,.65*cos(Sine/(WSVal/2)),0)*angles(sin(Sine/(WSVal/2))*5,CosSin(Sine/WSVal)*10,0,true)*cf(0,0,0)*angles(-5*MoveZ,0,-5*MoveX,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,.2*sin(Sine/(WSVal/2)),0)*angles(CosSin(Sine/(WSVal/2))*5,0,0,true)*cf(0,-.15,-.1)*angles(40,0,-60,true)*angles(-20,50,25,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,.2*sin(Sine/(WSVal/2)),0)*angles(CosSin(Sine/(WSVal/2))*5,0,0,true)*cf(-.15,-.1,-.5)*angles(60,0,15,true)*angles(0,100,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,-.5*cos(Sine/WSVal),-.15+.6*cos(Sine/WSVal))*angles(-(10*abs(MoveZ))+CosSin(Sine/WSVal)*-140*MoveZ,0,CosSin(Sine/WSVal)*-100*MoveX,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,.5*cos(Sine/WSVal),-.15-.6*cos(Sine/WSVal))*angles(-(10*abs(MoveZ))+CosSin(Sine/WSVal)*140*MoveZ,0,CosSin(Sine/WSVal)*100*MoveX,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		RW.C0=RW.C0:Lerp(cf(-.1,-ra.Size.Y/2,0)*angles(5,0,-15,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		--thanks to kyu or neb.. whatever
		if cos(Sine/WSVal)/2>.2 and Step=="L" then
			Step="R"
			if StandR then
				local SoundId=StepSounds[StandR.Material.Name] or 0
				if StandR.Material=="Sand" and (StandR.Color.r>.7 and StandR.Color.g>.7 and StandR.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				local SizeVal=StandR.Size*RNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		if cos(Sine/WSVal)/2<-.2 and Step=="R" then
			Step="L"
			if StandL then
				local SoundId=StepSounds[StandL.Material.Name] or 0
				if StandL.Material==Enum.Material.Sand and (StandL.Color.r>.7 and StandL.Color.g>.7 and StandL.Color.b>.7) then
					SoundId=StepSounds["Snow"]
				end
				local SizeVal=StandL.Size*LNID
				if SoundId==941640049 then
					SizeVal=SizeVal/2
				end
				Sound(SoundId,(.35*clamp((WSVal)/1.5,.5,3.5))/clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z),.5,1.25),random(.9,1.1,100)*clamp(math.max(SizeVal.X,SizeVal.Y,SizeVal.Z)/10,.5,1.2)*clamp((WSVal)/1.5,.5,2),t)
			end
		end
		--[[
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)
		
		-																									-
		
		Joints.Neck.C0=Joints.Neck.C0:Lerp(Joints.Neck.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Root.C0=Joints.Root.C0:Lerp(Joints.Root.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.Waist.C0=Joints.Waist.C0:Lerp(Joints.Waist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightShoulder.C0=Joints.RightShoulder.C0:Lerp(Joints.RightShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightElbow.C0=Joints.RightElbow.C0:Lerp(Joints.RightElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightWrist.C0=Joints.RightWrist.C0:Lerp(Joints.RightWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftShoulder.C0=Joints.LeftShoulder.C0:Lerp(Joints.LeftShoulder.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftElbow.C0=Joints.LeftElbow.C0:Lerp(Joints.LeftElbow.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftWrist.C0=Joints.LeftWrist.C0:Lerp(Joints.LeftWrist.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightHip.C0=Joints.RightHip.C0:Lerp(Joints.RightHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightKnee.C0=Joints.RightKnee.C0:Lerp(Joints.RightKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.RightAnkle.C0=Joints.RightAnkle.C0:Lerp(Joints.RightAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftHip.C0=Joints.LeftHip.C0:Lerp(Joints.LeftHip.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftKnee.C0=Joints.LeftKnee.C0:Lerp(Joints.LeftKnee.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		Joints.LeftAnkle.C0=Joints.LeftAnkle.C0:Lerp(Joints.LeftAnkle.Link.C0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(0,0,0,true),.1)
		--]]
	elseif not Stand then
		Change=1
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-15,15),0,0,true),.1)
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-30,20),0,0,true),.1)
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,-.15,-.1)*angles(40,0,-60,true)*angles(-20,50,25,true),.1)
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,0,0,true)*cf(-.15,-.1,-.5)*angles(60,0,15,true)*angles(0,100,0,true),.1)
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,.4,-.35)*angles(-10,-5,5,true),.1)
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(clamp(-hrp.Velocity.Y,-25,35),0,0,true)*cf(0,.2,-.15)*angles(-2.5,5,-5,true),.1)
		RW.C0=RW.C0:Lerp(cf(-.1,-ra.Size.Y/2,0)*angles(5,0,-10,true),.1)
	end
	if Type=="R6" then
		if not Using then
			nec.C1=nec.C1:Lerp(necC1,.2)
			rutj.C1=rutj.C1:Lerp(rutjC1,.2)
			rs.C1=rs.C1:Lerp(rsC1,.2)
			ls.C1=ls.C1:Lerp(lsC1,.2)
			rh.C1=rh.C1:Lerp(rhC1,.2)
			lh.C1=lh.C1:Lerp(lhC1,.2)
		end
		necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
		rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
		rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
		lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
		rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
		lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	end
end)
wait(0.3)

loadstring(game:HttpGet('https://git.azula.wtf/CatThatDrinksSprite/moon-convert/-/raw/main/Scripts/Other/AlignCharacter.lua', true))() -- FUCK THIS GUY LOL
loadstring(game:HttpGet("https://raw.githubusercontent.com/maddudelol/stupidassscriptswhatthefuckamidoing/refs/heads/main/networkshit"))() -- Good library btw
local asdf = workspace.DuskySpoon
local Bullett = asdf.RockAccessory.Handle

Bullett.AccessoryWeld:Destroy()
Bullett.CanCollide = false


local Torso = asdf:FindFirstChild("Torso")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

local FakeCollider = Instance.new("Part")
FakeCollider.Size = Vector3.new(1,1,1)
FakeCollider.Transparency = 1
FakeCollider.Anchored = false
FakeCollider.CanCollide = false
FakeCollider.CFrame = Bullett.CFrame
FakeCollider.Parent = workspace

AlignCharacter(Bullett, FakeCollider, Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))

local TorsoWeld = Instance.new("Weld")
TorsoWeld.Part0 = Torso
TorsoWeld.Part1 = FakeCollider
TorsoWeld.Parent = FakeCollider

local bambam = Instance.new("BodyThrust")
bambam.Parent = Bullett
bambam.Location = Vector3.new(0,0,0)
bambam.Force = Vector3.new(0,0,0)

local TweenService = game:GetService("TweenService")
local going = false

Mouse.Button1Down:Connect(function()
    if going then return end
    going = true
    TorsoWeld.Part1 = nil
    local targetPos = Mouse.Hit.Position
    local tween = TweenService:Create(FakeCollider, TweenInfo.new(0.05), {CFrame = CFrame.new(targetPos)})
    tween:Play()
    tween.Completed:Wait()
    local tweenBack = TweenService:Create(FakeCollider, TweenInfo.new(0.07), {CFrame = Torso.CFrame * CFrame.new(0, 5, 0)})
    tweenBack:Play()
    tweenBack.Completed:Wait()
    TorsoWeld.Part1 = FakeCollider
    going = false
end)

game:GetService("RunService").Heartbeat:Connect(function()
    bambam.Force = Bullett.AssemblyLinearVelocity * 25.1 -- idk velocity shit ig loloolol
end)

local eee = workspace.DuskySpoon
if eee:FindFirstChild("Accessory (Slug Rifle Black)") then
	eee["Accessory (Slug Rifle Black)"].Handle.AccessoryWeld:Destroy()
	AlignCharacter(eee["Accessory (Slug Rifle Black)"].Handle, eee.Torso.Rifle.Dark, Vector3.new(0, 0.3, 0), Vector3.new(-80, 90, 180))
	for i, v in pairs(eee.Torso.Rifle:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
end
