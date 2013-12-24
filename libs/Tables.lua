-----------------------------------------------------------------------------------------------------
--------------------------------------------Spells & Tables------------------------------------------
-- Racials
_BloodFury					= 20572
_Berserking  				= 26297 
_GiftOfTheNaaru				= 59542

_MyClass = select(3,UnitClass("player"))
if _MyClass == 1 then
	-- Warrior Abilities
	_Avatar						= 107574
	_BattleShout				= 6673
	_BerserkerRage				= 18499
	_Bladestorm					= 46924
	_Bloodbath					= 12292
	_Bloodthirst				= 23881
	_Charge						= 100
	_Cleave						= 845
	_ColossusSmash				= 86346
	_CommandingShout			= 469
	_DemoralizingBanner			= 114203
	_DemoralizingShout			= 1160
	_Devastate					= 20243
	_DieByTheSword				= 118038
	_Disarm						= 676
	_DisruptingShout			= 102060
	_DragonRoar					= 118000
	_EnragedRegeneration		= 55694
	_Execute					= 5308
	_Hamstring					= 1715
	_HeroicLeap					= 6544
	_HeroicStrike				= 78
	_HeroicThrow				= 57755
	_ImpendingVictory			= 103840
	_Intervene					= 3411
	_IntimidatingShout			= 5246
	_LastStand					= 12975
	_MassSpellReflection		= 114028
	_MockingBanner				= 114192
	_MortalStrike 				= 12294
	_Overpower					= 7384
	_PiercingHowl				= 12323
	_Pummel						= 6552
	_RagingBlow					= 85288
	_RallyingCry				= 97462
	_Recklessness				= 1719
	_Revenge					= 6572
	_Safeguard					= 114029
	_ShatteringThrow			= 64382
	_ShieldBarrier				= 112048
	_ShieldBlock				= 2565
	_ShieldSlam					= 23922
	_ShieldWall					= 871
	_Shockwave					= 46968
	_SkullBanner				= 114207
	_Slam						= 1464
	_SpellReflection			= 23920
	_StaggeringShout			= 107566
	_StormBolt					= 107570
	_SweepingStrikes			= 12328
	_SwordandBoard				= 46953
	_Taunt						= 355
	_ThunderClap				= 6343
	_Ultimatum					= 122509
	_VictoryRush				= 34428
	_Vigilance					= 114030
	_Vrushed					= 32216
	_WeakBlows					= 115798
	_Whirlwind					= 1680
	_WildStrike					= 100130
