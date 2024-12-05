-----------------------------------------------------------------------------------------
--
-- viewNewCharacter.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local native = require("native")
local sqlite3 = require( "sqlite3" )
local dbfunc = require( "copyDBto" )

characterArray = {}
insertSpot = 0
--increment = 1
statUpdate = 0

-- function to go to last view
function goBack()
	composer.removeScene( "viewNewCharacter")
	composer.gotoScene( "menu" )
end

-- function to add scrollView to screen
local scrollView = widget.newScrollView(
	{
	top = 0,
	left = 0,
	width = display.actualContentWidth,
	height = display.actualContentHeight,
	scrollWidth = display.actualContentWidth,
	scrollHeight = display.actualContentHeight,
	listener = scrollListener,
	setIsLocked = false,
	backgroundColor = { 0, 0, 0 }
	}
)

function scrollListener(event)
	local phase = event.phase
	-- 	if ( phase == "began" ) then print( "Scroll view was touched" )
	-- 	elseif ( phase == "moved" ) then print( "Scroll view was moved" )
	-- 	elseif ( phase == "ended" ) then print( "Scroll view was released" )
	-- end

	-- In the event a scroll limit is reached...
	-- if ( event.limitReached ) then
	-- 	if ( event.direction == "up" ) then print( "Reached bottom limit" )
	-- 	elseif ( event.direction == "down" ) then print( "Reached top limit" )
	-- 	elseif ( event.direction == "left" ) then print( "Reached right limit" )
	-- 	elseif ( event.direction == "right" ) then print( "Reached left limit" )
	-- 	end
	-- end
	
	return true
end

-- Function to create a completely random character
function random()
	-- Character Name
	roll = math.random(1,20)
	
	-- Just doing PHB for race for now...
	roll = math.random(1,14)
	races = { "Mountain Dwarf", "Hill Dwarf", "High Elf", "Wood Elf", "Drow", "Human", "Stout Halfling", "Lightfoot Halfling", "Dragonborn", "Forest Gnome", "Rock Gnome", "Half-Elf", "Half-Orc", "Tiefling"}
	raceField.text = races[roll]
	roll = math.random(1,13)
	classes = {"Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard", "Artificer"}
	--if(string.match(classField.text, "Barbarian") or roll == 1) then
	if(roll == 1) then
		attacksField.text = "Greataxe"
		attacksField2.text = "Handaxe"
		attacksField3.text = "Javelin"

		roll = math.random(1,10)
		if (roll == 1) then
			classField.text = "Barbarian Ancestral Guardian"
		elseif (roll == 2) then
			classField.text = "Barbarian Battlerager"
		elseif (roll == 3) then
			classField.text = "Barbarian Beast"
		elseif (roll == 4) then
			classField.text = "Barbarian Berserker"
		elseif (roll == 5) then
			classField.text = "Barbarian Giant"
		elseif (roll == 6) then
			classField.text = "Barbarian Storm Herald"
		elseif (roll == 7) then
			classField.text = "Barbarian Totem Warrior"
		elseif (roll == 8) then
			classField.text = "Barbarian Wild Magic"
		elseif (roll == 9) then
			classField.text = "Barbarian Zealot"
		elseif (roll == 10) then
			classField.text = "Barbarian Choose your subclass!"
		end

	elseif (roll == 2) then
		attacksField.text = "Rapier"
		attacksField2.text = "Dagger"

		roll = math.random(1,9)
		if (roll == 1) then
			classField.text = "Bard Creation"
		elseif (roll == 2) then
			classField.text = "Bard Eloquence"
		elseif (roll == 3) then
			classField.text = "Bard Glamour"
		elseif (roll == 4) then
			classField.text = "Bard Lore"
		elseif (roll == 5) then
			classField.text = "Bard Spirits"
		elseif (roll == 6) then
			classField.text = "Bard Swords"
		elseif (roll == 7) then
			classField.text = "Bard Valor"
		elseif (roll == 8) then
			classField.text = "Bard Whispers"
		elseif (roll == 9) then
			classField.text = "Bard Choose your subclass!"
		end

	elseif (roll == 3) then
		--some weapons are sub-class dependent
		attacksField2.text = "Light Crossbow"

		roll = math.random(1,15)
		if (roll == 1) then
			classField.text = "Cleric Arcana"
		elseif (roll == 2) then
			classField.text = "Cleric Death"
		elseif (roll == 3) then
			classField.text = "Cleric Forge"
		elseif (roll == 4) then
			classField.text = "Cleric Grave"
		elseif (roll == 5) then
			classField.text = "Cleric Knowledge"
		elseif (roll == 6) then
			classField.text = "Cleric Life"
		elseif (roll == 7) then
			classField.text = "Cleric Light"
		elseif (roll == 8) then
			classField.text = "Cleric Nature"
		elseif (roll == 9) then
			classField.text = "Cleric Order"
		elseif (roll == 10) then
			classField.text = "Cleric Peace"
		elseif (roll == 11) then
			classField.text = "Cleric Tempest"
		elseif (roll == 12) then
			classField.text = "Cleric Trickery"
		elseif (roll == 13) then
			classField.text = "Cleric Twilight"
		elseif (roll == 14) then
			classField.text = "Cleric War"
		elseif (roll == 15) then
			classField.text = "Cleric Choose your subclass!"
		end

	elseif (roll == 4) then
		attacksField.text = "Scimitar"
		roll = math.random(1,9)
		if (roll == 1) then
			classField.text = "Druid Dreams"
		elseif (roll == 2) then
			classField.text = "Druid Land"
		elseif (roll == 3) then
			classField.text = "Druid Moon"
		elseif (roll == 4) then
			classField.text = "Druid Shepherd"
		elseif (roll == 5) then
			classField.text = "Druid Knowledge"
		elseif (roll == 6) then
			classField.text = "Druid Spores"
		elseif (roll == 7) then
			classField.text = "Druid Stars"
		elseif (roll == 8) then
			classField.text = "Druid Wildfire"
		elseif (roll == 9) then
			classField.text = "Druid Choose your subclass!"
		end

	elseif (roll == 5) then
		attacksField3.text = "Handaxe"

		roll = math.random(1,11)
		if (roll == 1) then
			classField.text = "Fighter Arcane Archer"
		elseif (roll == 2) then
			classField.text = "Fighter Banneret"
		elseif (roll == 3) then
			classField.text = "Fighter Battle Master"
		elseif (roll == 4) then
			classField.text = "Fighter Cavalier"
		elseif (roll == 5) then
			classField.text = "Fighter Champion"
		elseif (roll == 6) then
			classField.text = "Fighter Echo Knight"
		elseif (roll == 7) then
			classField.text = "Fighter Eldritch Knight"
		elseif (roll == 8) then
			classField.text = "Fighter Psi Warrior"
		elseif (roll == 9) then
			classField.text = "Fighter Rune Knight"
		elseif (roll == 10) then
			classField.text = "Fighter Samurai"
		elseif (roll == 11) then
			classField.text = "Fighter Choose your subclass!"
		end

	elseif (roll == 6) then
		attacksField.text = "Shortsword"
		attacksField2.text = "Dart"

		roll = math.random(1,11)
		if (roll == 1) then
			classField.text = "Monk Astral Self"
		elseif (roll == 2) then
			classField.text = "Monk Ascendant Dragon"
		elseif (roll == 3) then
			classField.text = "Monk Drunken Master"
		elseif (roll == 4) then
			classField.text = "Monk Four Elements"
		elseif (roll == 5) then
			classField.text = "Monk Kensei"
		elseif (roll == 6) then
			classField.text = "Monk Long Death"
		elseif (roll == 7) then
			classField.text = "Monk Mercy"
		elseif (roll == 8) then
			classField.text = "Monk Open Hand"
		elseif (roll == 9) then
			classField.text = "Monk Shadow"
		elseif (roll == 10) then
			classField.text = "Monk Sun Soul"
		elseif (roll == 11) then
			classField.text = "Monk Choose your subclass!"
		end

	elseif (roll == 7) then
		attacksField3.text = "Javelin"
		
		roll = math.random(1,10)
		if (roll == 1) then
			classField.text = "Paladin Ancients"
		elseif (roll == 2) then
			classField.text = "Paladin Conquest"
		elseif (roll == 3) then
			classField.text = "Paladin Crown"
		elseif (roll == 4) then
			classField.text = "Paladin Devotion"
		elseif (roll == 5) then
			classField.text = "Paladin Glory"
		elseif (roll == 6) then
			classField.text = "Paladin Oathbreaker"
		elseif (roll == 7) then
			classField.text = "Paladin Redemption"
		elseif (roll == 8) then
			classField.text = "Paladin Vengeance"
		elseif (roll == 9) then
			classField.text = "Paladin Watchers"
		elseif (roll == 10) then
			classField.text = "Paladin Choose your subclass!"
		end

	elseif (roll == 8) then
		attacksField.text = "Shortsword"
		attacksField2.text = "Longbow"

		roll = math.random(1,9)
		if (roll == 1) then
			classField.text = "Ranger Beast Master"
		elseif (roll == 2) then
			classField.text = "Ranger Fey Wanderer"
		elseif (roll == 3) then
			classField.text = "Ranger Gloom Stalker"
		elseif (roll == 4) then
			classField.text = "Ranger Horizon Walker"
		elseif (roll == 5) then
			classField.text = "Ranger Hunter"
		elseif (roll == 6) then
			classField.text = "Ranger Monster Slayer"
		elseif (roll == 7) then
			classField.text = "Ranger Swarmkeeper"
		elseif (roll == 8) then
			classField.text = "Ranger Drakewarden"
		elseif (roll == 9) then
			classField.text = "Ranger Choose your subclass!"
		end

	elseif (roll == 9) then
		attacksField.text = "Rapier"
		attacksField2.text = "Shortbow"
		attacksField3.text = "Dagger"

		roll = math.random(1,10)
		if (roll == 1) then
			classField.text = "Rogue Arcane Trickster"
		elseif (roll == 2) then
			classField.text = "Rogue Assassin"
		elseif (roll == 3) then
			classField.text = "Rogue Inquisitive"
		elseif (roll == 4) then
			classField.text = "Rogue Mastermind"
		elseif (roll == 5) then
			classField.text = "Rogue Phantom"
		elseif (roll == 6) then
			classField.text = "Rogue Scout"
		elseif (roll == 7) then
			classField.text = "Rogue Soulknife"
		elseif (roll == 8) then
			classField.text = "Rogue Swashbuckler"
		elseif (roll == 9) then
			classField.text = "Rogue Thief"
		elseif (roll == 10) then
			classField.text = "Rogue Choose your subclass!"
		end

	elseif (roll == 10) then
		attacksField.text = "Light Crossbow"
		attacksField2.text = "Dagger"

		roll = math.random(1,10)
		if (roll == 1) then
			classField.text = "Rogue Arcane Trickster"
		elseif (roll == 2) then
			classField.text = "Rogue Assassin"
		elseif (roll == 3) then
			classField.text = "Rogue Inquisitive"
		elseif (roll == 4) then
			classField.text = "Rogue Mastermind"
		elseif (roll == 5) then
			classField.text = "Rogue Phantom"
		elseif (roll == 6) then
			classField.text = "Rogue Scout"
		elseif (roll == 7) then
			classField.text = "Rogue Soulknife"
		elseif (roll == 8) then
			classField.text = "Rogue Swashbuckler"
		elseif (roll == 9) then
			classField.text = "Rogue Thief"
		elseif (roll == 10) then
			classField.text = "Rogue Choose your subclass!"
		end

	elseif(roll == 11) then
		attacksField.text = "Light Crossbow"
		attacksField2.text = "Dagger"
		
		roll = math.random(1,10)
		if (roll == 1) then
			classField.text = "Warlock Archfey"
		elseif (roll == 2) then
			classField.text = "Warlock Celestial"
		elseif (roll == 3) then
			classField.text = "Warlock Fathomless"
		elseif (roll == 4) then
			classField.text = "Warlock Fiend"
		elseif (roll == 5) then
			classField.text = "Warlock Genie"
		elseif (roll == 6) then
			classField.text = "Warlock Great Old One"
		elseif (roll == 7) then
			classField.text = "Warlock Hexblade"
		elseif (roll == 8) then
			classField.text = "Warlock Undead"
		elseif (roll == 9) then
			classField.text = "Warlock Undying"
		elseif (roll == 10) then
			classField.text = "Warlock Choose your subclass!"
		end

	elseif(roll == 12) then
		attacksField.text = "Quarterstaff"
		
		roll = math.random(1,14)
		if (roll == 1) then
			classField.text = "Wizard Abjuration"
		elseif (roll == 2) then
			classField.text = "Wizard Bladesinging"
		elseif (roll == 3) then
			classField.text = "Wizard Chronurgy"
		elseif (roll == 4) then
			classField.text = "Wizard Conjuration"
		elseif (roll == 5) then
			classField.text = "Wizard Divination"
		elseif (roll == 6) then
			classField.text = "Wizard Enchantment"
		elseif (roll == 7) then
			classField.text = "Wizard Evocation"
		elseif (roll == 8) then
			classField.text = "Wizard Graviturgy"
		elseif (roll == 9) then
			classField.text = "Wizard Illusion"
		elseif (roll == 10) then
			classField.text = "Wizard Necromancy"
		elseif (roll == 11) then
			classField.text = "Wizard Order of Scribes"
		elseif (roll == 12) then
			classField.text = "Wizard Transmutation"
		elseif (roll == 13) then
			classField.text = "Wizard War Magic"
		elseif (roll == 14) then
			classField.text = "Wizard Choose your subclass!"
		end

	elseif(roll == 13) then
		attacksField2.text = "Light Crossbow"

		roll = math.random(1,5)
		if (roll == 1) then
			classField.text = "Artificer Alchemist"
		elseif (roll == 2) then
			classField.text = "Artificer Armorer"
		elseif (roll == 3) then
			classField.text = "Artificer Artillerist"
		elseif (roll == 4) then
			classField.text = "Artificer Battle Smith"
		elseif (roll == 5) then
			classField.text = "Artificer Choose your subclass!"
		end
	end
	lvlField.text = "" .. roll
	experience = {0,300,900,2700,6500,14000,23000,34000,48000,64000,85000,100000,120000,140000,165000,195000,225000,265000,305000,355000}
	expField.text = "" .. experience[roll]
	roll = math.random(1,9)
	alignments = {"Lawful Good","Lawful Neutral","Lawful Evil","Neutral Good","True Neutral","Neutral Evil","Chaotic Good","Chaotic Neutral","Chaotic Evil",}
	alignField.text = alignments[roll]
	roll = math.random(1,47)
	backgrounds = {"Acolyte","Anthropologist","Archaeologist","Athlete","Charlatan","City Watch","Clan Crafter","Cloistered Scholar","Courtier","Criminal","Entertainer","Faceless","Faction Agent","Far Traveler","Feylost","Fisher","Folk Hero","Giant Foundling","Gladiator","Guild Artisan","Guild Merchant","Haunted One","Hermit","House Agent","Inheritor","Investigator","Knight","Knight of the Order","Marine","Mercenary Veteran","Noble","Outlander","Pirate","Rewarded","Ruined","Rune Carver","Sage","Sailor","Shipwright","Smuggler","Soldier","Spy","Urban Bounty Hunter","Urchin","Uthgardt Tribe Member","Waterdhavian Noble","Witchlight Hand"}
	bkdField.text = backgrounds[roll]

	-- Random rolls for stats
	roll = math.random(1,6)
	roll2 = math.random(1,6)
	roll3 = math.random(1,6)
	roll = roll + roll2 + roll3
	strength.text = "" .. roll
	roll = math.random(1,6)
	roll2 = math.random(1,6)
	roll3 = math.random(1,6)
	roll = roll + roll2 + roll3
	dexterity.text = "" .. roll
	roll = math.random(1,6)
	roll2 = math.random(1,6)
	roll3 = math.random(1,6)
	roll = roll + roll2 + roll3
	constitution.text = "" .. roll
	roll = math.random(1,6)
	roll2 = math.random(1,6)
	roll3 = math.random(1,6)
	roll = roll + roll2 + roll3
	intelligence.text = "" .. roll
	roll = math.random(1,6)
	roll2 = math.random(1,6)
	roll3 = math.random(1,6)
	roll = roll + roll2 + roll3
	wisdom.text = "" .. roll
	roll = math.random(1,6)
	roll2 = math.random(1,6)
	roll3 = math.random(1,6)
	roll = roll + roll2 + roll3
	charisma.text = "" .. roll

	-- adding race stats in after randomization
	if(raceField.text == "Mountain Dwarf") then
		strengthStat = tonumber(strength.text) + 2
		strength.text = "" .. strengthStat
		constitutionStat = tonumber(constitution.text) + 2
		constitution.text = "" .. constitutionStat
		speedField.text = "25 ft"
		playerField.text = ""
	elseif(raceField.text == "Hill Dwarf") then
		constitutionStat = tonumber(constitution.text) + 2
		constitution.text = "" .. constitutionStat
		wisdomStat = tonumber(wisdom.text) + 1
		wisdom.text = "" .. wisdomStat
		speedField.text = "25 ft"
		playerField.text = ""
	elseif(raceField.text == "High Elf") then
		dexterityStat = tonumber(dexterity.text) + 2
		dexterity.text = "" .. dexterityStat
		intelligenceStat = tonumber(intelligence.text) + 1
		intelligence.text = "" .. intelligenceStat
		speedField.text = "30 ft"
		playerField.text = ""
	elseif(raceField.text == "Wood Elf") then
		dexterityStat = tonumber(dexterity.text) + 2
		dexterity.text = "" .. dexterityStat
		wisdomStat = tonumber(wisdom.text) + 1
		wisdom.text = "" .. wisdomStat
		speedField.text = "30 ft"
		playerField.text = ""
	elseif(raceField.text == "Drow") then
		dexterityStat = tonumber(dexterity.text) + 2
		dexterity.text = "" .. dexterityStat
		charismaStat = tonumber(charisma.text) + 1
		charisma.text = "" .. charismaStat
		speedField.text = "30 ft"
		playerField.text = ""
	elseif(raceField.text == "Human") then
		strengthStat = tonumber(strength.text) + 1
		strength.text = "" .. strengthStat
		dexterityStat = tonumber(dexterity.text) + 1
		dexterity.text = "" .. dexterityStat
		constitutionStat = tonumber(constitution.text) + 1
		constitution.text = "" .. constitutionStat
		intelligenceStat = tonumber(intelligence.text) + 1
		intelligence.text = "" .. intelligenceStat
		wisdomStat = tonumber(wisdom.text) + 1
		wisdom.text = "" .. wisdomStat
		charismaStat = tonumber(charisma.text) + 1
		charisma.text = "" .. charismaStat
		speedField.text = "30 ft"
		playerField.text = ""
	elseif(raceField.text == "Stout Halfling") then
		dexterityStat = tonumber(dexterity.text) + 2
		dexterity.text = "" .. dexterityStat
		constitutionStat = tonumber(constitution.text) + 1
		constitution.text = "" .. constitutionStat
		speedField.text = "25 ft"
		playerField.text = ""
	elseif(raceField.text == "Lightfoot Halfling") then
		dexterityStat = tonumber(dexterity.text) + 2
		dexterity.text = "" .. dexterityStat
		wisdomStat = tonumber(wisdom.text) + 1
		wisdom.text = "" .. wisdomStat
		speedField.text = "25 ft"
		playerField.text = ""
	elseif(raceField.text == "Dragonborn") then
		strengthStat = tonumber(strength.text) + 2
		strength.text = "" .. strengthStat
		charismaStat = tonumber(charisma.text) + 1
		charisma.text = "" .. charismaStat
		speedField.text = "30 ft"
		playerField.text = ""
	elseif(raceField.text == "Forest Gnome") then
		dexterityStat = tonumber(dexterity.text) + 1
		dexterity.text = "" .. dexterityStat
		intelligenceStat = tonumber(intelligence.text) + 2
		intelligence.text = "" .. intelligenceStat
		speedField.text = "25 ft"
		playerField.text = ""
	elseif(raceField.text == "Rock Gnome") then
		constitutionStat = tonumber(constitution.text) + 1
		constitution.text = "" .. constitutionStat
		intelligenceStat = tonumber(intelligence.text) + 2
		intelligence.text = "" .. intelligenceStat
		speedField.text = "25 ft"
		playerField.text = ""
	elseif(raceField.text == "Half-Elf") then
		charismaStat = tonumber(charisma.text) + 2
		charisma.text = "" .. charismaStat
		lvlField.text = lvlField.text
		playerField.text = "Please give yourself +1 to two stats then erase this text!"
		speedField.text = "30 ft"
	elseif(raceField.text == "Half-Orc") then
		strengthStat = tonumber(strength.text) + 2
		strength.text = "" .. strengthStat
		constitutionStat = tonumber(constitution.text) + 1
		constitution.text = "" .. constitutionStat
		speedField.text = "30 ft"
		playerField.text = ""
	elseif(raceField.text == "Tiefling") then
		intelligenceStat = tonumber(intelligence.text) + 1
		intelligence.text = "" .. intelligenceStat
		charismaStat = tonumber(charisma.text) + 2
		charisma.text = "" .. charismaStat
		speedField.text = "30 ft"
		playerField.text = ""
	end

	--***Traits,Bonds,Ideals,and Flaws all need to come from Background.
	-- 8 traits, 6 bonds, 6 ideals ***DIFFICULT to randomize!, 6 flaws
	roll = math.random(1,8)
	traitsField.text = "" .. roll
	roll = math.random(1,6)
	bondsField.text = "" .. roll
	roll = math.random(1,6)
	idealsField.text = "" .. roll
	roll = math.random(1,6)
	flawsField.text = "" .. roll

	statUpdate = 0
