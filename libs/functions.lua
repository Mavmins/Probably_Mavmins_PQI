if not mavmins then mavmins = {} end

if initTargets ~= true then
	TARGET_MODE = "ONE"
	initTargets = true
	print("-------MAVMINS ENHANCEMENT V2.0 - PQI Edition-------")	
	print("----------INIT SINGLE TARGET - DISABLE CDS----------")	
	
	if ProbablyEngine.dsl.get('toggle')('cooldowns') then 
		ProbablyEngine.buttons.toggle('cooldowns')
	end
	
	if ProbablyEngine.dsl.get('toggle')('multitarget') then 
		ProbablyEngine.buttons.toggle('multitarget')
	end
end

if initSpecialInterrupts == nil then
	local RaidInterrupts = {
	
		--5.4..............SIEGE OF ORGRIMMAR..................
		--Protectors of the Endless
		144018, -- Corruption Shock, Gloom
		--Sha of Pride
		144379, --Mocking Blast, Manifestation of Pride
		--Galakras
		146728, --Chain Heal, Dragonmaw Tidal Shaman
		--General Nazgrim
		143431, --Magistrike, Kor'kron Arcweaver
		143432, --Arcane Shock, Kor'kron Arcweaver
		143473, --Empowered Chain Heal, Kor'kron Warshaman
		--Spoils of Pandaria
		145230, --Forbidden Magic, Mogu Shadow Ritualist
		145218, --Harden Flesh, Animated Stone Mogu
		144923, --Earthen Shard, Animated Stone Mogu
		--Garrosh Hellscream
		144583, --Ancestral Chain Heal, Farseer Wolf Rider
		145071, --Touch of Y'Shaarj, Mind Controlled Players
		149347, --Embodied Doubt, Embodied Doubt - HEROIC
		145275, --Embodied Doubt, Embodied Doubt - NORMAL
		
	}
	initSpecialInterrupts = true
end

if macros == nil then
	--Macros
	 macros = { 
		["SingleTarget"]   		= 1, 
	    ["UseCds"]			= false, 
	   	["AoE"]   			= 1,
	} 
 end
--if not _singletarget then _singletarget = true end

------------------
--Slash Commands --
------------------
if SlashMacros == nil then
	SlashMacros = true
	
	SLASH_USECDS1 = "/usecds"
	function SlashCmdList.USECDS(msg, editbox)
		if macros["UseCds"] == false then
			macros["UseCds"] = true
			xrn:message("...COOLDOWNS |cFF00FF00ACTIVATED...")
			ProbablyEngine.buttons.toggle('cooldowns')	
			if TARGET_MODE == "ONE" then
				PQR_Text("SINGLE TARGET - USING CDS", nil, "00FFFF")
			elseif TARGET_MODE == "TWO" then
				PQR_Text("TWO TARGETS - USING CDS", nil, "00FFFF")
			elseif TARGET_MODE == "THREE" then
				PQR_Text("THREE TARGETS - USING CDS", nil, "00FFFF")
			elseif TARGET_MODE == "SIX" then
				PQR_Text("FULL AOE - USING CDS", nil, "00FFFF")
			end	
		else
			xrn:message("...COOLDOWNS |cFFFF0000DEACTIVATED...")
			ProbablyEngine.buttons.toggle('cooldowns')
			macros["UseCds"] = false
			if TARGET_MODE == "ONE" then
				PQR_Text("SINGLE TARGET - NOT USING CDS", nil, "00FFFF")
			elseif TARGET_MODE == "TWO" then
				PQR_Text("TWO TARGETS - NOT USING CDS", nil, "00FFFF")
			elseif TARGET_MODE == "THREE" then
				PQR_Text("THREE TARGETS - NOT USING CDS", nil, "00FFFF")
			elseif TARGET_MODE == "SIX" then
				PQR_Text("FULL AOE - NOT USING CDS", nil, "00FFFF")
			end	
		end
	end
	
	SLASH_INCREASETARGET1 = "/increasetarget"
	function SlashCmdList.INCREASETARGET(msg, editbox)
		if TARGET_MODE == "ONE" then
			TARGET_MODE = "TWO"
			xrn:message("...TWO TARGETS...")
			ProbablyEngine.buttons.toggle('multitarget')
			if macros["UseCds"] == true then
				PQR_Text("TWO TARGETS - USING CDS", nil, "00FFFF")
			elseif macros["UseCds"] == false then
				PQR_Text("TWO TARGETS - NOT USING CDS", nil, "00FFFF")
			end
		elseif TARGET_MODE == "TWO" then
			TARGET_MODE = "THREE"
			xrn:message("...THREE TARGETS...")
			if macros["UseCds"] == true then
				PQR_Text("THREE TARGETS - USING CDS", nil, "00FFFF")
			elseif macros["UseCds"] == false then
				PQR_Text("THREE TARGETS - NOT USING CDS", nil, "00FFFF")
			end 
		elseif TARGET_MODE == "THREE" then
			TARGET_MODE = "SIX"
			xrn:message("...AOE MODE...")
			if macros["UseCds"] == true then
				PQR_Text("FULL AOE - USING CDS", nil, "00FFFF")
			elseif macros["UseCds"] == false then
				PQR_Text("FULL AOE - NOT USING CDS", nil, "00FFFF")
			end
		end
	end
	
	SLASH_DECREASETARGET1 = "/decreasetarget"
	function SlashCmdList.DECREASETARGET(msg, editbox)
		if TARGET_MODE == "SIX" then
			TARGET_MODE = "THREE"
			xrn:message("...THREE TARGETS...")
			if macros["UseCds"] == true then
				PQR_Text("THREE TARGETS - USING CDS", nil, "00FFFF")
			elseif macros["UseCds"] == false then
				PQR_Text("THREE TARGETS - NOT USING CDS", nil, "00FFFF")
			end	
		elseif TARGET_MODE == "THREE" then
			TARGET_MODE = "TWO"
			xrn:message("...TWO TARGETS...")
			if macros["UseCds"] == true then
				PQR_Text("TWO TARGETS - USING CDS", nil, "00FFFF")
			elseif macros["UseCds"] == false then
				PQR_Text("TWO TARGETS - NOT USING CDS", nil, "00FFFF")
			end	
		elseif TARGET_MODE == "TWO" then
			TARGET_MODE = "ONE"
			xrn:message("...SINGLE TARGET...")
			ProbablyEngine.buttons.toggle('multitarget')
			if macros["UseCds"] == true then
				PQR_Text("SINGLE TARGET - USING CDS", nil, "00FFFF")
			elseif macros["UseCds"] == false then
				PQR_Text("SINGLE TARGET - NOT USING CDS", nil, "00FFFF")
			end	
		end
	end
	
end

function mavmins.TIER16_2PC_CHECK()

	local T_16 = 0

	local EnhanceT16 = {
	  99341, -- Head Heroic
	  99343, -- Shoulders Heroic
	  99347, -- Chest Heroic
	  99340, -- Gloves Heroic
	  99342, -- Legs Heroic
	 }
  
	for i=1, 19 do
		if GetInventoryItemID("player", i) ~= nil then
			for j=1, 5 do
				if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(EnhanceT16[j]) then
					T_16 = T_16 + 1
				end
			end
		end
	end	
	
	if T_16 >= 2 then
		return true 
	end	
	
end

function mavmins.TIER16_4PC_CHECK()

	local T_16 = 0
	
	local EnhanceT16 = {
	  99341, -- Head Heroic
	  99343, -- Shoulders Heroic
	  99347, -- Chest Heroic
	  99340, -- Gloves Heroic
	  99342, -- Legs Heroic
	 }
  
	for i=1, 19 do
		if GetInventoryItemID("player", i) ~= nil then
			for j=1, 5 do
				if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(EnhanceT16[j]) then
					T_16 = T_16 + 1
				end
			end
		end
	end	
	
	if T_16 == 4 then
		return true 
	end	
	
end

function mavmins.TIER15_2PC_CHECK()

	local T_15 = 0
	
	local EnhanceT15 = {
	  96691, -- Head Heroic
	  96693, -- Shoulders Heroic
	  96689, -- Chest Heroic
	  96690, -- Gloves Heroic
	  96692, -- Legs Heroic
	 }
	
	for i=1, 19 do
		if GetInventoryItemID("player", i) ~= nil then
			for j=1, 5 do
				if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(EnhanceT15[j]) then
					T_15 = T_15 + 1
				end
			end
		end
	end	
	
	if T_15 >= 2 then
		return true
	end