elseif _MyClass == 2 then
	-- Paladin Abilities
	_ArdentDefender				= 31850
	_AvengersShield				= 31935
	_AvengingWrath				= 31884
	_BeaconOfLight				= 53563 
	_BlessingOfKings			= 20217
	_BlessingOfMight			= 19740
	_BlindingLight				= 115750
	_Cleanse					= 4987
	_Consecration				= 26573
	_CrusaderStrike				= 35395
	_Denounce					= 2812
	_DevotionAura				= 31821
	_DivineFavor				= 31842
	_DivineLight				= 82326
	_DivinePlea					= 54428
	_DivineProtection 			= 498
	_DivineShield				= 642
	_DivineStorm				= 53385
	_EternalFlame				= 114163
	_ExecutionSentence			= 114157
	_Exorcism					= 879
	_FistOfJustice				= 105593
	_FlashOfLight				= 19750
	_HandOfFreedom 				= 1044
	_HandOfProtection 			= 1022
	_HandOfPurity				= 114039
	_HandOfSacrifice	 		= 6940
	_HandOfSalvation	 		= 1038
	_HammerOfJustice			= 853
	_HammerOfTheRighteous		= 53595
	_HammerOfWrath				= 24275
	_HolyAvenger				= 105809
	_HolyLight					= 635
	_HolyPrism					= 114165
	_HolyRadiance				= 82327
	_HolyShock					= 20473
	_HolyWrath					= 119072
	_GuardianOfAncientKings		= 86659
	_GuardianOfAncientKingsHoly	= 86669
	_GuardianOfAncientKingsRet	= 86698
	_Inquisition				= 84963
	_Judgement					= 20271
	_LayOnHands					= 633
	_LightOfDawn				= 85222
	_LightsHammer				= 114158
	_MassExorcism				= 122032
	_MassResurection			= 83968
	_Reckoning					= 62124
	_Redemption					= 7328
	_RighteousFury 				= 25780			
	_Repentance					= 20066
	_SacredShield				= 20925
	_SealOfInsight 				= 20165
	_SealOfRighteousness 		= 20154
	_SealOfThruth 				= 31801
	_ShieldOfTheRighteous 		= 53600
	_SpeedOfLight				= 85499
	_TemplarsVerdict			= 85256
	_TurnEvil					= 10326		
	_WordOfGlory				= 85673
	-- Paladin T16
	ProtPalT16 = {
		99126, -- Chest
		99127, -- Gloves
		99128, -- Helm
		99129, -- Legs
		99130 -- Shoulders
	}
	macros = { 
	    ["ActiveCooldowns"]   		= false,
	    ["ActiveDispel"]			= true, 
	   	["ActiveDPS"]   			= false,
	    ["ActiveHealing"]   		= false, 
	    ["AoE"]    					= 1,  
	    ["Consecration"]   			= true,
	    ["Pause"]					= false,
	    ["TakeControl"]				= false,
	} 
	SLASH_ACTIVECOOLDOWNS1 = "/activecooldowns"
	SLASH_ACTIVECOOLDOWNS2 = "/activecooldown"
	function SlashCmdList.ACTIVECOOLDOWNS(msg, editbox)
		if not macros["ActiveCooldowns"] then
			xrn:message("|cff9933ffCooldowns - Active.")
			macros["ActiveCooldowns"] = true
		else			
			xrn:message("|cff9933ffCooldowns - Inactive.")
			macros["ActiveCooldowns"] = false
		end
	end
	SLASH_ACTIVEDISPEL1 = "/activedispel"
	function SlashCmdList.ACTIVEDISPEL(msg, editbox)
		if not macros["ActiveDispel"] then
			xrn:message("\124cFFFFFFFFDispel - Active.") 
			macros["ActiveDispel"] = true
		else
			xrn:message("\124cFFFFFFFFDispel - Inactive.") 
			macros["ActiveDispel"] = false
		end
	end
	SLASH_ACTIVEDPS1 = "/activedps"
	function SlashCmdList.ACTIVEDPS(msg, editbox)
		if not macros["ActiveDPS"] then
			xrn:message("\124cFFFFFFFFDPS - Active.") 
			macros["ActiveDPS"] = true
		else
			xrn:message("\124cFFFFFFFFDPS - Inactive.") 
			macros["ActiveDPS"] = false
		end
	end
	SLASH_ACTIVEHEALING1 = "/activehealing"
	function SlashCmdList.ACTIVEHEALING(msg, editbox)
		if not macros["ActiveHealing"] then
			xrn:message("\124cFFFF78A0Healing - Active.") 
			macros["ActiveHealing"] = true
		else
			xrn:message("\124cFFFF78A0Healing - Inactive.")
			macros["ActiveHealing"] = false
		end
	end
	SLASH_AOE1 = "/aoe"
	function SlashCmdList.AOE(msg, editbox)
	    if macros["AoE"] == 1 then 
	        macros["AoE"] = 2 
	        xrn:message("\124cFF3BB0FFArea of Effect")
	    elseif macros["AoE"] == 2 and _Spec == 3 then 
	        macros["AoE"] = 3
	        xrn:message("\124cFFFFFFFFMass AoE")
	    else 
	    	macros["AoE"] = 1 
	        xrn:message("\124cFF3BB0FFSingle Target")
	    end
	end 
	SLASH_AOEGEUS1 = "/aoegeus"
	function SlashCmdList.AOEGEUS(msg, editbox)
	    if macros["AoE"] == 1 then 
	        macros["AoE"] = 3
	        xrn:message("\124cFFFFFFFFMass AoE")
	    else 
	    	macros["AoE"] = 1 
	        xrn:message("\124cFF3BB0FFSingle Target")
	    end
	end 	
	SLASH_CONSECRATION1 = "/consecration"
	function SlashCmdList.CONSECRATION(msg, editbox)
		if not macros["Consecration"] then
			xrn:message("|cffFF78A0Consecration - Active.")
			macros["Consecration"] = true
		else
			xrn:message("|cffFF78A0Consecration - Inactive.")
			macros["Consecration"] = false
		end
	end
	SLASH_HOFREE1 = "/hofree"
	function SlashCmdList.HOFREE(msg, editbox)
		if not macros["HoFreeQueue"] then
			xrn:message("\124cFFFFFFFFHand of Freedom Queued.")
			macros["HoFreeQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Freedom Canceled.")
			macros["HoFreeQueue"] = false
		end
	end
	SLASH_HOSAC1 = "/hosac"
	function SlashCmdList.HOSAC(msg, editbox)
		if not macros["HoSacQueue"] and GetNumGroupMembers() > 0 then
			xrn:message("\124cFFFFFFFFHand of Sacrifice Queued.")
			macros["HoSacQueue"] = true
		elseif GetNumGroupMembers() > 0 then
			xrn:message("\124cFFCC99FFHand of Sacrifice Canceled.")
			macros["HoSacQueue"] = false
		end
	end
	SLASH_HOSALV1 = "/hosalv"
	function SlashCmdList.HOSALV(msg, editbox)
		if not macros["HoSalvQueue"] then
			xrn:message("\124cFFFFFFFFHand of Salvation Queued.")
			macros["HoSalvQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Salvation Canceled.")
			macros["HoSalvQueue"] = false
		end
	end
	SLASH_HOPROT1 = "/hoprot"
	function SlashCmdList.HOPROT(msg, editbox)
		if not macros["HoProtQueue"] then
			xrn:message("\124cFFFFFFFFHand of Protection Queued.")
			macros["HoProtQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Protection Canceled.")
			macros["HoProtQueue"] = false
		end
	end
	SLASH_HOPUR1 = "/hopur"
	function SlashCmdList.HOPUR(msg, editbox)
		if not macros["HoPurQueue"] then
			xrn:message("\124cFFFFFFFFHand of Purity Queued.")
			macros["HoPurQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Purity Canceled.")
			macros["HoPurQueue"] = false
		end
	end
	SLASH_JUDGEFOCUS1 = "/judgefocus"
	function SlashCmdList.JUDGEFOCUS(msg, editbox)
		if not macros["JudgeFocusQueue"] then
			xrn:message("\124cFFFF3300Judgment on Focus Target Queued.")
			macros["JudgeFocusQueue"] = true
		else
			xrn:message("\124cFFFF3300Judgment on Focus Target Canceled.")
			macros["JudgeFocusQueue"] = false		
		end
	end
	SLASH_PAUSE1 = "/pause"
	function SlashCmdList.PAUSE(msg, editbox)
		if not macros["Pause"] then
			xrn:message("\124cFFFF3300Profile Paused.")
			macros["Pause"] = true
		else
			xrn:message("\124cFF0033FFProfile Resumed.")
			macros["Pause"] = false		
		end
	end
	SLASH_TAKECONTROL1 = "/takecontrol"
	function SlashCmdList.TAKECONTROL(msg, editbox)
		if not macros["TakeControl"] then
			xrn:message("\124cFFFF33CCMouseover Control Activated.")
			macros["TakeControl"] = true
		else
			xrn:message("\124cFFCC99FFMouseover Control Canceled.")
			macros["TakeControl"] = false
		end
	end