end

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created

	-- Function to produce stat bonuses
	function determineBonuses()
		if(statUpdate == 0) then
			-- adding race stats in after randomization
			if(raceField.text == "Mountain Dwarf") then
				strengthStat = tonumber(strength.text) + 2
				strength.text = "" .. strengthStat
				constitutionStat = tonumber(constitution.text) + 2
				constitution.text = "" .. constitutionStat
				speedField.text = "25 ft"
			elseif(raceField.text == "Hill Dwarf") then
				constitutionStat = tonumber(constitution.text) + 2
				constitution.text = "" .. constitutionStat
				wisdomStat = tonumber(wisdom.text) + 1
				wisdom.text = "" .. wisdomStat
				speedField.text = "25 ft"
			elseif(raceField.text == "High Elf") then
				dexterityStat = tonumber(dexterity.text) + 2
				dexterity.text = "" .. dexterityStat
				intelligenceStat = tonumber(intelligence.text) + 1
				intelligence.text = "" .. intelligenceStat
				speedField.text = "30 ft"
			elseif(raceField.text == "Wood Elf") then
				dexterityStat = tonumber(dexterity.text) + 2
				dexterity.text = "" .. dexterityStat
				wisdomStat = tonumber(wisdom.text) + 1
				wisdom.text = "" .. wisdomStat
				speedField.text = "30 ft"
			elseif(raceField.text == "Drow") then
				dexterityStat = tonumber(dexterity.text) + 2
				dexterity.text = "" .. dexterityStat
				charismaStat = tonumber(charisma.text) + 1
				charisma.text = "" .. charismaStat
				speedField.text = "30 ft"
			elseif(raceField.text == "Human") then
				strengthStat = tonumber(strength.text) + 1
				strength.text = "" .. strengthStat
				dexterityStat = tonumber(dexterity.text) + 1
				dexterity.text = "" .. dexterityStat
				constitutionStat = tonumber(constitution.text) + 1
				constitution.text = "" .. constitutionStat
				intelligenceStat = tonumber(intelligence.text) + 1
				intelligence.text = "" .. intelligenceStat
				wisdomStat = tonumber(wisdom.text) + 1
				wisdom.text = "" .. wisdomStat
				charismaStat = tonumber(charisma.text) + 1
				charisma.text = "" .. charismaStat
				speedField.text = "30 ft"
			elseif(raceField.text == "Stout Halfling") then
				dexterityStat = tonumber(dexterity.text) + 2
				dexterity.text = "" .. dexterityStat
				constitutionStat = tonumber(constitution.text) + 1
				constitution.text = "" .. constitutionStat
				speedField.text = "25 ft"
			elseif(raceField.text == "Lightfoot Halfling") then
				dexterityStat = tonumber(dexterity.text) + 2
				dexterity.text = "" .. dexterityStat
				wisdomStat = tonumber(wisdom.text) + 1
				wisdom.text = "" .. wisdomStat
				speedField.text = "25 ft"
			elseif(raceField.text == "Dragonborn") then
				strengthStat = tonumber(strength.text) + 2
				strength.text = "" .. strengthStat
				charismaStat = tonumber(charisma.text) + 1
				charisma.text = "" .. charismaStat
				speedField.text = "30 ft"
			elseif(raceField.text == "Forest Gnome") then
				dexterityStat = tonumber(dexterity.text) + 1
				dexterity.text = "" .. dexterityStat
				intelligenceStat = tonumber(intelligence.text) + 2
				intelligence.text = "" .. intelligenceStat
				speedField.text = "25 ft"
			elseif(raceField.text == "Rock Gnome") then
				constitutionStat = tonumber(constitution.text) + 1
				constitution.text = "" .. constitutionStat
				intelligenceStat = tonumber(intelligence.text) + 2
				intelligence.text = "" .. intelligenceStat
				speedField.text = "25 ft"
			elseif(raceField.text == "Half-Elf") then
				charismaStat = tonumber(charisma.text) + 2
				charisma.text = "" .. charismaStat
				lvlField.text = lvlField.text
				speedField.text = "30 ft"
			elseif(raceField.text == "Half-Orc") then
				strengthStat = tonumber(strength.text) + 2
				strength.text = "" .. strengthStat
				constitutionStat = tonumber(constitution.text) + 1
				constitution.text = "" .. constitutionStat
				speedField.text = "30 ft"
			elseif(raceField.text == "Tiefling") then
				intelligenceStat = tonumber(intelligence.text) + 1
				intelligence.text = "" .. intelligenceStat
				charismaStat = tonumber(charisma.text) + 2
				charisma.text = "" .. charismaStat
				speedField.text = "30 ft"
			end
		end
			if(strength.text == "3") then
				strengthBonusText.text = "-4"
			elseif(strength.text == "4" or strength.text == "5") then
				strengthBonusText.text = "-3"
			elseif(strength.text == "6" or strength.text ==  "7") then
				strengthBonusText.text = "-2"
			elseif(strength.text == "8" or strength.text ==  "9") then
				strengthBonusText.text = "-1"
			elseif(strength.text == "10" or strength.text ==  "11") then
				strengthBonusText.text = "+0"
			elseif(strength.text == "12" or strength.text ==  "13") then
				strengthBonusText.text = "+1"
			elseif(strength.text == "14" or strength.text ==  "15") then
				strengthBonusText.text = "+2"
			elseif(strength.text == "16" or strength.text ==  "17") then
				strengthBonusText.text = "+3"
			elseif(strength.text == "18" or strength.text ==  "19") then
				strengthBonusText.text = "+4"
			elseif(strength.text == "20") then
				strengthBonusText.text = "+5"
			end
			if(dexterity.text == "3") then
				dexterityBonusText.text = "-4"
			elseif(dexterity.text == "4" or dexterity.text == "5") then
				dexterityBonusText.text = "-3"
			elseif(dexterity.text == "6" or dexterity.text ==  "7") then
				dexterityBonusText.text = "-2"
			elseif(dexterity.text == "8" or dexterity.text ==  "9") then
				dexterityBonusText.text = "-1"
			elseif(dexterity.text == "10" or dexterity.text ==  "11") then
				dexterityBonusText.text = "+0"
			elseif(dexterity.text == "12" or dexterity.text ==  "13") then
				dexterityBonusText.text = "+1"
			elseif(dexterity.text == "14" or dexterity.text ==  "15") then
				dexterityBonusText.text = "+2"
			elseif(dexterity.text == "16" or dexterity.text ==  "17") then
				dexterityBonusText.text = "+3"
			elseif(dexterity.text == "18" or dexterity.text ==  "19") then
				dexterityBonusText.text = "+4"
			elseif(dexterity.text == "20") then
				dexterityBonusText.text = "+5"
			end
			if(constitution.text == "3") then
				constitutionBonusText.text = "-4"
			elseif(constitution.text == "4" or constitution.text == "5") then
				constitutionBonusText.text = "-3"
			elseif(constitution.text == "6" or constitution.text ==  "7") then
				constitutionBonusText.text = "-2"
			elseif(constitution.text == "8" or constitution.text ==  "9") then
				constitutionBonusText.text = "-1"
			elseif(constitution.text == "10" or constitution.text ==  "11") then
				constitutionBonusText.text = "+0"
			elseif(constitution.text == "12" or constitution.text ==  "13") then
				constitutionBonusText.text = "+1"
			elseif(constitution.text == "14" or constitution.text ==  "15") then
				constitutionBonusText.text = "+2"
			elseif(constitution.text == "16" or constitution.text ==  "17") then
				constitutionBonusText.text = "+3"
			elseif(constitution.text == "18" or constitution.text ==  "19") then
				constitutionBonusText.text = "+4"
			elseif(constitution.text == "20") then
				constitutionBonusText.text = "+5"
			end
			if(intelligence.text == "3") then
				intelligenceBonusText.text = "-4"
			elseif(intelligence.text == "4" or intelligence.text == "5") then
				intelligenceBonusText.text = "-3"
			elseif(intelligence.text == "6" or intelligence.text ==  "7") then
				intelligenceBonusText.text = "-2"
			elseif(intelligence.text == "8" or intelligence.text ==  "9") then
				intelligenceBonusText.text = "-1"
			elseif(intelligence.text == "10" or intelligence.text ==  "11") then
				intelligenceBonusText.text = "+0"
			elseif(intelligence.text == "12" or intelligence.text ==  "13") then
				intelligenceBonusText.text = "+1"
			elseif(intelligence.text == "14" or intelligence.text ==  "15") then
				intelligenceBonusText.text = "+2"
			elseif(intelligence.text == "16" or intelligence.text ==  "17") then
				intelligenceBonusText.text = "+3"
			elseif(intelligence.text == "18" or intelligence.text ==  "19") then
				intelligenceBonusText.text = "+4"
			elseif(intelligence.text == "20") then
				intelligenceBonusText.text = "+5"
			end
			if(wisdom.text == "3") then
				wisdomBonusText.text = "-4"
			elseif(wisdom.text == "4" or wisdom.text == "5") then
				wisdomBonusText.text = "-3"
			elseif(wisdom.text == "6" or wisdom.text ==  "7") then
				wisdomBonusText.text = "-2"
			elseif(wisdom.text == "8" or wisdom.text ==  "9") then
				wisdomBonusText.text = "-1"
			elseif(wisdom.text == "10" or wisdom.text ==  "11") then
				wisdomBonusText.text = "+0"
			elseif(wisdom.text == "12" or wisdom.text ==  "13") then
				wisdomBonusText.text = "+1"
			elseif(wisdom.text == "14" or wisdom.text ==  "15") then
				wisdomBonusText.text = "+2"
			elseif(wisdom.text == "16" or wisdom.text ==  "17") then
				wisdomBonusText.text = "+3"
			elseif(wisdom.text == "18" or wisdom.text ==  "19") then
				wisdomBonusText.text = "+4"
			elseif(wisdom.text == "20") then
				wisdomBonusText.text = "+5"
			end
			if(charisma.text == "3") then
				charismaBonusText.text = "-4"
			elseif(charisma.text == "4" or charisma.text == "5") then
				charismaBonusText.text = "-3"
			elseif(charisma.text == "6" or charisma.text ==  "7") then
				charismaBonusText.text = "-2"
			elseif(charisma.text == "8" or charisma.text ==  "9") then
				charismaBonusText.text = "-1"
			elseif(charisma.text == "10" or charisma.text ==  "11") then
				charismaBonusText.text = "+0"
			elseif(charisma.text == "12" or charisma.text ==  "13") then
				charismaBonusText.text = "+1"
			elseif(charisma.text == "14" or charisma.text ==  "15") then
				charismaBonusText.text = "+2"
			elseif(charisma.text == "16" or charisma.text ==  "17") then
				charismaBonusText.text = "+3"
			elseif(charisma.text == "18" or charisma.text ==  "19") then
				charismaBonusText.text = "+4"
			elseif(charisma.text == "20") then
				charismaBonusText.text = "+5"
			end
		-- Code to incorporate stats into other fields
		-- Utilizing level for proficiency bonus
		grabLvl = tonumber(lvlField.text)
		if(tonumber(grabLvl) < 5) then
			proText.text = "+2"
		elseif(tonumber(grabLvl) < 9) then
			proText.text = "+3"
		elseif(tonumber(grabLvl) < 13) then
			proText.text = "+4"
		elseif(tonumber(grabLvl) < 17) then
			proText.text = "+5"
		else
			proText.text = "+6"
		end

		calc = 0
		-- Utilizing class for stat saving throw fields
		if (string.match(classField.text, "Barbarian")) then
			local barbCalc = tonumber(strengthBonusText.text)
			if(barbCalc ~= nil) then
				if(barbCalc > -1) then
					strSaveText.text = "+" .. barbCalc
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					strSaveText.text = barbCalc
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			barbCalc = tonumber(constitutionBonusText.text)
			if(barbCalc > -1) then
				conSaveText.text = "+" .. barbCalc
			else
				conSaveText.text = barbCalc
			end
			calc = barbCalc
		elseif(string.match(classField.text, "Bard")) then
			local bardCalc = tonumber(dexterityBonusText.text)
			if(bardCalc ~= nil) then
				if(bardCalc > -1) then
					dexSaveText.text = "+" .. bardCalc
					strSaveText.text = strengthBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					conSaveText.text = constitutionBonusText.text
				else
					dexSaveText.text = bardCalc
					strSaveText.text = strengthBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					conSaveText.text = constitutionBonusText.text
				end
			end
			bardCalc = tonumber(charismaBonusText.text)
			if(bardCalc > -1) then
				chaSaveText.text = "+" .. bardCalc
			else
				chaSaveText.text = bardCalc
			end
			calc = bardCalc
		elseif(string.match(classField.text, "Cleric")) then
			local clericCalc = tonumber(wisdomBonusText.text)
			if(clericCalc ~= nil) then
				if(calc > -1) then
					wisSaveText.text = "+" .. clericCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					conSaveText.text = constitutionBonusText.text
				else
					wisSaveText.text = clericCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					conSaveText.text = constitutionBonusText.text
				end
			end
			clericCalc = tonumber(charismaBonusText.text)
			if(clericCalc > -1) then
				chaSaveText.text = "+" .. clericCalc
			else
				chaSaveText.text = clericCalc
			end
			calc = clericCalc
		elseif(string.match(classField.text, "Druid")) then
			local druidCalc = tonumber(intelligenceBonusText.text)
			if(druidCalc ~= nil) then
				if(druidCalc > -1) then
					intSaveText.text = "+" .. druidCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					conSaveText.text = constitutionBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					intSaveText.text = druidCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					conSaveText.text = constitutionBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			druidCalc = tonumber(wisdomBonusText.text)
			if(druidCalc > -1) then
				wisSaveText.text = "+" .. druidCalc
			else
				wisSaveText.text = druidCalc
			end
			calc = druidCalc
		elseif(string.match(classField.text, "Fighter")) then
			local fighterCalc = tonumber(strengthBonusText.text)
			if(fighterCalc ~= nil) then
				if(fighterCalc > -1) then
					strSaveText.text = "+" .. fighterCalc
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					strSaveText.text = fighterCalc
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			fighterCalc = tonumber(constitutionBonusText.text)
			if(fighterCalc > -1) then
				conSaveText.text = "+" .. fighterCalc
			else
				conSaveText.text = fighterCalc
			end
			calc = fighterCalc
		elseif(string.match(classField.text, "Monk")) then
			local monkCalc = tonumber(strengthBonusText.text)
			if(monkCalc ~= nil) then
				if(monkCalc > -1) then
					strSaveText.text = "+" .. monkCalc
					conSaveText.text = constitutionBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					strSaveText.text = monkCalc
					conSaveText.text = constitutionBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			monkCalc = tonumber(dexterityBonusText.text)
			if(monkCalc > -1) then
				dexSaveText.text = "+" .. monkCalc
			else
				dexSaveText.text = monkCalc
			end
			calc = monkCalc
		elseif(string.match(classField.text, "Paladin")) then
			local paladinCalc = tonumber(wisdomBonusText.text)
			if(paladinCalc ~= nil) then
				if(paladinCalc > -1) then
					wisSaveText.text = "+" .. paladinCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					conSaveText.text = constitutionBonusText.text
				else
					wisSaveText.text = paladinCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					conSaveText.text = constitutionBonusText.text
				end
			end
			paladinCalc = tonumber(charismaBonusText.text)
			if(paladinCalc > -1) then
				chaSaveText.text = "+" .. paladinCalc
			else
				chaSaveText.text = paladinCalc
			end
			calc = paladinCalc
		elseif(string.match(classField.text, "Ranger")) then
			local rangerCalc = tonumber(strengthBonusText.text)
			if(rangerCalc ~= nil) then
				if(rangerCalc > -1) then
					strSaveText.text = "+" .. rangerCalc
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
					conSaveText.text = constitutionBonusText.text
				else
					strSaveText.text = rangerCalc
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
					conSaveText.text = constitutionBonusText.text
				end
			end
			rangerCalc = tonumber(dexterityBonusText.text)
			if(rangerCalc > -1) then
				dexSaveText.text = "+" .. rangerCalc
			else
				dexSaveText.text = rangerCalc
			end
			calc = rangerCalc
		elseif(string.match(classField.text, "Rogue")) then
			local rogueCalc = tonumber(dexterityBonusText.text)
			if(rogueCalc ~= nil) then
				if(rogueCalc > -1) then
					dexSaveText.text = "+" .. rogueCalc
					strSaveText.text = strengthBonusText.text
					conSaveText.text = constitutionBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					strSaveText.text = rogueCalc
					strSaveText.text = strengthBonusText.text
					conSaveText.text = constitutionBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			rogueCalc = tonumber(intelligenceBonusText.text)
			if(rogueCalc > -1) then
				intSaveText.text = "+" .. rogueCalc
			else
				intSaveText.text = rogueCalc
			end
			calc = rogueCalc
		elseif(string.match(classField.text, "Sorcerer")) then
			local sorcererCalc = tonumber(constitutionBonusText.text)
			if(sorcererCalc ~= nil) then
				if(sorcererCalc > -1) then
					conSaveText.text = "+" .. sorcererCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
				else
					conSaveText.text = sorcererCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					wisSaveText.text = wisdomBonusText.text
				end
			end
			sorcererCalc = tonumber(charismaBonusText.text)
			if(sorcererCalc > -1) then
				chaSaveText.text = "+" .. sorcererCalc
			else
				chaSaveText.text = sorcererCalc
			end
			calc = sorcererCalc
		elseif(string.match(classField.text, "Warlock")) then
			local warlockCalc = tonumber(wisdomBonusText.text)
			if(warlockCalc ~= nil) then
				if(warlockCalc > -1) then
					wisSaveText.text = "+" .. warlockCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					conSaveText.text = constitutionBonusText.text
				else
					wisSaveText.text = warlockCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					intSaveText.text = intelligenceBonusText.text
					conSaveText.text = constitutionBonusText.text
				end
			end
			warlockCalc = tonumber(charismaBonusText.text)
			if(warlockCalc > -1) then
				chaSaveText.text = "+" .. warlockCalc
			else
				chaSaveText.text = warlockCalc
			end
			calc = warlockCalc
		elseif(string.match(classField.text, "Wizard")) then
			local wizardCalc = tonumber(intelligenceBonusText.text) + 2
			if(wizardCalc ~= nil) then
				if(wizardCalc > -1) then
					intSaveText.text = "+" .. wizardCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					conSaveText.text = constitutionBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					intSaveText.text = wizardCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					conSaveText.text = constitutionBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			wizardCalc = tonumber(wisdomBonusText.text)
			if(wizardCalc > -1) then
				wisSaveText.text = "+" .. wizardCalc
			else
				wisSaveText.text = wizardCalc
			end
			calc = wizardCalc
		elseif(string.match(classField.text, "Artificer")) then
			local artificerCalc = tonumber(constitutionBonusText.text)
			if(artificerCalc ~= nil) then
				if(artificerCalc > -1) then
					conSaveText.text = "+" .. artificerCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				else
					conSaveText.text = artificerCalc
					strSaveText.text = strengthBonusText.text
					dexSaveText.text = dexterityBonusText.text
					wisSaveText.text = wisdomBonusText.text
					chaSaveText.text = charismaBonusText.text
				end
			end
			artificerCalc = tonumber(intelligenceBonusText.text)
			if(artificerCalc > -1) then
				intSaveText.text = "+" .. artificerCalc
			else
				intSaveText.text = artificerCalc
			end
			calc = artificerCalc
		end

		-- Utilizing stat bonuses for skills
		calc = tonumber(strSaveText.text)
		if(calc > -1) then
			athText.text = "+" .. calc
		else
			athText.text = "" .. calc
		end
		calc = tonumber(dexSaveText.text)
		if(calc > -1) then
			acroText.text = "+" .. calc
			sleightText.text = "+" .. calc
			stealthText.text = "+" .. calc
		else
			acroText.text = "" .. calc
			sleightText.text = "" .. calc
			stealthText.text = "" .. calc
		end
		calc = tonumber(intSaveText.text)
		if(calc > -1) then
			arcText.text = "+" .. calc
			hisText.text = "+" .. calc
			investText.text = "+" .. calc
			natText.text = "+" .. calc
			reliText.text = "+" .. calc
		else
			arcText.text = "" .. calc
			hisText.text = "" .. calc
			investText.text = "" .. calc
			natText.text = "" .. calc
			reliText.text = "" .. calc
		end
		calc = tonumber(wisSaveText.text)
		if(calc > -1) then
			animalText.text = "+" .. calc
			insText.text = "+" .. calc
			medText.text = "+" .. calc
			perText.text = "+" .. calc
			survText.text = "+" .. calc
		else
			animalText.text = "" .. calc
			insText.text = "" .. calc
			medText.text = "" .. calc
			perText.text = "" .. calc
			survText.text = "" .. calc
		end
		calc = tonumber(chaSaveText.text)
		if(calc > -1) then
			decText.text = "+" .. calc
			intimText.text = "+" .. calc
			performText.text = "+" .. calc
			persText.text = "+" .. calc
		else
			decText.text = "" .. calc
			intimText.text = "" .. calc
			performText.text = "" .. calc
			persText.text = "" .. calc
		end

		-- Code to calculate initiative Save
		initText.text = "" .. dexterityBonusText.text
		
			statUpdate = 1
	end

	function weaponsCheck()
		--saveCharacter(nameField,raceField,classField,lvlField,alignField,playerField,expField,bkdField,strength,dexterity,constitution,intelligence,wisdom,charisma,inspirationField,proText,strSaveText,dexSaveText,conSaveText,intSaveText,wisSaveText,chaSaveText,acroText,animalText,arcText,athText,decText,hisText,insText,intimText,investText,medText,natText,perText,performTextpersText,reliText,sleightText,stealthText,survText,passiveText,ACField,initText,speedField,HPField,maxHPField,successField1,successField2,successField3,failureField1,failureField2,failureField3,proficienciesField,attacksField,attacksField2,attacksField3,attacksField4,cpField,spFieldepField,gpField,ppField,equipField,traitsField,bondsField,idealsField,flawsField)
		
		-- Code to fix passive field
		passiveCalc = 10 + tonumber(wisdomBonusText.text)
		passiveText.text = "" .. passiveCalc

		-- Utilizing stats for attacks and bonuses
		if(attacksField.text == "Greatsword" or attacksField.text == "Maul") then
			atk1DmgText.text = "2d6"
		elseif(attacksField.text == "Handaxe" or attacksField.text == "Javelin" or attacksField.text == "Mace" or attacksField.text == "Quarterstaff" or attacksField.text == "Spear" or attacksField.text == "Shortbow" or attacksField.text == "Scimitar" or attacksField.text == "Shortsword" or attacksField.text == "Trident" or attacksField.text == "Hand Crossbow") then
			atk1DmgText.text = "1d6"
		elseif(attacksField.text == "Greatclub" or attacksField.text == "Light Crossbow" or attacksField.text == "Battleaxe" or attacksField.text == "Flail" or attacksField.text == "Longsword" or attacksField.text == "Morningstar" or attacksField.text == "Rapier" or attacksField.text == "War Pick" or attacksField.text == "Warhammer" or attacksField.text == "Longbow") then
			atk1DmgText.text = "1d8"
		elseif(attacksField.text == "Glaive" or attacksField.text == "Halberd" or attacksField.text == "Pike" or attacksField.text == "Heavy Crossbow") then
			atk1DmgText.text = "1d10"
		elseif(attacksField.text == "Greataxe" or attacksField.text == "Lance") then
			atk1DmgText.text = "1d12"
		else
			atk1DmgText.text = "1d4"
		end
		if(attacksField.text == "Dagger" or attacksField.text == "Rapier" or attacksField.text == "Scimitar" or attacksField.text == "Shortsword" or attacksField.text == "Whip") then
			if(tonumber(dexterity.text) > tonumber(strength.text)) then
				atk1BonusText.text = dexterityBonusText.text
			else
				atk1BonusText.text = strengthBonusText.text
			end
		elseif(attacksField.text == "Light Crossbow" or attacksField.text == "Dart" or attacksField.text == "Shortbow" or attacksField.text == "Sling" or attacksField.text == "Blowgun" or attacksField.text == "Hand Crossbow" or attacksField.text == "Heavy Crossbow" or attacksField.text == "Longbow") then
			atk1BonusText.text = dexterityBonusText.text
		else
			atk1BonusText.text = strengthBonusText.text
		end
		--Attacks 2
		if(attacksField2.text == "Greatsword" or attacksField2.text == "Maul") then
			atk2DmgText.text = "2d6"
		elseif(attacksField2.text == "Handaxe" or attacksField2.text == "Javelin" or attacksField2.text == "Mace" or attacksField2.text == "Quarterstaff" or attacksField2.text == "Spear" or attacksField2.text == "Shortbow" or attacksField2.text == "Scimitar" or attacksField2.text == "Shortsword" or attacksField2.text == "Trident" or attacksField2.text == "Hand Crossbow") then
			atk2DmgText.text = "1d6"
		elseif(attacksField2.text == "Greatclub" or attacksField2.text == "Light Crossbow" or attacksField2.text == "Battleaxe" or attacksField2.text == "Flail" or attacksField2.text == "Longsword" or attacksField2.text == "Morningstar" or attacksField2.text == "Rapier" or attacksField2.text == "War Pick" or attacksField2.text == "Warhammer" or attacksField2.text == "Longbow") then
			atk2DmgText.text = "1d8"
		elseif(attacksField2.text == "Glaive" or attacksField2.text == "Halberd" or attacksField2.text == "Pike" or attacksField2.text == "Heavy Crossbow") then
			atk2DmgText.text = "1d10"
		elseif(attacksField2.text == "Greataxe" or attacksField2.text == "Lance") then
			atk2DmgText.text = "1d12"
		else
			atk2DmgText.text = "1d4"
		end
		if(attacksField2.text == "Dagger" or attacksField2.text == "Rapier" or attacksField2.text == "Scimitar" or attacksField2.text == "Shortsword" or attacksField2.text == "Whip") then
			if(tonumber(dexterity.text) > tonumber(strength.text)) then
				atk2BonusText.text = dexterityBonusText.text
			else
				atk2BonusText.text = strengthBonusText.text
			end
		elseif(attacksField2.text == "Light Crossbow" or attacksField2.text == "Dart" or attacksField2.text == "Shortbow" or attacksField2.text == "Sling" or attacksField2.text == "Blowgun" or attacksField2.text == "Hand Crossbow" or attacksField2.text == "Heavy Crossbow" or attacksField2.text == "Longbow") then
			atk2BonusText.text = dexterityBonusText.text
		else
			atk2BonusText.text = strengthBonusText.text
		end
		--Attacks 3
		if(attacksField3.text == "Greatsword" or attacksField3.text == "Maul") then
			atk3DmgText.text = "2d6"
		elseif(attacksField3.text == "Handaxe" or attacksField3.text == "Javelin" or attacksField3.text == "Mace" or attacksField3.text == "Quarterstaff" or attacksField3.text == "Spear" or attacksField3.text == "Shortbow" or attacksField3.text == "Scimitar" or attacksField3.text == "Shortsword" or attacksField3.text == "Trident" or attacksField3.text == "Hand Crossbow") then
			atk3DmgText.text = "1d6"
		elseif(attacksField3.text == "Greatclub" or attacksField3.text == "Light Crossbow" or attacksField3.text == "Battleaxe" or attacksField3.text == "Flail" or attacksField3.text == "Longsword" or attacksField3.text == "Morningstar" or attacksField3.text == "Rapier" or attacksField3.text == "War Pick" or attacksField3.text == "Warhammer" or attacksField3.text == "Longbow") then
			atk3DmgText.text = "1d8"
		elseif(attacksField3.text == "Glaive" or attacksField3.text == "Halberd" or attacksField3.text == "Pike" or attacksField3.text == "Heavy Crossbow") then
			atk3DmgText.text = "1d10"
		elseif(attacksField3.text == "Greataxe" or attacksField3.text == "Lance") then
			atk3DmgText.text = "1d12"
		else
			atk3DmgText.text = "1d4"
		end
		if(attacksField3.text == "Dagger" or attacksField3.text == "Rapier" or attacksField3.text == "Scimitar" or attacksField3.text == "Shortsword" or attacksField3.text == "Whip") then
			if(tonumber(dexterity.text) > tonumber(strength.text)) then
				atk3BonusText.text = dexterityBonusText.text
			else
				atk3BonusText.text = strengthBonusText.text
			end
		elseif(attacksField3.text == "Light Crossbow" or attacksField3.text == "Dart" or attacksField3.text == "Shortbow" or attacksField3.text == "Sling" or attacksField3.text == "Blowgun" or attacksField3.text == "Hand Crossbow" or attacksField3.text == "Heavy Crossbow" or attacksField3.text == "Longbow") then
			atk3BonusText.text = dexterityBonusText.text
		else
			atk3BonusText.text = strengthBonusText.text
		end
		--Attacks 4
		if(attacksField4.text == "Greatsword" or attacksField4.text == "Maul") then
			atk4DmgText.text = "2d6"
		elseif(attacksField4.text == "Handaxe" or attacksField4.text == "Javelin" or attacksField4.text == "Mace" or attacksField4.text == "Quarterstaff" or attacksField4.text == "Spear" or attacksField4.text == "Shortbow" or attacksField4.text == "Scimitar" or attacksField4.text == "Shortsword" or attacksField4.text == "Trident" or attacksField4.text == "Hand Crossbow") then
			atk4DmgText.text = "1d6"
		elseif(attacksField4.text == "Greatclub" or attacksField4.text == "Light Crossbow" or attacksField4.text == "Battleaxe" or attacksField4.text == "Flail" or attacksField4.text == "Longsword" or attacksField4.text == "Morningstar" or attacksField4.text == "Rapier" or attacksField4.text == "War Pick" or attacksField4.text == "Warhammer" or attacksField4.text == "Longbow") then
			atk4DmgText.text = "1d8"
		elseif(attacksField4.text == "Glaive" or attacksField4.text == "Halberd" or attacksField4.text == "Pike" or attacksField4.text == "Heavy Crossbow") then
			atk4DmgText.text = "1d10"
		elseif(attacksField4.text == "Greataxe" or attacksField4.text == "Lance") then
			atk4DmgText.text = "1d12"
		else
			atk4DmgText.text = "1d4"
		end
		if(attacksField4.text == "Dagger" or attacksField4.text == "Rapier" or attacksField4.text == "Scimitar" or attacksField4.text == "Shortsword" or attacksField4.text == "Whip") then
			if(tonumber(dexterity.text) > tonumber(strength.text)) then
				atk4BonusText.text = dexterityBonusText.text
			else
				atk4BonusText.text = strengthBonusText.text
			end
		elseif(attacksField4.text == "Light Crossbow" or attacksField4.text == "Dart" or attacksField4.text == "Shortbow" or attacksField4.text == "Sling" or attacksField4.text == "Blowgun" or attacksField4.text == "Hand Crossbow" or attacksField4.text == "Heavy Crossbow" or attacksField4.text == "Longbow") then
			atk4BonusText.text = dexterityBonusText.text
		else
			atk4BonusText.text = strengthBonusText.text
		end
	end

 	function saveCharacter()
		--Open database
		local path = system.pathForFile( "DB.db", system.DocumentsDirectory )
		--local path = system.pathForFile( "DB.db", system.ResourceDirectory )
		local db = sqlite3.open( path )

		--Create table with starting parameters
		if(nameField.text ~= nil) then
			CharacterName = nameField.text
		end
		tablesetup = [[CREATE TABLE IF NOT EXISTS newCharacter (
			"id" TEXT UNIQUE PRIMARY KEY,
			"CharacterName"	TEXT UNIQUE,
			"Race"	TEXT,
			"Class"	TEXT,
			"Level"	TEXT,
			"Alignment"	TEXT,
			"PlayerName"	TEXT,
			"Experience"	TEXT,
			"Background"	TEXT,
			"Strength"	TEXT,
			"Dexterity"	TEXT,
			"Constitution"	TEXT,
			"Intelligence"	TEXT,
			"Wisdom"	TEXT,
			"Charisma"	TEXT,
			"Inspiration"	TEXT,
			"Proficiency"	TEXT,
			"StrSave"	TEXT,
			"DexSave"	TEXT,
			"ConSave"	TEXT,
			"IntSave"	TEXT,
			"WisSave"	TEXT,
			"ChaSave"	TEXT,
			"Acrobatics"	TEXT,
			"AnimalHandling"	TEXT,
			"Arcana"	TEXT,
			"Athletics"	TEXT,
			"Deception"	TEXT,
			"History"	TEXT,
			"Insight"	TEXT,
			"Intimidation"	TEXT,
			"Investigation"	TEXT,
			"Medicine"	TEXT,
			"Nature"	TEXT,
			"Perception"	TEXT,
			"Performance"	TEXT,
			"Persuasion"	TEXT,
			"Religion"	TEXT,
			"SleightofHand"	TEXT,
			"Stealth"	TEXT,
			"Survival"	TEXT,
			"PassivePerception"	TEXT,
			"AC"	TEXT,
			"Initiative"	TEXT,
			"Speed"	TEXT,
			"HP"	TEXT,
			"MaxHP"	TEXT,
			"Success1"	TEXT,
			"Success2"	TEXT,
			"Success3"	TEXT,
			"Failure1"	TEXT,
			"Failure2"	TEXT,
			"Failure3"	TEXT,
			"Proficiencies"	TEXT,
			"Attacks1"	TEXT,
			"Attacks2"	TEXT,
			"Attacks3"	TEXT,
			"Attacks4"	TEXT,
			"CP"	TEXT,
			"SP"	TEXT,
			"EP"	TEXT,
			"GP"	TEXT,
			"PP"	TEXT,
			"Equipment"	TEXT,
			"Traits"	TEXT,
			"Bonds"	TEXT,
			"Ideals"	TEXT,
			"Flaws"	TEXT);]]
		check = db:exec( tablesetup )
		if(check ~= 0) then
			print(db:error_message())
		end
		finding = nil
		if(nameField.text ~= nil) then
			for row in db:nrows("SELECT CharacterName FROM newCharacter WHERE CharacterName = '"..CharacterName.."'") do
			--for row in db:nrows(findRow) do
				if(row.CharacterName == CharacterName) then
					print("updated")
					tablefill = "UPDATE newCharacter SET Race = '"..raceField.text.."', Class = '"..classField.text.."', Level = '"..lvlField.text.."', Alignment = '"..alignField.text.."', PlayerName =  '"..playerField.text.."', Experience = '"..expField.text.."', Background = '"..bkdField.text.."', Strength = '"..strength.text.."', Dexterity = '"..dexterity.text.."', Constitution = '"..constitution.text.."', Intelligence = '"..intelligence.text.."', Wisdom = '"..wisdom.text.."', Charisma = '"..charisma.text.."', Inspiration = '"..inspirationField.text.."', Proficiency = '"..proText.text.."', StrSave = '"..strSaveText.text.."', DexSave = '"..dexSaveText.text.."', ConSave = '"..conSaveText.text.."', IntSave = '"..intSaveText.text.."', WisSave = '"..wisSaveText.text.."', ChaSave = '"..chaSaveText.text.."', Acrobatics = '"..acroText.text .."', AnimalHandling = '"..animalText.text .."', Arcana = '"..arcText.text .."', Athletics = '"..athText.text .."', Deception = '"..decText.text .."', History = '"..hisText.text .."', Insight = '"..insText.text .."', Intimidation = '"..intimText.text .."', Investigation = '"..investText.text .."', Medicine = '"..medText.text .."', Nature = '"..natText.text .."', Perception = '"..perText.text .."', Performance = '"..performText.text.."', Persuasion = '"..persText.text .."', Religion = '"..reliText.text .."', SleightofHand = '"..sleightText.text .."', Stealth = '"..stealthText.text .."', Survival = '"..survText.text .."', PassivePerception = '"..passiveText.text .."', AC = '"..ACField.text .."', Initiative = '"..initText.text .."', Speed = '"..speedField.text .."', HP = '"..HPField.text .."', MaxHP = '"..maxHPField.text .."', Success1 = '"..successField1.text .."', Success2 = '"..successField2.text .."', Success3 = '"..successField3.text .."', Failure1 = '"..failureField1.text .."', Failure2 = '"..failureField2.text .."', Failure3 = '"..failureField3.text .."', Proficiencies = '"..proficienciesField.text .."', Attacks1 = '"..attacksField.text .."', Attacks2 = '"..attacksField2.text .."', Attacks3 = '"..attacksField3.text .."', Attacks4 = '"..attacksField4.text .."', CP = '"..cpField.text .."', SP = '"..spField.text.."', EP = '"..epField.text .."', GP = '"..gpField.text .."', PP = '"..ppField.text .."', Equipment = '"..equipField.text .."', Traits = '"..traitsField.text .."', Bonds = '"..bondsField.text .."', Ideals = '"..idealsField.text .."', Flaws = '"..flawsField.text.."' WHERE CharacterName = '"..CharacterName.."'"
					db:exec(tablefill)
					finding = 1
				--else
					
				end
			end
			
			if(finding == nil) then
				print("inserted")
				tablefill = "INSERT INTO newCharacter VALUES(NULL,'"..nameField.text.."', '"..raceField.text.."', '"..classField.text.."', '"..lvlField.text.."', '"..alignField.text.."', '"..playerField.text.."', '"..expField.text.."', '"..bkdField.text.."', '"..strength.text.."', '"..dexterity.text.."', '"..constitution.text.."', '"..intelligence.text.."', '"..wisdom.text.."', '"..charisma.text.."', '"..inspirationField.text.."', '"..proText.text.."', '"..strSaveText.text.."', '"..dexSaveText.text.."', '"..conSaveText.text.."', '"..intSaveText.text.."', '"..wisSaveText.text.."', '"..chaSaveText.text.."', '"..acroText.text .."', '"..animalText.text .."', '"..arcText.text .."', '"..athText.text .."', '"..decText.text .."', '"..hisText.text .."', '"..insText.text .."', '"..intimText.text .."', '"..investText.text .."', '"..medText.text .."', '"..natText.text .."', '"..perText.text .."', '"..performText.text.."', '"..persText.text .."', '"..reliText.text .."', '"..sleightText.text .."', '"..stealthText.text .."', '"..survText.text .."', '"..passiveText.text .."', '"..ACField.text .."', '"..initText.text .."', '"..speedField.text .."', '"..HPField.text .."', '"..maxHPField.text .."', '"..successField1.text .."', '"..successField2.text .."', '"..successField3.text .."', '"..failureField1.text .."', '"..failureField2.text .."', '"..failureField3.text .."', '"..proficienciesField.text .."', '"..attacksField.text .."', '"..attacksField2.text .."', '"..attacksField3.text .."', '"..attacksField4.text .."', '"..cpField.text .."', '"..spField.text.."', '"..epField.text .."', '"..gpField.text .."', '"..ppField.text .."', '"..equipField.text .."', '"..traitsField.text .."', '"..bondsField.text .."', '"..idealsField.text .."', '"..flawsField.text.."')"
				finding = db:exec(tablefill)
			end
		end
		db:close()
	end

	-- Function to load character on load button click
	function loadCharacter()
		statUpdate = 1
		--Open database
		local path = system.pathForFile( "DB.db", system.DocumentsDirectory )
		local db = sqlite3.open( path )

		tablesetup = [[CREATE TABLE IF NOT EXISTS newCharacter (
			"id" TEXT UNIQUE PRIMARY KEY,
			"CharacterName"	TEXT UNIQUE,
			"Race"	TEXT,
			"Class"	TEXT,
			"Level"	TEXT,
			"Alignment"	TEXT,
			"PlayerName"	TEXT,
			"Experience"	TEXT,
			"Background"	TEXT,
			"Strength"	TEXT,
			"Dexterity"	TEXT,
			"Constitution"	TEXT,
			"Intelligence"	TEXT,
			"Wisdom"	TEXT,
			"Charisma"	TEXT,
			"Inspiration"	TEXT,
			"Proficiency"	TEXT,
			"StrSave"	TEXT,
			"DexSave"	TEXT,
			"ConSave"	TEXT,
			"IntSave"	TEXT,
			"WisSave"	TEXT,
			"ChaSave"	TEXT,
			"Acrobatics"	TEXT,
			"AnimalHandling"	TEXT,
			"Arcana"	TEXT,
			"Athletics"	TEXT,
			"Deception"	TEXT,
			"History"	TEXT,
			"Insight"	TEXT,
			"Intimidation"	TEXT,
			"Investigation"	TEXT,
			"Medicine"	TEXT,
			"Nature"	TEXT,
			"Perception"	TEXT,
			"Performance"	TEXT,
			"Persuasion"	TEXT,
			"Religion"	TEXT,
			"SleightofHand"	TEXT,
			"Stealth"	TEXT,
			"Survival"	TEXT,
			"PassivePerception"	TEXT,
			"AC"	TEXT,
			"Initiative"	TEXT,
			"Speed"	TEXT,
			"HP"	TEXT,
			"MaxHP"	TEXT,
			"Success1"	TEXT,
			"Success2"	TEXT,
			"Success3"	TEXT,
			"Failure1"	TEXT,
			"Failure2"	TEXT,
			"Failure3"	TEXT,
			"Proficiencies"	TEXT,
			"Attacks1"	TEXT,
			"Attacks2"	TEXT,
			"Attacks3"	TEXT,
			"Attacks4"	TEXT,
			"CP"	TEXT,
			"SP"	TEXT,
			"EP"	TEXT,
			"GP"	TEXT,
			"PP"	TEXT,
			"Equipment"	TEXT,
			"Traits"	TEXT,
			"Bonds"	TEXT,
			"Ideals"	TEXT,
			"Flaws"	TEXT);]]
		check = db:exec( tablesetup )
		if(check ~= 0) then
			print(db:error_message())
		end
		
		--Save fields into variables
		if(nameField.text == "" or nameField.text == nil) then
			theWhere = 1
		else
			theWhere = nameField.text
		end
		raceData = "\n" .. raceField.text
		classData = "\n" .. classField.text
		lvlData = "\n" .. lvlField.text
		alignData = "\n" .. alignField.text
		playerData = "\n" .. playerField.text
		expData = "\n" .. expField.text
		bkdData = "\n" .. bkdField.text
		strengthData = "\n" .. strength.text
		dexterityData = "\n" .. dexterity.text
		constitutionData = "\n" .. constitution.text
		intelligenceData = "\n" .. intelligence.text
		wisdomData = "\n" .. wisdom.text
		charismaData = "\n" .. charisma.text
		strSaveData = "\n" .. strSaveText.text
		dexSaveData = "\n" .. dexSaveText.text
		conSaveData = "\n" .. conSaveText.text
		intSaveData = "\n" .. intSaveText.text
		wisSaveData = "\n" .. wisSaveText.text
		chaSaveData = "\n" .. chaSaveText.text
		inspirationData = "\n" .. inspirationField.text
		proData = "\n" .. proText.text
		acroData = "\n" .. acroText.text
		animalData = "\n" .. animalText.text
		arcData = "\n" .. arcText.text
		athData = "\n" .. athText.text
		decData = "\n" .. decText.text
		hisData = "\n" .. hisText.text
		insData = "\n" .. insText.text
		intimData = "\n" .. intimText.text
		investData = "\n" .. investText.text
		medData = "\n" .. medText.text
		natData = "\n" .. natText.text
		perData = "\n" .. perText.text
		performData = "\n" .. performText.text
		persData = "\n" .. persText.text
		reliData = "\n" .. reliText.text
		sleightData = "\n" .. sleightText.text
		stealthData = "\n" .. stealthText.text
		survData = "\n" .. survText.text
		passiveData = "\n" .. passiveText.text
		ACData = "\n" .. ACField.text
		initData = "\n" .. initText.text
		speedData = "\n" .. speedField.text
		HPData = "\n" .. HPField.text
		maxHPData = "\n" .. maxHPField.text
		successData1 = "\n" .. successField1.text
		successData2 = "\n" .. successField2.text
		successData3 = "\n" .. successField3.text
		failureData1 = "\n" .. failureField1.text
		failureData2 = "\n" .. failureField2.text
		failureData3 = "\n" .. failureField3.text
		proficienciesData = "\n" .. proficienciesField.text
		attacksData1 = "\n" .. attacksField.text
		attacksData2 = "\n" .. attacksField2.text
		attacksData3 = "\n" .. attacksField3.text
		attacksData4 = "\n" .. attacksField4.text
		cpData = "\n" .. cpField.text
		spData = "\n" .. spField.text
		epData = "\n" .. epField.text
		gpData = "\n" .. gpField.text
		ppData = "\n" .. ppField.text
		equipData = "\n" .. equipField.text
		traitsData = "\n" .. traitsField.text
		bondsData = "\n" .. bondsField.text
		idealsData = "\n" .. idealsField.text
		flawsData = "\n" .. flawsField.text
		
		-- Query the table according to the character name
		text = {increment}
		query = "SELECT * FROM newCharacter WHERE id=1"
		if(theWhere ~= nil or theWhere ~= "") then
			query = "SELECT * FROM newCharacter WHERE CharacterName='"..nameField.text.."'"
		end
		db:exec(query)
			for row in db:nrows(query) do
				nameField.text = row.CharacterName
				raceField.text = row.Race
				classField.text = row.Class
				lvlField.text = row.Level
				alignField.text = row.Alignment
				playerField.text = row.PlayerName
				expField.text = row.Experience
				bkdField.text = row.Background
				strength.text = row.Strength
				dexterity.text = row.Dexterity
				constitution.text = row.Constitution
				intelligence.text = row.Intelligence
				wisdom.text = row.Wisdom
				charisma.text = row.Charisma
				inspirationField.text = row.Inspiration
				proficienciesField.text = row.Proficiency
				strSaveText.text = row.StrSave
				dexSaveText.text = row.DexSave
				conSaveText.text = row.ConSave
				intSaveText.text = row.IntSave
				wisSaveText.text = row.WisSave
				chaSaveText.text = row.ChaSave
				acroText.text = row.Acrobatics
				animalText.text = row.AnimalHandling
				arcText.text = row.Arcana
				athText.text = row.Athletics
				decText.text = row.Deception
				hisText.text = row.History
				insText.text = row.Insight
				intimText.text = row.Intimidation
				investText.text = row.Investigation
				medText.text = row.Medicine
				natText.text = row.Nature
				perText.text = row.Perception
				performText.text = row.Performance
				persText.text = row.Persuasion
				reliText.text = row.Religion
				sleightText.text = row.SleightofHand
				stealthText.text = row.Stealth
				survText.text = row.Survival
				passiveText.text = row.PassivePerception
				ACField.text = row.AC
				initText.text = row.Initiative
				speedField.text = row.Speed
				HPField.text = row.HP
				maxHPField.text = row.MaxHP
				successField1.text = row.Success1
				successField2.text = row.Success2
				successField3.text = row.Success3
				failureField1.text = row.Failure1
				failureField2.text = row.Failure2
				failureField3.text = row.Failure3
				proficienciesField.text = row.Proficiencies
				attacksField.text = row.Attacks1
				attacksField2.text = row.Attacks2
				attacksField3.text = row.Attacks3
				attacksField4.text = row.Attacks4
				cpField.text = row.CP
				spField.text = row.SP
				epField.text = row.EP
				gpField.text = row.GP
				ppField.text = row.PP
				equipField.text = row.Equipment
				traitsField.text = row.Traits
				bondsField.text = row.Bonds
				idealsField.text = row.Ideals
				flawsField.text = row.Flaws
			end
		db:close()
	end
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
		
	if phase == "will" then

		title = display.newText( "New Character", display.contentCenterX, 40, "Centaur", 32 )
		title:setFillColor( 0, 0.2, 1 )

		-- id = display.newText( "Character ID # ", display.contentCenterX / 2, 50, "Centaur", 24 )
		-- id:setFillColor( 1, 0.7, 0.7 )
		
		idNumber = display.newText( "", display.contentCenterX, 50, "Centaur", 24 )
		idNumber:setFillColor( 1, 1, 1 )

		options = {
			x = display.contentCenterX / 4,
			y = 10,
			isEnabled = true,
			label = "Random",
			textOnly = true,
			labelColor = { default={ .5,0,.75 }, over={ 0, 0, 1, 0.8 } },
			onPress = random
		}

		options2 = {
			x = display.contentCenterX * 1.75,
			y = 10,
			isEnabled = true,
			label = "Back",
			textOnly = true,
			labelColor = { default={ 1, 0, 0 }, over={ 0, 0, 1, 0.8 } },
			onPress = goBack
		}

		options3 = {
			x = display.contentCenterX / 1.25,
			y = 10,
			isEnabled = true,
			label = "Save",
			textOnly = true,
			labelColor = { default={ .5,1,0 }, over={ 0, 0, 1, 0.8 } },
			onPress = saveCharacter
		}

		options4 = {
			x = display.contentCenterX * 1.25,
			y = 10,
			isEnabled = true,
			label = "Load",
			textOnly = true,
			labelColor = { default={ 1, .5, 0 }, over={ 0, 0, 1, 0.8 } },
			onPress = loadCharacter
		}

		-- Buttons to manipulate list
		randomButton = widget.newButton(options)
		backButton = widget.newButton(options2)
		saveButton = widget.newButton(options3)
		loadButton = widget.newButton(options4)

		-- Display text values for top of character sheet
		name = display.newText( "Character Name", (display.contentCenterX / 3), 80, "Centaur", 15 )
		name:setFillColor(1,1,1)

		race = display.newText( "Race", (display.contentCenterX / 3), 110, "Centaur", 15 )
		race:setFillColor(1,1,1)

		class = display.newText( "Class", (display.contentCenterX / 3), 140, "Centaur", 15 )
		class:setFillColor(1,1,1)

		lvl = display.newText( "Level", (display.contentCenterX / 3), 170, "Centaur", 15 )
		lvl:setFillColor(1,1,1)

		align = display.newText( "Alignment", (display.contentCenterX / 3), 200, "Centaur", 15 )
		align:setFillColor(1,1,1)

		player = display.newText( "Player Name", (display.contentCenterX / 3), 230, "Centaur", 15 )
		player:setFillColor(1,1,1)

		exp = display.newText( "Experience Points", (display.contentCenterX / 3), 260, "Centaur", 15 )
		exp:setFillColor(1,1,1)

		bkd = display.newText( "Background", (display.contentCenterX / 3), 290, "Centaur", 15 )
		bkd:setFillColor(1,1,1)

		-- Stats section
		title2 = display.newText( "Stats", display.contentCenterX, 330, "Centaur", 32 )
		title2:setFillColor( 0, 0.8, 0.8 )

		-- Display text values for stats of character sheet

		str = display.newText( "Strength", (display.contentCenterX / 3), 360, "Centaur", 15 )
		str:setFillColor(1,1,1)

		dex = display.newText( "Dexterity", (display.contentCenterX / 3), 390, "Centaur", 15 )
		dex:setFillColor(1,1,1)

		con = display.newText( "Constitution", (display.contentCenterX / 3), 420, "Centaur", 15 )
		con:setFillColor(1,1,1)

		int = display.newText( "Intelligence", (display.contentCenterX / 3), 450, "Centaur", 15 )
		int:setFillColor(1,1,1)

		wis = display.newText( "Wisdom", (display.contentCenterX / 3), 480, "Centaur", 15 )
		wis:setFillColor(1,1,1)
		
		cha = display.newText( "Charisma", (display.contentCenterX / 3), 510, "Centaur", 15 )
		cha:setFillColor(1,1,1)

		strBonus = display.newText( "Strength Bonus", (display.contentCenterX / .8), 360, "Centaur", 15 )
		strBonus:setFillColor(1,1,1)

		dexBonus = display.newText( "Dexterity Bonus", (display.contentCenterX / .8), 390, "Centaur", 15 )
		dexBonus:setFillColor(1,1,1)

		conBonus = display.newText( "Constitution Bonus", (display.contentCenterX / .8), 420, "Centaur", 15 )
		conBonus:setFillColor(1,1,1)

		intBonus = display.newText( "Intelligence Bonus", (display.contentCenterX / .8), 450, "Centaur", 15 )
		intBonus:setFillColor(1,1,1)

		wisBonus = display.newText( "Wisdom Bonus", (display.contentCenterX / .8), 480, "Centaur", 15 )
		wisBonus:setFillColor(1,1,1)

		chaBonus = display.newText( "Charisma Bonus", (display.contentCenterX / .8), 510, "Centaur", 15 )
		chaBonus:setFillColor(1,1,1)

		insp = display.newText( "Inspiration", (display.contentCenterX / 1.5), 540, "Centaur", 15 )
		insp:setFillColor(1,1,1)

		pro = display.newText( "Proficiency Bonus", (display.contentCenterX / 1.5), 570, "Centaur", 15 )
		pro:setFillColor(1,1,1)

		-- Saving throws
		title4 = display.newText( "Saving Throws", display.contentCenterX, 620, "Centaur", 32 )
		title4:setFillColor( 0.5, 0.5, 0 )
		
		strSave = display.newText( "Strength Save", (display.contentCenterX / 1.5), 660, "Centaur", 15 )
		strSave:setFillColor(1,1,1)

		dexSave = display.newText( "Dexterity Save", (display.contentCenterX / 1.5), 690, "Centaur", 15 )
		dexSave:setFillColor(1,1,1)

		conSave = display.newText( "Constitution Save", (display.contentCenterX / 1.5), 720, "Centaur", 15 )
		conSave:setFillColor(1,1,1)

		intSave = display.newText( "Intelligence Save", (display.contentCenterX / 1.5), 750, "Centaur", 15 )
		intSave:setFillColor(1,1,1)

		wisSave = display.newText( "Wisdom Save", (display.contentCenterX / 1.5), 780, "Centaur", 15 )
		wisSave:setFillColor(1,1,1)

		chaSave = display.newText( "Charisma Save", (display.contentCenterX / 1.5), 810, "Centaur", 15 )
		chaSave:setFillColor(1,1,1)

		-- Skills section
		title3 = display.newText( "Skills", display.contentCenterX, 850, "Centaur", 32 )
		title3:setFillColor( 1, 0.2, 0 )

		acro = display.newText( "Acrobatics", (display.contentCenterX / 3), 880, "Centaur", 15 )
		acro:setFillColor(1,1,1)

		animal = display.newText( "Animal Handling", (display.contentCenterX / 3), 910, "Centaur", 15 )
		animal:setFillColor(1,1,1)

		arc = display.newText( "Arcana", (display.contentCenterX / 3), 940, "Centaur", 15 )
		arc:setFillColor(1,1,1)

		ath = display.newText( "Athletics", (display.contentCenterX / 3), 970, "Centaur", 15 )
		ath:setFillColor(1,1,1)

		dec = display.newText( "Deception", (display.contentCenterX / 3), 1000, "Centaur", 15 )
		dec:setFillColor(1,1,1)

		his = display.newText( "History", (display.contentCenterX / 3), 1030, "Centaur", 15 )
		his:setFillColor(1,1,1)

		ins = display.newText( "Insight", (display.contentCenterX / 3), 1060, "Centaur", 15 )
		ins:setFillColor(1,1,1)

		intim = display.newText( "Intimidation", (display.contentCenterX / 3), 1090, "Centaur", 15 )
		intim:setFillColor(1,1,1)

		invest = display.newText( "Investigation", (display.contentCenterX / 3), 1120, "Centaur", 15 )
		invest:setFillColor(1,1,1)
		--Column 2
		med = display.newText( "Medicine", (display.contentCenterX / .8), 880, "Centaur", 15 )
		med:setFillColor(1,1,1)

		nat = display.newText( "Nature", (display.contentCenterX / .8), 910, "Centaur", 15 )
		nat:setFillColor(1,1,1)

		per = display.newText( "Perception", (display.contentCenterX / .8), 940, "Centaur", 15 )
		per:setFillColor(1,1,1)

		perform = display.newText( "Performance", (display.contentCenterX / .8), 970, "Centaur", 15 )
		perform:setFillColor(1,1,1)

		pers = display.newText( "Persuasion", (display.contentCenterX / .8), 1000, "Centaur", 15 )
		pers:setFillColor(1,1,1)

		reli = display.newText( "Religion", (display.contentCenterX / .8), 1030, "Centaur", 15 )
		reli:setFillColor(1,1,1)

		sleight = display.newText( "Sleight of Hand", (display.contentCenterX / .8), 1060, "Centaur", 15 )
		sleight:setFillColor(1,1,1)

		stealth = display.newText( "Stealth", (display.contentCenterX / .8), 1090, "Centaur", 15 )
		stealth:setFillColor(1,1,1)

		surv = display.newText( "Survival", (display.contentCenterX / .8), 1120, "Centaur", 15 )
		surv:setFillColor(1,1,1)

		passivePerception = display.newText( "Passive Wisdom (Perception)", (display.contentCenterX / 1.5), 1150, "Centaur", 15 )
		passivePerception:setFillColor(1,1,1)

		-- AC section
		title5 = display.newText( "AC, Init, and Speed", display.contentCenterX, 1180, "Centaur", 32 )
		title5:setFillColor( 0, 0.5, 0 )

		AC = display.newText( "AC", (display.contentCenterX / 4), 1210, "Centaur", 15 )
		AC:setFillColor(1,1,1)

		init = display.newText( "Initiative", (display.contentCenterX / .8), 1210, "Centaur", 15 )
		init:setFillColor(1,1,1)

		speed = display.newText( "Speed", (display.contentCenterX / 1.75), 1240, "Centaur", 15 )
		speed:setFillColor(1,1,1)

		-- HP section
		title6 = display.newText( "HP and Death Saves", display.contentCenterX, 1270, "Centaur", 32 )
		title6:setFillColor( 0.25, 0.25, 0.25 )

		HP = display.newText( "Current HP", (display.contentCenterX / 3.5), 1300, "Centaur", 15 )
		HP:setFillColor(1,1,1)

		maxHP = display.newText( "Maximum HP", (display.contentCenterX / .75 ), 1300, "Centaur", 15 )
		maxHP:setFillColor(1,1,1)

		death = display.newText( "Death Saves", (display.contentCenterX), 1330, "Centaur", 15 )
		death:setFillColor(1,1,1)

		successes = display.newText( "Successes", (display.contentCenterX / 3), 1360, "Centaur", 15 )
		successes:setFillColor(1,1,1)

		failures = display.newText( "Failures", (display.contentCenterX / 3), 1400, "Centaur", 15 )
		failures:setFillColor(1,1,1)

		clear1 = display.newText( "Clear", (display.contentCenterX / .6), 1360, "Centaur", 15 )
		clear1:setFillColor(0.5,0.5,0.5)

		clear2 = display.newText( "Clear", (display.contentCenterX / .6), 1400, "Centaur", 15 )
		clear2:setFillColor(0.5,0.5,0.5)

		proficiencies = display.newText( "Proficiences/Languages", (display.contentCenterX), 1440, "Centaur", 32 )
		proficiencies:setFillColor( 0.5, 0, 0.8 )

		attacks = display.newText( "Attacks", (display.contentCenterX), 1820, "Centaur", 32 )
		attacks:setFillColor( 0.5, 0.2, 0 )

		dmg = display.newText( "DMG", (display.contentCenterX / .75), 1850, "Centaur", 15 )
		dmg:setFillColor(1,1,1)

		bonus = display.newText( "Bonus", (display.contentCenterX / .55), 1850, "Centaur", 15 )
		bonus:setFillColor(1,1,1)

		money = display.newText( "Money", (display.contentCenterX), 2010, "Centaur", 32 )
		money:setFillColor( 0.8, 0.8, 0 )
		
		cp = display.newText( "CP", (display.contentCenterX * .25), 2040, "Centaur", 15 )
		cp:setFillColor(1,1,1)
		
		sp = display.newText( "SP", (display.contentCenterX * .65), 2040, "Centaur", 15 )
		sp:setFillColor(1,1,1)
		
		ep = display.newText( "EP", (display.contentCenterX), 2040, "Centaur", 15 )
		ep:setFillColor(1,1,1)
		
		gp = display.newText( "GP", (display.contentCenterX / .7), 2040, "Centaur", 15 )
		gp:setFillColor(1,1,1)
		
		pp = display.newText( "PP", (display.contentCenterX / .55), 2040, "Centaur", 15 )
		pp:setFillColor(1,1,1)

		equip = display.newText( "Equipment", (display.contentCenterX), 2120, "Centaur", 32 )
		equip:setFillColor( 0.5, 0.5, 0 )

		traits = display.newText( "Traits", (display.contentCenterX), 2390, "Centaur", 32 )
		traits:setFillColor( 0.5, 0.5, 0.5 )

		bonds = display.newText( "Bonds", (display.contentCenterX), 2520, "Centaur", 32 )
		bonds:setFillColor( 0.75, 0.75, 0.75 )

		ideals = display.newText( "Ideals", (display.contentCenterX), 2680, "Centaur", 32 )
		ideals:setFillColor( 1, 0, 1 )

		flaws = display.newText( "Flaws", (display.contentCenterX), 2810, "Centaur", 32 )
		flaws:setFillColor( 0, 1, 1 )

		ending = display.newText( "The End!", (display.contentCenterX), 3100, "Centaur", 32 )
		ending:setFillColor( 0,0,0 )

		-- Create text fields for input
		nameField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 80, 180, 28 )
		raceField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 110, 180, 28 )
		classField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 140, 180, 28 )
		lvlField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 170, 180, 28 )
		lvlField.text = "1"
		alignField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 200, 180, 28 )
		playerField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 230, 180, 28 )
		expField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 260, 180, 28 )
		bkdField = native.newTextField( display.contentCenterX + display.contentCenterX * .25 , 290, 180, 28 )
		strength = native.newTextField( display.contentCenterX * .75 , 360, 40, 28 )
		strength.text = "8"
		dexterity = native.newTextField( display.contentCenterX * .75 , 390, 40, 28 )
		dexterity.text = "8"
		constitution = native.newTextField( display.contentCenterX * .75 , 420, 40, 28 )
		constitution.text = "8"
		intelligence = native.newTextField( display.contentCenterX * .75 , 450, 40, 28 )
		intelligence.text = "8"
		wisdom = native.newTextField( display.contentCenterX * .75 , 480, 40, 28 )
		wisdom.text = "8"
		charisma = native.newTextField( display.contentCenterX * .75 , 510, 40, 28 )
		charisma.text = "8"
		strengthBonusText = display.newText( "+0", (display.contentCenterX / .56), 360, "Centaur", 30 )
		dexterityBonusText = display.newText( "+0", (display.contentCenterX / .56), 390, "Centaur", 30 )
		constitutionBonusText = display.newText( "+0", (display.contentCenterX / .56), 420, "Centaur", 30 )
		intelligenceBonusText = display.newText( "+0", (display.contentCenterX / .56), 450, "Centaur", 30 )
		wisdomBonusText = display.newText( "+0", (display.contentCenterX / .56), 480, "Centaur", 30 )
		charismaBonusText = display.newText( "+0", (display.contentCenterX / .56), 510, "Centaur", 30 )

		local function textListener( event )
		
			if ( event.phase == "ended") then
				-- Output resulting text from "defaultField"
				determineBonuses()
			end
		end
		charisma:addEventListener( "userInput", textListener )

		--***TODO: Need to figure out a way to get multiple lines in textbox
		-- into one data save variable***
		inspirationField = native.newTextField( display.contentCenterX / .8 , 540, 40, 28 )
		inspirationField.text = "0"
		proText = display.newText( "+2", (display.contentCenterX / .8), 570, "Centaur", 30 )
		strSaveText = display.newText( "+0", (display.contentCenterX / .8), 660, "Centaur", 30 )
		dexSaveText = display.newText( "+0", (display.contentCenterX / .8), 690, "Centaur", 30 )
		conSaveText = display.newText( "+0", (display.contentCenterX / .8), 720, "Centaur", 30 )
		intSaveText = display.newText( "+0", (display.contentCenterX / .8), 750, "Centaur", 30 )
		wisSaveText = display.newText( "+0", (display.contentCenterX / .8), 780, "Centaur", 30 )
		chaSaveText = display.newText( "+0", (display.contentCenterX / .8), 810, "Centaur", 30 )
		acroText = display.newText( "+0", (display.contentCenterX * .8), 880, "Centaur", 30 )
		animalText = display.newText( "+0", (display.contentCenterX * .8), 910, "Centaur", 30 )
		arcText = display.newText( "+0", (display.contentCenterX * .8), 940, "Centaur", 30 )
		athText = display.newText( "+0", (display.contentCenterX * .8), 970, "Centaur", 30 )
		decText = display.newText( "+0", (display.contentCenterX * .8), 1000, "Centaur", 30 )
		hisText = display.newText( "+0", (display.contentCenterX * .8), 1030, "Centaur", 30 )
		insText = display.newText( "+0", (display.contentCenterX * .8), 1060, "Centaur", 30 )
		intimText = display.newText( "+0", (display.contentCenterX * .8), 1090, "Centaur", 30 )
		investText = display.newText( "+0", (display.contentCenterX * .8), 1120, "Centaur", 30 )
		medText = display.newText( "+0", (display.contentCenterX / .575), 880, "Centaur", 30 )
		natText = display.newText( "+0", (display.contentCenterX / .575), 910, "Centaur", 30 )
		perText = display.newText( "+0", (display.contentCenterX / .575), 940, "Centaur", 30 )
		performText = display.newText( "+0", (display.contentCenterX / .575), 970, "Centaur", 30 )
		persText = display.newText( "+0", (display.contentCenterX / .575), 1000, "Centaur", 30 )
		reliText = display.newText( "+0", (display.contentCenterX / .575), 1030, "Centaur", 30 )
		sleightText = display.newText( "+0", (display.contentCenterX / .575), 1060, "Centaur", 30 )
		stealthText = display.newText( "+0", (display.contentCenterX / .575), 1090, "Centaur", 30 )
		survText = display.newText( "+0", (display.contentCenterX / .575), 1120, "Centaur", 30 )
		passiveText = display.newText("10", (display.contentCenterX / .7), 1150, "Centaur", 30 )
		ACField = native.newTextField( display.contentCenterX / 1.5 , 1210, 40, 28 )
		initText = display.newText("+0", (display.contentCenterX / .6), 1210, "Centaur", 30 )
		speedField = native.newTextField( display.contentCenterX , 1240, 60, 28 )
		HPField = native.newTextField( display.contentCenterX / 1.5 , 1300, 40, 28 )
		maxHPField = native.newTextField( display.contentCenterX / .55 , 1300, 40, 28 )
		successField1 = native.newTextField( display.contentCenterX / 1.5 , 1360, 20, 28 )
		successField2 = native.newTextField( display.contentCenterX , 1360, 20, 28 )
		successField3 = native.newTextField( display.contentCenterX * 1.35 , 1360, 20, 28 )
		failureField1 = native.newTextField( display.contentCenterX / 1.5 , 1400, 20, 28 )
		failureField2 = native.newTextField( display.contentCenterX , 1400, 20, 28 )
		failureField3 = native.newTextField( display.contentCenterX * 1.35, 1400, 20, 28 )
		proficienciesField = native.newTextBox( display.contentCenterX, 1620, display.actualContentWidth, 260 )
		proficienciesField.isEditable = true;
		proficienciesField.size = 20
		proficienciesField.placeholder = "*Do not tap Enter if you \nwant to save this box!"
		attacksField = native.newTextField( display.contentCenterX / 2, 1880, display.actualContentWidth / 2, 28 )
		attacksField2 = native.newTextField( display.contentCenterX / 2, 1910, display.actualContentWidth / 2, 28 )
		attacksField3 = native.newTextField( display.contentCenterX / 2, 1940, display.actualContentWidth / 2, 28 )
		attacksField4 = native.newTextField( display.contentCenterX / 2, 1970, display.actualContentWidth / 2, 28 )
		
		local function textListener( event )
		
			if ( event.phase == "ended") then
				-- Output resulting text from "defaultField"
				weaponsCheck()
			end
		end
		
		attacksField4:addEventListener( "userInput", textListener )

		atk1DmgText = display.newText( "1d4", (display.contentCenterX * 1.3), 1880, "Centaur", 26 )
		atk2DmgText = display.newText( "", (display.contentCenterX * 1.3), 1910, "Centaur", 26 )
		atk3DmgText = display.newText( "", (display.contentCenterX * 1.3), 1940, "Centaur", 26 )
		atk4DmgText = display.newText( "", (display.contentCenterX * 1.3), 1970, "Centaur", 26 )
		atk1BonusText = display.newText( "+0", (display.contentCenterX / .55), 1880, "Centaur", 26 )
		atk2BonusText = display.newText( "+0", (display.contentCenterX / .55), 1910, "Centaur", 26 )
		atk3BonusText = display.newText( "+0", (display.contentCenterX / .55), 1940, "Centaur", 26 )
		atk4BonusText = display.newText( "+0", (display.contentCenterX / .55), 1970, "Centaur", 26 )
		cpField = native.newTextField( display.contentCenterX * .25, 2080, 40, 28 )
		spField = native.newTextField( display.contentCenterX * .65, 2080, 40, 28 )
		epField = native.newTextField( display.contentCenterX, 2080, 40, 28 )
		gpField = native.newTextField( display.contentCenterX / .7, 2080, 40, 28 )
		ppField = native.newTextField( display.contentCenterX / .55, 2080, 40, 28 )
		equipField = native.newTextBox( display.contentCenterX, 2250, display.actualContentWidth, 200 )
		equipField.isEditable = true;
		equipField.size = 20
		equipField.placeholder = "*Do not tap Enter if you \nwant to save this box!"
		traitsField = native.newTextBox( display.contentCenterX, 2450, display.actualContentWidth, 80 )
		traitsField.isEditable = true;
		traitsField.size = 20
		traitsField.placeholder = "*Do not tap Enter if you \nwant to save this box!"
		bondsField = native.newTextBox( display.contentCenterX, 2590, display.actualContentWidth, 80 )
		bondsField.isEditable = true;
		bondsField.size = 20
		bondsField.placeholder = "*Do not tap Enter if you \nwant to save this box!"
		idealsField = native.newTextBox( display.contentCenterX, 2740, display.actualContentWidth, 80 )
		idealsField.isEditable = true;
		idealsField.size = 20
		idealsField.placeholder = "*Do not tap Enter if you \nwant to save this box!"
		flawsField = native.newTextBox( display.contentCenterX, 2890, display.actualContentWidth, 80 )
		flawsField.isEditable = true;
		flawsField.size = 20
		flawsField.placeholder = "*Do not tap Enter if you \nwant to save this box!"

		-- Code to insert text and fields so they appear on screen
		--scrollView:insert(  id )
		scrollView:insert(title)
		scrollView:insert(  idNumber )
		scrollView:insert(  randomButton )
		scrollView:insert(  backButton )
		scrollView:insert(  saveButton )
		scrollView:insert(  loadButton )
		scrollView:insert(  name )
		scrollView:insert(  race )
		scrollView:insert(  player )
		scrollView:insert(  exp )
		scrollView:insert(  class )
		scrollView:insert(  align )
		scrollView:insert(  bkd )
		scrollView:insert(  lvl )
		scrollView:insert(  nameField )
		scrollView:insert(  raceField )
		scrollView:insert(  classField )
		scrollView:insert(  lvlField )
		scrollView:insert(  alignField )
		scrollView:insert(  playerField )
		scrollView:insert(  expField )
		scrollView:insert(  bkdField )
		scrollView:insert(  title2 )
		scrollView:insert(  str )
		scrollView:insert(  dex )
		scrollView:insert(  con )
		scrollView:insert(  int )
		scrollView:insert(  wis )
		scrollView:insert(  cha )
		scrollView:insert(  strBonus )
		scrollView:insert(  dexBonus )
		scrollView:insert(  conBonus )
		scrollView:insert(  intBonus )
		scrollView:insert(  wisBonus )
		scrollView:insert(  chaBonus )
		scrollView:insert(  strengthBonusText )
		scrollView:insert(  dexterityBonusText )
		scrollView:insert(  constitutionBonusText )
		scrollView:insert(  intelligenceBonusText )
		scrollView:insert(  wisdomBonusText )
		scrollView:insert(  charismaBonusText )
		scrollView:insert(  insp )
		scrollView:insert(  pro )
		scrollView:insert(  title4 )
		scrollView:insert(  strSave )
		scrollView:insert(  dexSave )
		scrollView:insert(  conSave )
		scrollView:insert(  intSave )
		scrollView:insert(  wisSave )
		scrollView:insert(  chaSave )
		scrollView:insert(  title3 )
		scrollView:insert(  acro )
		scrollView:insert(  animal )
		scrollView:insert(  arc )
		scrollView:insert(  ath )
		scrollView:insert(  dec )
		scrollView:insert(  his )
		scrollView:insert(  ins )
		scrollView:insert(  intim )
		scrollView:insert(  invest )
		scrollView:insert(  med )
		scrollView:insert(  nat )
		scrollView:insert(  per )
		scrollView:insert(  perform )
		scrollView:insert(  pers )
		scrollView:insert(  reli )
		scrollView:insert(  sleight )
		scrollView:insert(  stealth )
		scrollView:insert(  surv )
		scrollView:insert(  strength )
		scrollView:insert(  dexterity )
		scrollView:insert(  constitution )
		scrollView:insert(  intelligence )
		scrollView:insert(  wisdom )
		scrollView:insert(  charisma )
		scrollView:insert(  proText )
		scrollView:insert(  inspirationField )
		scrollView:insert(  strSaveText )
		scrollView:insert(  dexSaveText )
		scrollView:insert(  conSaveText )
		scrollView:insert(  intSaveText )
		scrollView:insert(  wisSaveText )
		scrollView:insert(  chaSaveText )
		scrollView:insert(  acroText )
		scrollView:insert(  animalText )
		scrollView:insert(  arcText )
		scrollView:insert(  athText )
		scrollView:insert(  decText )
		scrollView:insert(  hisText )
		scrollView:insert(  insText )
		scrollView:insert(  intimText )
		scrollView:insert(  investText )
		scrollView:insert(  medText )
		scrollView:insert(  natText )
		scrollView:insert(  perText )
		scrollView:insert(  performText )
		scrollView:insert(  persText )
		scrollView:insert(  reliText )
		scrollView:insert(  sleightText )
		scrollView:insert(  stealthText )
		scrollView:insert(  survText )
		scrollView:insert(  passivePerception )
		scrollView:insert(  passiveText )
		scrollView:insert(  title5 )
		scrollView:insert(  AC )
		scrollView:insert(  init )
		scrollView:insert(  speed )
		scrollView:insert(  ACField )
		scrollView:insert(  initText )
		scrollView:insert(  speedField )
		scrollView:insert(  title6 )
		scrollView:insert(  HP )
		scrollView:insert(  maxHP )
		scrollView:insert(  death )
		scrollView:insert(  HPField )
		scrollView:insert(  maxHPField )
		scrollView:insert(  successes )
		scrollView:insert(  successField1 )
		scrollView:insert(  successField2 )
		scrollView:insert(  successField3 )
		scrollView:insert(  failureField1 )
		scrollView:insert(  failureField2 )
		scrollView:insert(  failureField3 )
		scrollView:insert(  failures )
		scrollView:insert(  clear1 )
		scrollView:insert(  clear2 )
		scrollView:insert( proficiencies)
		scrollView:insert( proficienciesField)
		scrollView:insert( attacks)
		scrollView:insert( attacksField)
		scrollView:insert( dmg)
		scrollView:insert( bonus)
		scrollView:insert( attacksField2)
		scrollView:insert( attacksField3)
		scrollView:insert( attacksField4)
		scrollView:insert( atk1DmgText)
		scrollView:insert( atk2DmgText)
		scrollView:insert( atk3DmgText)
		scrollView:insert( atk4DmgText)
		scrollView:insert( atk1BonusText)
		scrollView:insert( atk2BonusText)
		scrollView:insert( atk3BonusText)
		scrollView:insert( atk4BonusText)
		scrollView:insert( money)
		scrollView:insert( cp)
		scrollView:insert( sp)
		scrollView:insert( ep)
		scrollView:insert( gp)
		scrollView:insert( pp)
		scrollView:insert( cpField)
		scrollView:insert( spField)
		scrollView:insert( epField)
		scrollView:insert( gpField)
		scrollView:insert( ppField)
		scrollView:insert( equip)
		scrollView:insert( equipField)
		scrollView:insert( traits)
		scrollView:insert( bonds)
		scrollView:insert( ideals)
		scrollView:insert( flaws)
		scrollView:insert( traitsField)
		scrollView:insert( bondsField)
		scrollView:insert( idealsField)
		scrollView:insert( flawsField)
		scrollView:insert( ending)
		
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		-- function to make scrollView scroll
			
		--copyDatabaseTo("DB.db", system.DocumentsDirectory)
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.

	-- Code so fields persist when leaving page
	savedData = {nameData,raceData,classData,lvlData,alignData,playerData,expData,bkdData,strengthData,dexterityData,constitutionData,intelligenceData,wisdomData,charismaData,inspirationData,proData,strSaveData,dexSaveData,conSaveData,intSaveData,wisSaveData,chaSaveData,inspirationData,proData,acroData,animalData,arcData,athData,decData,hisData,insData,intimData,investData,medData,natData,perData,performData,persData,reliData,sleightData,stealthData,survData,passiveData,ACData,initData,speedData,HPData,maxHPData,successData1,successData2,successData3,failureData1,failureData2,failureData3,proficienciesData,attacksData1,attacksData2,attacksData3,attacksData4,cpData,spData,epData,gpData,ppData,equipData,traitsData,bondsData,idealsData,flawsData}
	
	-- Code to remove fields and text from screen
	scrollView:remove(  title )
	--scrollView:remove(  id )
	scrollView:remove(  idNumber )
	scrollView:remove(  randomButton )
	scrollView:remove(  backButton )
	scrollView:remove(  saveButton )
	scrollView:remove(  loadButton )
	scrollView:remove(  name )
	scrollView:remove(  race )
	scrollView:remove(  player )
	scrollView:remove(  exp )
	scrollView:remove(  class )
	scrollView:remove(  align )
	scrollView:remove(  bkd )
	scrollView:remove(  lvl )
	scrollView:remove(  nameField )
	scrollView:remove(  raceField )
	scrollView:remove(  classField )
	scrollView:remove(  lvlField )
	scrollView:remove(  alignField )
	scrollView:remove(  playerField )
	scrollView:remove(  expField )
	scrollView:remove(  bkdField )
	scrollView:remove(  title2 )
	scrollView:remove(  str )
	scrollView:remove(  dex )
	scrollView:remove(  con )
	scrollView:remove(  int )
	scrollView:remove(  wis )
	scrollView:remove(  cha )
	scrollView:remove(  strBonus )
	scrollView:remove(  dexBonus )
	scrollView:remove(  conBonus )
	scrollView:remove(  intBonus )
	scrollView:remove(  wisBonus )
	scrollView:remove(  chaBonus )
	scrollView:remove(  strengthBonusText )
	scrollView:remove(  dexterityBonusText )
	scrollView:remove(  constitutionBonusText )
	scrollView:remove(  intelligenceBonusText )
	scrollView:remove(  wisdomBonusText )
	scrollView:remove(  charismaBonusText )
	scrollView:remove(  insp )
	scrollView:remove(  pro )
	scrollView:remove(  title4 )
	scrollView:remove(  strSave )
	scrollView:remove(  dexSave )
	scrollView:remove(  conSave )
	scrollView:remove(  intSave )
	scrollView:remove(  wisSave )
	scrollView:remove(  chaSave )
	scrollView:remove(  title3 )
	scrollView:remove(  acro )
	scrollView:remove(  animal )
	scrollView:remove(  arc )
	scrollView:remove(  ath )
	scrollView:remove(  dec )
	scrollView:remove(  his )
	scrollView:remove(  ins )
	scrollView:remove(  intim )
	scrollView:remove(  invest )
	scrollView:remove(  med )
	scrollView:remove(  nat )
	scrollView:remove(  per )
	scrollView:remove(  perform )
	scrollView:remove(  pers )
	scrollView:remove(  reli )
	scrollView:remove(  sleight )
	scrollView:remove(  stealth )
	scrollView:remove(  surv )
	scrollView:remove(  strength )
	scrollView:remove(  dexterity )
	scrollView:remove(  constitution )
	scrollView:remove(  intelligence )
	scrollView:remove(  wisdom )
	scrollView:remove(  charisma )
	scrollView:remove(  proText )
	scrollView:remove(  inspirationField )
	scrollView:remove(  strSaveText )
	scrollView:remove(  dexSaveText )
	scrollView:remove(  conSaveText )
	scrollView:remove(  intSaveText )
	scrollView:remove(  wisSaveText )
	scrollView:remove(  chaSaveText )
	scrollView:remove(  acroText )
	scrollView:remove(  animalText )
	scrollView:remove(  arcText )
	scrollView:remove(  athText )
	scrollView:remove(  decText )
	scrollView:remove(  hisText )
	scrollView:remove(  insText )
	scrollView:remove(  intimText )
	scrollView:remove(  investText )
	scrollView:remove(  medText )
	scrollView:remove(  natText )
	scrollView:remove(  perText )
	scrollView:remove(  performText )
	scrollView:remove(  persText )
	scrollView:remove(  reliText )
	scrollView:remove(  sleightText )
	scrollView:remove(  stealthText )
	scrollView:remove(  survText )
	scrollView:remove(  passivePerception )
	scrollView:remove(  passiveText )
	scrollView:remove(  title5 )
	scrollView:remove(  AC )
	scrollView:remove(  init )
	scrollView:remove(  speed )
	scrollView:remove(  ACField )
	scrollView:remove(  initText )
	scrollView:remove(  speedField )
	scrollView:remove(  title6 )
	scrollView:remove(  HP )
	scrollView:remove(  maxHP )
	scrollView:remove(  death )
	scrollView:remove(  HPField )
	scrollView:remove(  maxHPField )
	scrollView:remove(  successes )
	scrollView:remove(  successField1 )
	scrollView:remove(  successField2 )
	scrollView:remove(  successField3 )
	scrollView:remove(  failureField1 )
	scrollView:remove(  failureField2 )
	scrollView:remove(  failureField3 )
	scrollView:remove(  failures )
	scrollView:remove(  clear1 )
	scrollView:remove(  clear2 )
	scrollView:remove( proficiencies)
	scrollView:remove( proficienciesField)
	scrollView:remove( attacks)
	scrollView:remove( attacksField)
	scrollView:remove( dmg)
	scrollView:remove( bonus)
	scrollView:remove( attacksField2)
	scrollView:remove( attacksField3)
	scrollView:remove( attacksField4)
	scrollView:remove( atk1DmgText)
	scrollView:remove( atk2DmgText)
	scrollView:remove( atk3DmgText)
	scrollView:remove( atk4DmgText)
	scrollView:remove( atk1BonusText)
	scrollView:remove( atk2BonusText)
	scrollView:remove( atk3BonusText)
	scrollView:remove( atk4BonusText)
	scrollView:remove( money)
	scrollView:remove( cp)
	scrollView:remove( sp)
	scrollView:remove( ep)
	scrollView:remove( gp)
	scrollView:remove( pp)
	scrollView:remove( cpField)
	scrollView:remove( spField)
	scrollView:remove( epField)
	scrollView:remove( gpField)
	scrollView:remove( ppField)
	scrollView:remove( equip)
	scrollView:remove( equipField)
	scrollView:remove( traits)
	scrollView:remove( bonds)
	scrollView:remove( ideals)
	scrollView:remove( flaws)
	scrollView:remove( traitsField)
	scrollView:remove( bondsField)
	scrollView:remove( idealsField)
	scrollView:remove( flawsField)
	scrollView:remove( ending)
	display.remove(scrollView)
	scrollView = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene