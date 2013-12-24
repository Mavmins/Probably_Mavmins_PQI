-- Queues
--if _Queues == nil then
	-- Warrior
--	if _MyClass == 1 then
--		_Queues = {
--			[_Disarm] 				= false,
--			[_IntimidatingShout] 	= false,
--			[_ShatteringThrow] 		= false,
--			[_Execute] 				= false,
--		}
--	end
	-- Paladin
--	if _MyClass == 2 then
--		_Queues = {	
--			[_AvengersShield] 		= false,
--			[_BlindingLight]  		= false,
--			[_DivineShield] 		= false,
--			[_ExecutionSentence]	= false,
--			[_FistOfJustice]		= false,
			-- [_HammerOfJustice] 		= false,
			-- [_LightsHammer] 		= false,
			-- [_TurnEvil]				= false,
		-- }
	-- end
--	Hunter
	-- if _MyClass == 3 then
		-- _Queues = {	
			-- [_CallPet1] 			= false,
			-- [_CallPet2] 			= false,
			-- [_CallPet3] 			= false,
			-- [_CallPet4] 			= false,
			-- [_CallPet5] 			= false,
			-- [_ConcussiveShot] 		= false,
			-- [_DismissPet] 			= false,
			-- [_Stampede] 			= false,
			-- [_DistractingShot] 		= false,
			-- [_ScatterShot] 			= false,
			-- [_TrapLauncherExplosive]= false,
			-- [_TrapLauncherFreezing] = false,
			-- [_TrapLauncherIce] 		= false,
			-- [_TrapLauncherSnakes] 	= false,
			-- [_WidowVenom] 			= false,
		-- }
	-- end
--	Rogue
	-- if _MyClass == 4 then
		-- _Queues = {	
			-- [_SmokeBomb] 			= false,
		-- }
	-- end
-- end 

-- ProbablyEngine.listener.register("UNIT_SPELLCAST_SUCCEEDED", function(...)
	-- local SourceUnit 	= select(1,...)
	-- local SpellID 		= select(5,...)
	-- if SourceUnit == "player" then
	--	All Spec Queues!
		-- if _Queues[select(5,...)] ~= nil then
			-- if _Queues[select(5,...)] == true then 
				-- _Queues[select(5,...)] = false 
			-- end
		-- end

	--	Paladin
		-- if _MyClass == 2 then
			-- if macros["HoFreeQueue"] ~= false and SpellID == _HandOfFreedom then macros["HoFreeQueue"] = false end
			-- if macros["HoProtQueue"] ~= false and SpellID == _HandOfProtection then macros["HoProtQueue"] = false end
			-- if macros["HoPurQueue"] ~= false and SpellID == _HandOfPurity then macros["HoPurQueue"] = false end
			-- if macros["HoSacQueue"] ~= false and SpellID == _HandOfSacrifice then macros["HoSacQueue"] = false end
			-- if macros["HoSalvQueue"] ~= false and SpellID == _HandOfSalvation then macros["HoSalvQueue"] = false end
		-- end
		--Hunter
		-- if _MyClass == 3 then
		--	Feign Death Enforcer
		 	-- if SpellID == _FeignDeath then			
				-- FeignDeathCast = GetTime()
				-- StopAttack()
				-- SpellStopCasting()	
			-- end
		--	Steady Shot Logic
			-- if SpellID == _SteadyShot then
				-- if SteadyCast and SteadyCast >= GetTime() - 2 and SteadyCount == 1 then SteadyCast = GetTime() SteadyCount = 2 else	SteadyCast = GetTime() SteadyCount = 1 end
			-- end		
		-- end
		--Rogue
		-- if _MyClass == 4 then
			-- if SpellID == _Vanish or SpellID == _Shadowmeld or SpellID == _ShadowDance then 
				-- if UnitExists("target") ~= nil then RunMacroText("/startattack") NoVanish = GetTime() + 1 end 
			-- end
		-- end
		-- if CML_Debug and not (CML_LastSpell == select(2,...) and (CML_LastTime and (GetTime() - CML_LastTime  < 1))) then
			-- CML_LastSpell 	= select(2,...) 
			-- CML_LastTime 	= GetTime()
			-- print("|cff0059FFCasted: |cffFFFFFF"..CML_LastSpell.." |cff0059FF"..CML_LastTime)
		-- end
	-- end
-- end)

-- ProbablyEngine.listener.register("UNIT_SPELLCAST_FAILED", function(...)
	-- local SourceUnit 	= select(1,...)
	-- if SourceUnit == "player" then
		--All Spec Queues!
		-- if _Queues[select(5,...)] ~= nil then
			-- if _Queues[select(5,...)] == false and CML.GetSpellCD(select(5,...)) <= 3 then 
				-- _Queues[select(5,...)] = true 
			-- end
		-- end
	-- end
-- end)

ProbablyEngine.module.player.los = {}

ProbablyEngine.listener.register("UI_ERROR_MESSAGE", function(...)
	
  local Event = ...
  if Event == SPELL_FAILED_NOT_BEHIND then
    ProbablyEngine.module.player.behind = false
    ProbablyEngine.module.player.behindTime = GetTime()
  elseif Event == SPELL_FAILED_UNIT_NOT_INFRONT or ERR_BADATTACKFACING then
    ProbablyEngine.module.player.infront = false
    ProbablyEngine.module.player.infrontTime = GetTime()
  elseif Event == SPELL_FAILED_LINE_OF_SIGHT then
    ProbablyEngine.module.player.los = false
    ProbablyEngine.module.player.losTime = GetTime()
  end
end)