elseif _MyClass == 3 then
	-- Hunter Abilities
	_AimedShot					= 19434
	_AMurderOfCrows				= 131894
	_ArcaneShot     			= 3044 
	_AspectOfTheCheetah			= 5118
	_AspectOfTheIronHawk		= 109260
	_AspectOfThePack   			= 13159 
	_Barrage					= 120360
	_BestialWrath				= 19574
	_BindingShot	 			= 109248 
	_BlackArrow	 				= 3674
	_CallPet1					= 883
	_CallPet2					= 83242
	_CallPet3					= 83243
	_CallPet4					= 83244
	_CallPet5					= 83245
	_Camouflage		  			= 51753 
	_ChimeraShot				= 53209
	_CobraShot		   			= 77767 
	_ConcussiveShot    			= 5116
	_CounterShot   				= 147362
	_Deterrence    				= 19263
	_DireBeast					= 120679
	_Disengage    				= 781
	_DismissPet    				= 2641 
	_DistractingShot			= 20736
	_EagleEye	     			= 6197 
	_ExplosiveShot   			= 53301 
	_FeignDeath   				= 5384 
	_Fervor						= 82726
	_Flare     					= 1543
	_FocusFire					= 82692
	_GlaiveToss    				= 117050 
	_HeartOfThePhoenix			= 55709
	_HuntersMark				= 1130 
	_KillCommand				= 34026
	_KillShot   				= 53351
	_LynxRush					= 120697
	_MastersCall				= 53271
	_MendPet    				= 136 
	_Misdirection				= 34477
	_MultiShot		   			= 2643
	_PowerShot					= 109259
	_RapidFire					= 3045
	_RevivePet			  		= 982 
	_ScareBeast					= 1513
	_ScatterShot	 			= 19503 
	_SerpentSting   			= 1978
	_SilencingShot				= 34490
	_Stampede    				= 121818 
	_SteadyShot					= 56641
	_TameBeast		   			= 1515 
	_TranquilizingShot			= 19801 
	_TrapLauncher  				= 77769 
	_TrapLauncherExplosive		= 82939
	_TrapLauncherFreezing		= 60192
	_TrapLauncherIce			= 82941
	_TrapLauncherSnakes			= 82948 
	_TrapExplosive 				= 13813 
	_TrapFreezing				= 1499
	_TrapIce	   				= 13809
	_TrapSnakes					= 34600 
	_WidowVenom	    			= 82654 