end

function mavmins.TIER15_4PC_CHECK()

	local T_15 = 0
	
	local EnhanceT15 = {
	  96691, -- Head Heroic
	  96693, -- Shoulders Heroic
	  96689, -- Chest Heroic
	  96690, -- Gloves Heroic
	  96692, -- Legs Heroic
	 }
	
	for i=1, 19 do
		if GetInventoryItemID("player", i) ~= nil then
			for j=1, 5 do
				if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(EnhanceT15[j]) then
					T_15 = T_15 + 1
				end
			end
		end
	end	
	
	if T_15 == 4 then
		return true
	end
end

function mavmins.heroism()
 
	local HeroismSpells = {
		32182, --Heroism
		2825, --Bloodlust
		90355, --Ancient Hysteria
		80353, --Timewarp
		120351, --Drums of war
	}
 
	for i=1, 40 do
		if select(11, UnitBuff("player", i)) ~= nil then
			for y = 1, 5 do
				if select(11, UnitBuff("player", i)) == HeroismSpells[y] then
					return true
				end
			end
		end
	end
	
end


if not (totemX and totemY) then
	totemX,totemY = 0,0
end

function totemDistance()
		local totemName = select(2,GetTotemInfo(1)) or select(2,GetTotemInfo(2))
		local fire = GetSpellInfo(2894)
		local earth = GetSpellInfo(2062)

		if totemX ~= (0 or nil) and totemY ~= (0 or nil) and totemName ~= (fire or earth) then
			local a,b,c,d,e,f,g,h,i,j = GetAreaMapInfo(GetCurrentMapAreaID())
			local a1 , b1 = GetPlayerMapPosition("Player")
			local x1 , y1 = a1 * 1000, b1 * 1000
			local a2 , b2 = totemX, totemY
			local x2 , y2 = a2 * 1000, b2 * 1000
			local w = (d - e)
			local h = (f - g)
			local distance = sqrt(min(x1 - x2, w - (x1 - x2))^2 + min(y1 - y2, h - (y1-y2))^2)
			
			return distance
		else
			return 0
		end
end

function mavmins.SearingTotem()
	local TOT1, FIRTOTNAME, FIRstartTime, FIRduration = GetTotemInfo(1)
	distance = totemDistance()
	
	if TARGET_MODE == "SIX" then return false end
	
	if FIRTOTNAME ~= tostring(GetSpellInfo(2894)) then
		if TOT1 == false or distance > 25 or FIRTOTNAME ~= tostring(GetSpellInfo(3599)) then
			totemX,totemY = GetPlayerMapPosition("Player")
			return true
		end
	end
end

function mavmins.magmaTotem()
	local TOT1, FIRTOTNAME, FIRstartTime, FIRduration = GetTotemInfo(1) --fire totem

	distance = totemDistance()

	if TARGET_MODE == "SIX" then
		if FIRTOTNAME ~= tostring(GetSpellInfo(2894)) then
			if TOT1 == false or FIRTOTNAME ~= tostring(GetSpellInfo(8190)) or distance > 8 then
				totemX,totemY = GetPlayerMapPosition("Player") 
				return true
			end
		end
	end
end

function mavmins.fireElemental()
	local TOT1, TOTNAME, startTime, duration = GetTotemInfo(1)
	if TOTNAME ~= tostring(GetSpellInfo(2894)) then
		return true
	end
end

function mavmins.oneTarget()
	if TARGET_MODE == "ONE" then
		return true
	else
		return false
	end
end

function mavmins.twoTarget()
	if TARGET_MODE == "TWO" then
		return true
	end
end

function mavmins.threeTarget()
	if TARGET_MODE == "THREE" then
		return true
	end
end

function mavmins.sixTarget()
	if TARGET_MODE == "SIX" then
		return true
	end
end

function mavmins.Gloves()
	if IsPlayerSpell(110403) == true then
		if GetInventoryItemCooldown("player",10) == 0 then
			UseInventoryItem(10)
			return true
		end
	end