-----------------------------------------------------------------------------------------------------
--------------------------------------------PQR Imports----------------------------------------------
-- These functions come from PQR 2.2. Thanks to Xelper. Thanks also to Crystal_Tech for disasambling it!
function UnitBuffID(unit, spellID, filter)
	local spellName = GetSpellInfo(spellID)
	if filter == nil then
		return UnitBuff(unit, spellName)
	else
		local exactSearch = strfind(strupper(filter), "EXACT")
		local playerSearch = strfind(strupper(filter), "PLAYER")
		if exactSearch then
			--using the index does not support filter.
			for i=1,40 do
				local _, _, _, _, _, _, _, buffCaster, _, _, buffSpellID = UnitBuff(unit, i)
				if buffSpellID ~= nil then
					if buffSpellID == spellID then
						if (not playerSearch) or (playerSearch and (buffCaster == "player")) then
							return UnitBuff(unit, i)
						end
					end
				else
					return nil
				end
			end
		else
			--just pass the filter to UnitBuff and return.
			return UnitBuff(unit, spellName, nil, filter)
		end
	end
end

function UnitDebuffID(unit, spellID, filter)
	local spellName = GetSpellInfo(spellID)
	if filter == nil then
		return UnitDebuff(unit, spellName)
	else
		local exactSearch = strfind(strupper(filter), "EXACT")
		local playerSearch = strfind(strupper(filter), "PLAYER")

		if exactSearch then
			--using the index does not support filter.
			for i=1,40 do
				local _, _, _, _, _, _, _, buffCaster, _, _, buffSpellID = UnitDebuff(unit, i)
				if buffSpellID ~= nil then
					if buffSpellID == spellID then
						if (not playerSearch) or (playerSearch and (buffCaster == "player")) then
							return UnitDebuff(unit, i)
						end
					end
				else
					return nil
				end
			end
		else
			--just pass the filter to UnitDebuff and return.
			return UnitDebuff(unit, spellName, nil, filter)
		end
	end
end

function _IsChanneling()
	local _, _, _, _, _, playerChanneling = UnitChannelInfo("player")
	local isPlayerChanneling = false

	if playerChanneling ~= nil then
		local currentTime = GetTime() * 1000
		if (playerChanneling - currentTime) > 100 then
			isPlayerChanneling = true
		end
	end

	return isPlayerChanneling
end

function CML_IsCastingSpell(spellID)
	local spellName = GetSpellInfo(spellID)
	local spellCasting = UnitCastingInfo("player")

	if spellCasting == nil then
		spellCasting = UnitChannelInfo("player")
	end
	if spellCasting == spellName then
		return true
	else
		return false
	end
end

function _GetSpellID(spellName, target)
	local spellID = 0;
	local i = 1
	if target == nil then
		target = "player"
	end
	while true do
		local sbSpellName, sbSpellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
		if sbSpellName == nil then
			break
		end
		if sbSpellSubName == nil then
			sbSpellSubName = ""
		end
		if spellName == sbSpellName or spellName == sbSpellName..sbSpellSubName or spellName == sbSpellName.." "..sbSpellSubName then
			_, spellID = GetSpellBookItemInfo(i, target)
			break
		end

		i = i + 1
	end
	return spellID
end

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- Nova Notification Frame Thanks to Nova Team for this code!
function Nova_NotifyFrame_OnUpdate()
	if (Nova_NotifyFrameTime < GetTime() - 0.2) then
		local alpha = Nova_NotifyFrame:GetAlpha()
		if (alpha ~= 0) then Nova_NotifyFrame:SetAlpha(alpha - .5) end
		if (aplha == 0) then Nova_NotifyFrame:Hide() end
	end
end
-- Debug messages.
function Nova_Notify(message)
	Nova_NotifyFrame.text:SetText(message)
	Nova_NotifyFrame:SetAlpha(1)
	Nova_NotifyFrame:Show()
	Nova_NotifyFrameTime = GetTime()
end
-- Debug Notification Frame
Nova_NotifyFrame = CreateFrame('Frame')
Nova_NotifyFrame:ClearAllPoints()
Nova_NotifyFrame:SetHeight(300)
Nova_NotifyFrame:SetWidth(300)
Nova_NotifyFrame:SetScript('OnUpdate', Nova_NotifyFrame_OnUpdate)
Nova_NotifyFrame:Hide()
Nova_NotifyFrame.text = Nova_NotifyFrame:CreateFontString(nil, 'BACKGROUND', 'PVPInfoTextFont')
Nova_NotifyFrame.text:SetAllPoints()
Nova_NotifyFrame:SetPoint('CENTER', 0, 0)
Nova_NotifyFrameTime = 0
-- Chat Overlay originally made by Sheuron
local function onUpdate(self,elapsed) 
  if self.time < GetTime() - 2.8 then
if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
  end
end
xrn = CreateFrame("Frame",nil,ChatFrame1) 
xrn:SetSize(ChatFrame1:GetWidth(),30)
xrn:Hide()
xrn:SetScript("OnUpdate",onUpdate)
xrn:SetPoint("TOP",0,0)
xrn.text = xrn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
xrn.text:SetAllPoints()
xrn.texture = xrn:CreateTexture()
xrn.texture:SetAllPoints()
xrn.texture:SetTexture(0,0,0,.50) 
xrn.time = 0
function xrn:message(message) 
  self.text:SetText(message)
  self:SetAlpha(1)
  self.time = GetTime() 
  self:Show() 
end	
xrn:message("\124cFFf58cba...CodeMyLife Paladin...")