elseif _MyClass == 4 then
	-- Rogue Abilities
	_AdrenalineRush				= 13750
	_Ambush     				= 8676
	_Backstab     				= 53 
	_Berserking  				= 26297
	_BladeFlurry				= 13877
	_Blind          			= 2094 
	_BloodFury					= 20572      
	_CheapShot      			= 1833  
	_CloakOfShadows 			= 31224 
	_CrimsonTempest 			= 121411
	_CripplingPoison  			= 3408 
	_DeadlyPoison   			= 2823 
	_DeadlyThrow    			= 26679
	_DisarmTrap    				= 1842
	_Dismantle    				= 51722
	_Dispatch					= 111240
	_Distract    				= 1725
	_Evasion    				= 5277 
	_Envenom					= 32645
	_Eviscerate     			= 2098 
	_ExposeArmor    			= 8647 
	_FanOfKnives   				= 51723 
	_Feint     					= 1966
	_Garrote    				= 703 
	_Gouge     					= 1776 
	_Hemorrhage    				= 16511
	_Kick     					= 1766
	_KidneyShot    				= 408 
	_KillingSpree				= 51690
	_LeechingPoison   			= 108211
	_MarkedForDeath				= 137619
	_MindnumbingPoison  		= 5761 
	_Mutilate					= 1329
	_ParalyticPoison  			= 108215 
	_PickLock    				= 1804
	_PickPocket    				= 921  
	_Premeditation   			= 14183 
	_Preparation   				= 14185 
	_Recuperate    				= 73651 
	_Redirect      				= 73981 
	_RevealingStrike			= 84617
	_Rupture    				= 1943
	_Sap      					= 6770 
	_ShadowBlades    			= 121471 
	_ShadowDance    			= 51713 
	_Shadowmeld					= 58984
	_ShadowWalk    				= 114842 
	_Shadowstep    				= 36554 
	_Shiv      					= 5938
	_ShroudOfConcealment 		= 114018 
	_SinisterStrike				= 1752
	_SliceAndDice   			= 5171 
	_SmokeBomb    				= 76577 
	_Sprint     				= 2983 
	_Stealth    				= 115191
	_Throw     					= 121733 
	_TricksOfTheTrade  			= 57934 
	_Vanish     				= 1856 
	_WoundPoison   				= 8679
end

-- Classes
_ClassColors = {
	["HUNTER"]		= {R=0.67,	G=0.83,	B=0.45,	Hex="|cffabd473"},
	["WARRIOR"]		= {R=0.78,	G=0.61,	B=0.43,	Hex="|cffc79c6e"},
	["PALADIN"] 	= {R=0.96,	G=0.55,	B=0.73,	Hex="|cfff58cba"},
	["MAGE"]		= {R=0.41,	G=0.8,	B=0.94,	Hex="|cff69ccf0"},
	["PRIEST"]		= {R=1,		G=1,	B=1,	Hex="|cffffffff"},
	["WARLOCK"]		= {R=0.58,	G=0.51,	B=0.79,	Hex="|cff9482c9"},
	["SHAMAN"]		= {R=0,		G=0.44,	B=0.87,	Hex="|cff0070de"},
	["DEATHKNIGHT"]	= {R=0.77,	G=0.12,	B=0.23, Hex="|cffc41f3b"},
	["DRUID"]		= {R=1,		G=0.49,	B=0.04,	Hex="|cffff7d0a"},
	["MONK"]		= {R=0,		G=1,	B=0.59,	Hex="|cff00ff96"},
	["ROGUE"]		= {R=1, 	G=0.96, B=0.41,	Hex="|cfffff569"}
}

-- Player Colors
PlayerHex = _ClassColors[select(2,UnitClass("player"))].Hex
PlayerR = _ClassColors[select(2,UnitClass("player"))].R 
PlayerG = _ClassColors[select(2,UnitClass("player"))].G
PlayerB = _ClassColors[select(2,UnitClass("player"))].B

ProbablyEngine.listener.register("UNIT_SPELLCAST_SUCCEEDED", function(...)
	local SourceUnit 	= select(1,...)
	local SpellID 		= select(5,...)
	if SourceUnit == "player" then
		if SpellID == 1856 or SpellID == 58984 or SpellID == 51713 then 
			if UnitExists("target") ~= nil then RunMacroText("/startattack") NoVanish = GetTime() + 1 end 
		end
	end
end)