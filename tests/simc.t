--[[
	Load each SimulationCraft profile and do the following things:

	1. Unparse the profile to verify the action list is being properly parsed.
	2. Emit the corresponding Ovale script to standard output.
--]]

-- Constants.
local profilesDirectory = "../simulationcraft"
local root = "../"
local separator = string.rep("-", 80)

local SIMC_CLASS = {
	deathknight = true,
	druid = true,
	hunter = true,
	mage = true,
	monk = true,
	paladin = true,
	priest = true,
	rogue = true,
	shaman = true,
	warlock = true,
	warrior = true,
}

local gmatch = string.gmatch
local gsub = string.gsub
local ipairs = ipairs
local strfind = string.find
local strlen = string.len
local strsub = string.sub
local strupper = string.upper
local tinsert = table.insert
local tsort = table.sort

-- Save original input and output handles.
local saveInput = io.input()
local saveOutput = io.output()

-- Get the profile names from the profiles directory.
local files = {}
do
	local dir = io.popen("dir /b " .. gsub(profilesDirectory, "/", "\\"))
	for name in dir:lines() do
		tinsert(files, name)
	end
	dir:close()
	tsort(files)
end

for _, name in ipairs(files) do
	local inputName =  profilesDirectory .. "/" .. name
	io.input(inputName)
	local simc = io.read("*all")
	-- Valid profiles never set "optimal_raid".
	if not strfind(simc, "optimal_raid=") then
		-- Find the class and specialization from the profile.
		local class, specialization
		for line in gmatch(simc, "[^\r\n]+") do
			if not class then
				for simcClass in pairs(SIMC_CLASS) do
					local length = strlen(simcClass)
					if strsub(line, 1, length + 1) == simcClass .. "=" then
						class = strupper(simcClass)
					end
				end
			end
			if not specialization then
				if strsub(line, 1, 5) == "spec=" then
					specialication = strsub(line, 6)
				end
			end
			if class and specialization then
				break
			end
		end
		-- Create WoWMock sandbox.
		dofile(root .. "WoWMock.lua")
		local config = {
			class = class,
			specialization = specialization,
		}
		local sandbox = WoWMock:NewSandbox(config)

		-- Load addon files into the sandbox.
		sandbox:LoadAddonFile("Ovale.toc", root)

		-- Fire events to simulate the addon-loading process.
		sandbox:Fire("ADDON_LOADED")
		sandbox:Fire("SPELLS_CHANGED")
		sandbox:Fire("PLAYER_LOGIN")
		sandbox:Fire("PLAYER_ENTERING_WORLD")

		-- Enter sandbox.
		setfenv(1, sandbox)

		local OvaleSimulationCraft = Ovale.OvaleSimulationCraft

		-- Parse SimulationCraft profile and emit the corresponding Ovale script.
		local profile = OvaleSimulationCraft:ParseProfile(simc)
		if profile then
			print(separator)
			print(">>>", name)
			print(OvaleSimulationCraft:Unparse(profile))
			print(separator)
			print(OvaleSimulationCraft:Emit(profile))
		end
	end
end

-- Restore original input and output handles.
io.input(saveInput)
io.output(saveOutput)