end

function mavmins.interruptAll()

	if PQI_MavminsENHANCEMENTFUNCTIONS_InterruptAll_enable == true then

		local castName,_,_,_, castStartTime, castEndTime, _, _, castInterruptable = UnitCastingInfo("target") 

				if select(9, UnitCastingInfo("target")) == false then
				
					local timeSinceStart = (GetTime() * 1000 - castStartTime) / 1000
					local timeLeft = ((GetTime() * 1000 - castEndTime) * -1) / 1000
					local castTime = castEndTime - castStartTime
					local currentPercent = timeSinceStart / castTime * 100000
				
					if currentPercent >= 40 then
						return true
					end 
					
				elseif UnitChannelInfo("target") ~= nil then
				
					if select(8, UnitChannelInfo("target")) == false then
						return true
					end
				end
				
	end
	
end

function mavmins.InterruptSpecials()

	if PQI_MavminsENHANCEMENTFUNCTIONS_InterruptSpecialsOnly_enable == true and UnitCastingInfo("target") ~= nil then
	
		for j=1, #RaidInterrupts do
			--if GetSpellID(UnitCastingInfo('target')) == RaidInterrupts[j] then
			if UnitCastingInfo('target') == GetSpellInfo(RaidInterrupts[j]) then
				return true
			end
		end
	
	end
	
end

function mavmins.virmenPotion()
	if GetItemCount(76089,false,false) > 0 and select(3,GetItemCooldown(76089)) == 1 then 
		return true
	end
end

function mavmins.Gloves()
	if IsPlayerSpell(110403) == true then
		if GetInventoryItemCooldown("player",10) == 0 then
			return true
		end
	end
end

function mavmins.PQIConfing()
	PQI_Starter()
	return false
end

function mavmins.HealingSurge()
	if PQI_MavminsENHANCEMENTFUNCTIONS_HealingSurge_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_HealingSurge_value then
			return true
		end
	end
end

function mavmins.HealingStreamTotem()
	if PQI_MavminsENHANCEMENTFUNCTIONS_HealingStreamTotem_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_HealingStreamTotem_value then
			return true
		end
	end
end

function mavmins.HealingTideTotem()
	if PQI_MavminsENHANCEMENTFUNCTIONS_HealingTideTotem_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_HealingTideTotem_value then
			return true
		end
	end
end

function mavmins.Healthstone()
	if PQI_MavminsENHANCEMENTFUNCTIONS_Healthstone_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_Healthstone_value then
			return true
		end
	end
end

function mavmins.StoneBulwarkTotem()
	if PQI_MavminsENHANCEMENTFUNCTIONS_StoneBulwarkTotem_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_StoneBulwarkTotem_value then
			return true
		end
	end
end

function mavmins.AstralShift()
	if PQI_MavminsENHANCEMENTFUNCTIONS_AstralShift_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_AstralShift_value then
			return true
		end
	end
end

function mavmins.ShamanisticRage()
	if PQI_MavminsENHANCEMENTFUNCTIONS_ShamanisticRage_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_ShamanisticRage_value then
			return true
		end
	end
end

function mavmins.GiftOfTheNaaru()
	if PQI_MavminsENHANCEMENTFUNCTIONS_GiftOfTheNaaruu_enable == true then
		local PLAYERHP = 100 * UnitHealth("player") / UnitHealthMax("player")
		if PLAYERHP <= PQI_MavminsENHANCEMENTFUNCTIONS_GiftOfTheNaaruu_value then
			return true
		end
	end
end

function mavmins.CleanseSpirit()
	if PQI_MavminsENHANCEMENTFUNCTIONS_CleanseSpirit_enable == true then
		for y=1, 40 do
			if UnitDebuff("player",y)	
				and select(5, UnitDebuff("player", y)) == "Curse" then
				return true
			end
		end
	end
end

function mavmins.PurgeTarget()
	if PQI_MavminsENHANCEMENTFUNCTIONS_AutoPurge_enable == true then

		for i = 1, 40 do
			if select(9, UnitBuff("target", i)) == 1 then
				return true
			end
		end

	end
end

-- Register library
ProbablyEngine.library.register("mavmins", mavmins)
