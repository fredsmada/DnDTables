-----------------------------------------------------------------------------------------
--
-- view9.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view9")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view9")
		composer.gotoScene( "openMenu")
	end

local function onRowRender( event )
   local row = event.row
   local id = row.index
 
   row.nameText = display.newText( myData9[id].name, 12, 0, "Centaur", 17 )
   row.nameText.anchorX = 0
   row.nameText.anchorY = 0.5
   row.nameText:setFillColor( 0 )
   row.nameText.y = 20
   row.nameText.x = display.contentCenterX * .05
 
   row.crText = display.newText( myData9[id].cr, 12, 0, "Centaur", 17 )
   row.crText.anchorY = 0.5
   row.crText:setFillColor( 0, 0.25, 0.25, 1 )
   row.crText.y = 20
   row.crText.x = display.contentCenterX * 1.25
 
   row.areaText = display.newText( myData9[id].area, 12, 0, "Centaur", 17 )
   row.areaText.anchorY = 0.5
   row.areaText:setFillColor( 0, 0.5, 0.25, 1 )
   row.areaText.y = 20
   row.areaText.x = display.contentCenterX * 1.75
 
   row:insert( row.nameText )
   row:insert( row.crText )
   row:insert( row.areaText )
   return true
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
		backgroundColor = { 1,1,1,1 }
		}
	)
	
	function scrollListener( event )
		local phase = event.phase
			if ( phase == "began" ) then print( "Scroll view was touched" )
			elseif ( phase == "moved" ) then print( "Scroll view was moved" )
			elseif ( phase == "ended" ) then print( "Scroll view was released" )
		end
	
		-- In the event a scroll limit is reached...
		if ( event.limitReached ) then
			if ( event.direction == "up" ) then print( "Reached bottom limit" )
			elseif ( event.direction == "down" ) then print( "Reached top limit" )
			elseif ( event.direction == "left" ) then print( "Reached right limit" )
			elseif ( event.direction == "right" ) then print( "Reached left limit" )
			end
		end
		return true
	end
	
	-- function to go to tables pop out view
		function tableMenu()
			composer.gotoScene( "openMenu")
		end

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		-- mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
		-- sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

		-- create a white background to fill screen
		background9 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background9:setFillColor( 1 )	-- white

		title9 = display.newText( "Monsters by Area", display.contentCenterX, display.contentCenterY / 5, "Centaur", 32 )
		title9:setFillColor( 0.7, 0.5, 0 )

		columnHeads25 = display.newText( "Name", display.contentCenterX * .25, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads25:setFillColor( 0 )
		columnHeads26 = display.newText( "CR", display.contentCenterX * 1.27, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads26:setFillColor( 0 )
		columnHeads27 = display.newText( "Area", display.contentCenterX * 1.75, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads27:setFillColor( 0 )

		underline9 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline9:setStrokeColor( 0 )

		local navBarHeight = 60
		local tabBarHeight = 50
		myList = widget.newTableView {
		   top = navBarHeight + 40, 
		   left = 0,
		   width = 1000, 
		   height = display.safeActualContentHeight - navBarHeight - tabBarHeight - 80,
		   onRowRender = onRowRender,
		   onRowTouch = onRowTouch,
		   listener = scrollListener
		}
		
		local options = {
			x = display.contentCenterX * 1.5,
			y = display.contentCenterY / 13,
			isEnabled = true,
			label = "Go Back",
			textOnly = true,
			labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.8 } },
			onPress = goBack
		}

		local options2 = {
			x = display.contentCenterX / 1.5,
			y = display.contentCenterY / 13,
			isEnabled = true,
			label = "More Tables",
			textOnly = true,
			labelColor = { default={ 1, 0, 1 }, over={ 0, 0, 1, 0.5 } },
			onPress = tableMenu
		}
		
		-- Buttons to manipulate list
		--tablesButton = widget.newButton(options2)
		view1backButton = widget.newButton(options)

		myData9 = {}
		myData9[1] = {name="Commoner", cr="0", area="Arctic"}
		myData9[2] = {name="Owl", cr="0", area="Arctic"}
		myData9[3] = {name="Bandit", cr="1/8", area="Arctic"}
		myData9[4] = {name="Blood Hawk", cr="1/8", area="Arctic"}
		myData9[5] = {name="Kobold", cr="1/8", area="Arctic"}
		myData9[6] = {name="Tribal Warrior", cr="1/8", area="Arctic"}
		myData9[7] = {name="Giant Owl", cr="1/4", area="Arctic"}
		myData9[8] = {name="Gnoll Witherling", cr="1/4", area="Arctic"}
		myData9[9] = {name="Winged Kobold", cr="1/4", area="Arctic"}
		myData9[10] = {name="Gnoll Hunter", cr="1/2", area="Arctic"}
		myData9[11] = {name="Ice Mephit", cr="1/2", area="Arctic"}
		myData9[12] = {name="Orc", cr="1/2", area="Arctic"}
		myData9[13] = {name="Scout", cr="1/2", area="Arctic"}
		myData9[14] = {name="Brown Bear", cr="1", area="Arctic"}
		myData9[15] = {name="Gnoll Flesh Gnawer", cr="1", area="Arctic"}
		myData9[16] = {name="Half-Ogre", cr="1", area="Arctic"}
		myData9[17] = {name="Bandit Captain", cr="2", area="Arctic"}
		myData9[18] = {name="Berserker", cr="2", area="Arctic"}
		myData9[19] = {name="Druid", cr="2", area="Arctic"}
		myData9[20] = {name="Griffon", cr="2", area="Arctic"}
		myData9[21] = {name="Guard Drake", cr="2", area="Arctic"}
		myData9[22] = {name="Ogre", cr="2", area="Arctic"}
		myData9[23] = {name="Orc Eye of Grummsh", cr="2", area="Arctic"}
		myData9[24] = {name="Orog", cr="2", area="Arctic"}
		myData9[25] = {name="Polar Bear", cr="2", area="Arctic"}
		myData9[26] = {name="Saber-toothed Tiger", cr="2", area="Arctic"}
		myData9[27] = {name="Manticore", cr="3", area="Arctic"}
		myData9[28] = {name="Vampiric Mist", cr="3", area="Arctic"}
		myData9[29] = {name="Veteran", cr="3", area="Arctic"}
		myData9[30] = {name="Winter Wolf", cr="3", area="Arctic"}
		myData9[31] = {name="Yeti", cr="3", area="Arctic"}
		myData9[32] = {name="Revenant", cr="5", area="Arctic"}
		myData9[33] = {name="Troll", cr="5", area="Arctic"}
		myData9[34] = {name="Werebear", cr="5", area="Arctic"}
		myData9[35] = {name="Young Remorhaz", cr="5", area="Arctic"}
		myData9[36] = {name="Mammoth", cr="6", area="Arctic"}
		myData9[37] = {name="Young White Dragon", cr="6", area="Arctic"}
		myData9[38] = {name="Bheur Hag", cr="7", area="Arctic"}
		myData9[39] = {name="Lost Sorrowsworn", cr="7", area="Arctic"}
		myData9[40] = {name="Frost Giant", cr="8", area="Arctic"}
		myData9[41] = {name="Shoosuva", cr="8", area="Arctic"}
		myData9[42] = {name="Abominable Yeti", cr="9", area="Arctic"}
		myData9[43] = {name="Flind", cr="9", area="Arctic"}
		myData9[44] = {name="Frost Salamander", cr="9", area="Arctic"}
		myData9[45] = {name="Winter Eladrin", cr="10", area="Arctic"}
		myData9[46] = {name="Remorhaz", cr="11", area="Arctic"}
		myData9[47] = {name="Roc", cr="11", area="Arctic"}
		myData9[48] = {name="Boneclaw", cr="12", area="Arctic"}
		myData9[49] = {name="Everlasting One", cr="12", area="Arctic"}
		myData9[50] = {name="Adult White Dragon", cr="13", area="Arctic"}
		myData9[51] = {name="Dire Troll", cr="13", area="Arctic"}
		myData9[52] = {name="Quintessent", cr="16", area="Arctic"}
		myData9[53] = {name="Ancient White Dragon", cr="20", area="Arctic"}
		myData9[54] = {name="Nightwalker", cr="20", area="Arctic"}
		myData9[55] = {name="Elder Tempest", cr="23", area="Arctic"}
		myData9[56] = {name="Crab", cr="0", area="Coastal"}
		myData9[57] = {name="Eagle", cr="0", area="Coastal"}
		myData9[58] = {name="Bandit", cr="1/8", area="Coastal"}
		myData9[59] = {name="Blood Hawk", cr="1/8", area="Coastal"}
		myData9[60] = {name="Dolphin", cr="1/8", area="Coastal"}
		myData9[61] = {name="Giant Crab", cr="1/8", area="Coastal"}
		myData9[62] = {name="Guard", cr="1/8", area="Coastal"}
		myData9[63] = {name="Kobold", cr="1/8", area="Coastal"}
		myData9[64] = {name="Merfolk", cr="1/8", area="Coastal"}
		myData9[65] = {name="Poisonous Snake", cr="1/8", area="Coastal"}
		myData9[66] = {name="Stirge", cr="1/8", area="Coastal"}
		myData9[67] = {name="Tribal Warrior", cr="1/8", area="Coastal"}
		myData9[68] = {name="Dimetrodon", cr="1/4", area="Coastal"}
		myData9[69] = {name="Giant Lizard", cr="1/4", area="Coastal"}
		myData9[70] = {name="Giant Wolf Spider", cr="1/4", area="Coastal"}
		myData9[71] = {name="Pseudodragon", cr="1/4", area="Coastal"}
		myData9[72] = {name="Pteranodon", cr="1/4", area="Coastal"}
		myData9[73] = {name="Tortle", cr="1/4", area="Coastal"}
		myData9[74] = {name="Winged Kobold", cr="1/4", area="Coastal"}
		myData9[75] = {name="Sahuagin", cr="1/2", area="Coastal"}
		myData9[76] = {name="Scout", cr="1/2", area="Coastal"}
		myData9[77] = {name="Skulk", cr="1/2", area="Coastal"}
		myData9[78] = {name="Giant Eagle", cr="1", area="Coastal"}
		myData9[79] = {name="Giant Toad", cr="1", area="Coastal"}
		myData9[80] = {name="Harpy", cr="1", area="Coastal"}
		myData9[81] = {name="Sea Spawn", cr="1", area="Coastal"}
		myData9[82] = {name="Bandit Captain", cr="2", area="Coastal"}
		myData9[83] = {name="Berserker", cr="2", area="Coastal"}
		myData9[84] = {name="Druid", cr="2", area="Coastal"}
		myData9[85] = {name="Griffon", cr="2", area="Coastal"}
		myData9[86] = {name="Merrow", cr="2", area="Coastal"}
		myData9[87] = {name="Ogre", cr="2", area="Coastal"}
		myData9[88] = {name="Plesiosaurus", cr="2", area="Coastal"}
		myData9[89] = {name="Quetzalcoatlus", cr="2", area="Coastal"}
		myData9[90] = {name="Sahuagin Priestess", cr="2", area="Coastal"}
		myData9[91] = {name="Sea Hag", cr="2", area="Coastal"}
		myData9[92] = {name="Tortle Druid", cr="2", area="Coastal"}
		myData9[93] = {name="Deep Scion", cr="3", area="Coastal"}
		myData9[94] = {name="Manticore", cr="3", area="Coastal"}
		myData9[95] = {name="Merrenoloth", cr="3", area="Coastal"}
		myData9[96] = {name="Vampiric Mist", cr="3", area="Coastal"}
		myData9[97] = {name="Veteran", cr="3", area="Coastal"}
		myData9[98] = {name="Banshee", cr="4", area="Coastal"}
		myData9[99] = {name="Sahuagin Baron", cr="5", area="Coastal"}
		myData9[100] = {name="Water Elemental", cr="5", area="Coastal"}
		myData9[101] = {name="Cyclops", cr="6", area="Coastal"}
		myData9[102] = {name="Canoloth", cr="8", area="Coastal"}
		myData9[103] = {name="Young Bronze Dragon", cr="8", area="Coastal"}
		myData9[104] = {name="Lonely Sorrowsworn", cr="9", area="Coastal"}
		myData9[105] = {name="Young Blue Dragon", cr="9", area="Coastal"}
		myData9[106] = {name="Dreamwalker", cr="10", area="Coastal"}
		myData9[107] = {name="Balhannoth", cr="11", area="Coastal"}
		myData9[108] = {name="Djinni", cr="11", area="Coastal"}
		myData9[109] = {name="Marid", cr="11", area="Coastal"}
		myData9[110] = {name="Morkoth", cr="11", area="Coastal"}
		myData9[111] = {name="Roc", cr="11", area="Coastal"}
		myData9[112] = {name="Spirit Troll", cr="11", area="Coastal"}
		myData9[113] = {name="Eidolon", cr="12", area="Coastal"}
		myData9[114] = {name="Everlasting One", cr="12", area="Coastal"}
		myData9[115] = {name="Ki-rin", cr="12", area="Coastal"}
		myData9[116] = {name="Morkoth (lair)", cr="12", area="Coastal"}
		myData9[117] = {name="Storm Giant", cr="13", area="Coastal"}
		myData9[118] = {name="Wastrilith", cr="13", area="Coastal"}
		myData9[119] = {name="Adult Bronze Dragon", cr="15", area="Coastal"}
		myData9[120] = {name="Adult Blue Dragon", cr="16", area="Coastal"}
		myData9[121] = {name="Quintessent", cr="16", area="Coastal"}
		myData9[122] = {name="Blue Abishai", cr="17", area="Coastal"}
		myData9[123] = {name="Dragon Turtle", cr="17", area="Coastal"}
		myData9[124] = {name="Nagpa", cr="17", area="Coastal"}
		myData9[125] = {name="Leviathan", cr="20", area="Coastal"}
		myData9[126] = {name="Ancient Bronze Dragon", cr="22", area="Coastal"}
		myData9[127] = {name="Ancient Blue Dragon", cr="23", area="Coastal"}
		myData9[128] = {name="Elder Tempest", cr="23", area="Coastal"}
		myData9[129] = {name="Cat", cr="0", area="Desert"}
		myData9[130] = {name="Hyena", cr="0", area="Desert"}
		myData9[131] = {name="Jackal", cr="0", area="Desert"}
		myData9[132] = {name="Scorpion", cr="0", area="Desert"}
		myData9[133] = {name="Vulture", cr="0", area="Desert"}
		myData9[134] = {name="Bandit", cr="1/8", area="Desert"}
		myData9[135] = {name="Camel", cr="1/8", area="Desert"}
		myData9[136] = {name="Flying Snake", cr="1/8", area="Desert"}
		myData9[137] = {name="Guard", cr="1/8", area="Desert"}
		myData9[138] = {name="Kobold", cr="1/8", area="Desert"}
		myData9[139] = {name="Mule", cr="1/8", area="Desert"}
		myData9[140] = {name="Poisonous Snake", cr="1/8", area="Desert"}
		myData9[141] = {name="Stirge", cr="1/8", area="Desert"}
		myData9[142] = {name="Tribal Warrior", cr="1/8", area="Desert"}
		myData9[143] = {name="Young Kruthik", cr="1/8", area="Desert"}
		myData9[144] = {name="Constrictor Snake", cr="1/4", area="Desert"}
		myData9[145] = {name="Giant Lizard", cr="1/4", area="Desert"}
		myData9[146] = {name="Giant Poisonous Snake", cr="1/4", area="Desert"}
		myData9[147] = {name="Giant Wolf Spider", cr="1/4", area="Desert"}
		myData9[148] = {name="Pseudodragon", cr="1/4", area="Desert"}
		myData9[149] = {name="Winged Kobold", cr="1/4", area="Desert"}
		myData9[150] = {name="Dust Mephit", cr="1/2", area="Desert"}
		myData9[151] = {name="Firenewt Warrior", cr="1/2", area="Desert"}
		myData9[152] = {name="Gnoll", cr="1/2", area="Desert"}
		myData9[153] = {name="Hobgoblin", cr="1/2", area="Desert"}
		myData9[154] = {name="Jackalwere", cr="1/2", area="Desert"}
		myData9[155] = {name="Scout", cr="1/2", area="Desert"}
		myData9[156] = {name="Swarm of Insects", cr="1/2", area="Desert"}
		myData9[157] = {name="Death Dog", cr="1", area="Desert"}
		myData9[158] = {name="Firenewt Warlock", cr="1", area="Desert"}
		myData9[159] = {name="Giant Hyena", cr="1", area="Desert"}
		myData9[160] = {name="Giant Spider", cr="1", area="Desert"}
		myData9[161] = {name="Giant Toad", cr="1", area="Desert"}
		myData9[162] = {name="Giant Vulture", cr="1", area="Desert"}
		myData9[163] = {name="Half-Ogre", cr="1", area="Desert"}
		myData9[164] = {name="Lion", cr="1", area="Desert"}
		myData9[165] = {name="Meazel", cr="1", area="Desert"}
		myData9[166] = {name="Stone Cursed", cr="1", area="Desert"}
		myData9[167] = {name="Thri-Kreen", cr="1", area="Desert"}
		myData9[168] = {name="Vargouille", cr="1", area="Desert"}
		myData9[169] = {name="Yuan-ti Pureblood", cr="1", area="Desert"}
		myData9[170] = {name="Adult Kruthik", cr="2", area="Desert"}
		myData9[171] = {name="Bandit Captain", cr="2", area="Desert"}
		myData9[172] = {name="Berbalang", cr="2", area="Desert"}
		myData9[173] = {name="Berserker", cr="2", area="Desert"}
		myData9[174] = {name="Druid", cr="2", area="Desert"}
		myData9[175] = {name="Giant Constrictor Snake", cr="2", area="Desert"}
		myData9[176] = {name="Gnoll Pack Lord", cr="2", area="Desert"}
		myData9[177] = {name="Guard Drake", cr="2", area="Desert"}
		myData9[178] = {name="Ogre", cr="2", area="Desert"}
		myData9[179] = {name="Yuan-ti Broodguard", cr="2", area="Desert"}
		myData9[180] = {name="Giant Scorpion", cr="3", area="Desert"}
		myData9[181] = {name="Hobgoblin Captain", cr="3", area="Desert"}
		myData9[182] = {name="Leucrotta", cr="3", area="Desert"}
		myData9[183] = {name="Mummy", cr="3", area="Desert"}
		myData9[184] = {name="Phase Spider", cr="3", area="Desert"}
		myData9[185] = {name="Wight", cr="3", area="Desert"}
		myData9[186] = {name="Yuan-ti Malison", cr="3", area="Desert"}
		myData9[187] = {name="Couatl", cr="4", area="Desert"}
		myData9[188] = {name="Dybbuk", cr="4", area="Desert"}
		myData9[189] = {name="Gnoll Fang of Yeenoghu", cr="4", area="Desert"}
		myData9[190] = {name="Lamia", cr="4", area="Desert"}
		myData9[191] = {name="Weretiger", cr="4", area="Desert"}
		myData9[192] = {name="Yuan-ti Mind Whisperer", cr="4", area="Desert"}
		myData9[193] = {name="Yuan-ti Nightmare Speaker", cr="4", area="Desert"}
		myData9[194] = {name="Air Elemental", cr="5", area="Desert"}
		myData9[195] = {name="Fire Elemental", cr="5", area="Desert"}
		myData9[196] = {name="Kruthik Hive Lord", cr="5", area="Desert"}
		myData9[197] = {name="Revenant", cr="5", area="Desert"}
		myData9[198] = {name="Spawn of Kyuss", cr="5", area="Desert"}
		myData9[199] = {name="Tlincalli", cr="5", area="Desert"}
		myData9[200] = {name="Yuan-ti Pit Master", cr="5", area="Desert"}
		myData9[201] = {name="Cyclops", cr="6", area="Desert"}
		myData9[202] = {name="Hobgoblin Warlord", cr="6", area="Desert"}
		myData9[203] = {name="Medusa", cr="6", area="Desert"}
		myData9[204] = {name="Young Brass Dragon", cr="6", area="Desert"}
		myData9[205] = {name="Lost Sorrowsworn", cr="7", area="Desert"}
		myData9[206] = {name="Yuan-ti Abomination", cr="7", area="Desert"}
		myData9[207] = {name="Howler", cr="8", area="Desert"}
		myData9[208] = {name="Lonely Sorrowsworn", cr="9", area="Desert"}
		myData9[209] = {name="Rot Troll", cr="9", area="Desert"}
		myData9[210] = {name="Young Blue Dragon", cr="9", area="Desert"}
		myData9[211] = {name="Githyanki Gish", cr="10", area="Desert"}
		myData9[212] = {name="Githzerai Enlightened", cr="10", area="Desert"}
		myData9[213] = {name="Guardian Naga", cr="10", area="Desert"}
		myData9[214] = {name="Orthon", cr="10", area="Desert"}
		myData9[215] = {name="Summer Eladrin", cr="10", area="Desert"}
		myData9[216] = {name="Efreeti", cr="11", area="Desert"}
		myData9[217] = {name="Gynosphinx", cr="11", area="Desert"}
		myData9[218] = {name="Roc", cr="11", area="Desert"}
		myData9[219] = {name="Boneclaw", cr="12", area="Desert"}
		myData9[220] = {name="Eidolon", cr="12", area="Desert"}
		myData9[221] = {name="Githyanki Kith'rak", cr="12", area="Desert"}
		myData9[222] = {name="Ki-rin", cr="12", area="Desert"}
		myData9[223] = {name="Oinoloth", cr="12", area="Desert"}
		myData9[224] = {name="Yuan-ti Anathema", cr="12", area="Desert"}
		myData9[225] = {name="Adult Brass Dragon", cr="13", area="Desert"}
		myData9[226] = {name="Githyanki Supreme Commander", cr="14", area="Desert"}
		myData9[227] = {name="Retriever", cr="14", area="Desert"}
		myData9[228] = {name="Mummy Lord", cr="15", area="Desert"}
		myData9[229] = {name="Purple Worm", cr="15", area="Desert"}
		myData9[230] = {name="Skull Lord", cr="15", area="Desert"}
		myData9[231] = {name="Adult Blue Dragon", cr="16", area="Desert"}
		myData9[232] = {name="Phoenix", cr="16", area="Desert"}
		myData9[233] = {name="Quintessent", cr="16", area="Desert"}
		myData9[234] = {name="Adult Blue Dracolich", cr="17", area="Desert"}
		myData9[235] = {name="Androsphinx", cr="17", area="Desert"}
		myData9[236] = {name="Nagpa", cr="17", area="Desert"}
		myData9[237] = {name="Ancient Brass Dragon", cr="20", area="Desert"}
		myData9[238] = {name="Nightwalker", cr="20", area="Desert"}
		myData9[239] = {name="Zaratan", cr="22", area="Desert"}
		myData9[240] = {name="Ancient Blue Dragon", cr="23", area="Desert"}
		myData9[241] = {name="Awakened Shrub", cr="0", area="Forest"}
		myData9[242] = {name="Baboon", cr="0", area="Forest"}
		myData9[243] = {name="Badger", cr="0", area="Forest"}
		myData9[244] = {name="Cat", cr="0", area="Forest"}
		myData9[245] = {name="Deer", cr="0", area="Forest"}
		myData9[246] = {name="Hyena", cr="0", area="Forest"}
		myData9[247] = {name="Owl", cr="0", area="Forest"}
		myData9[248] = {name="Bandit", cr="1/8", area="Forest"}
		myData9[249] = {name="Blood Hawk", cr="1/8", area="Forest"}
		myData9[250] = {name="Boggle", cr="1/8", area="Forest"}
		myData9[251] = {name="Flying Snake", cr="1/8", area="Forest"}
		myData9[252] = {name="Giant Rat", cr="1/8", area="Forest"}
		myData9[253] = {name="Giant Weasel", cr="1/8", area="Forest"}
		myData9[254] = {name="Guard", cr="1/8", area="Forest"}
		myData9[255] = {name="Kobold", cr="1/8", area="Forest"}
		myData9[256] = {name="Mastiff", cr="1/8", area="Forest"}
		myData9[257] = {name="Poisonous Snake", cr="1/8", area="Forest"}
		myData9[258]= {name="Stirge", cr="1/8", area="Forest"}
		myData9[259] = {name="Tribal Warrior", cr="1/8", area="Forest"}
		myData9[260] = {name="Twig Blight", cr="1/8", area="Forest"}
		myData9[261] = {name="Blink Dog", cr="1/4", area="Forest"}
		myData9[262] = {name="Boar", cr="1/4", area="Forest"}
		myData9[263] = {name="Constrictor Snake", cr="1/4", area="Forest"}
		myData9[264] = {name="Elk", cr="1/4", area="Forest"}
		myData9[265] = {name="Giant Badger", cr="1/4", area="Forest"}
		myData9[266] = {name="Giant Bat", cr="1/4", area="Forest"}
		myData9[267] = {name="Giant Frog", cr="1/4", area="Forest"}
		myData9[268] = {name="Giant Lizard", cr="1/4", area="Forest"}
		myData9[269] = {name="Giant Owl", cr="1/4", area="Forest"}
		myData9[270] = {name="Giant Poisonous Snake", cr="1/4", area="Forest"}
		myData9[271] = {name="Giant Wolf Spider", cr="1/4", area="Forest"}
		myData9[272] = {name="Gnoll Witherling", cr="1/4", area="Forest"}
		myData9[273] = {name="Goblin", cr="1/4", area="Forest"}
		myData9[274] = {name="Grung", cr="1/4", area="Forest"}
		myData9[275] = {name="Kenku", cr="1/4", area="Forest"}
		myData9[276] = {name="Kobold Inventor", cr="1/4", area="Forest"}
		myData9[277] = {name="Needle Blight", cr="1/4", area="Forest"}
		myData9[278] = {name="Panther", cr="1/4", area="Forest"}
		myData9[279] = {name="Pixie", cr="1/4", area="Forest"}
		myData9[280] = {name="Pseudodragon", cr="1/4", area="Forest"}
		myData9[281] = {name="Sprite", cr="1/4", area="Forest"}
		myData9[282] = {name="Swarm of Ravens", cr="1/4", area="Forest"}
		myData9[283] = {name="Vegepygmy", cr="1/4", area="Forest"}
		myData9[284] = {name="Velociraptor", cr="1/4", area="Forest"}
		myData9[285] = {name="Winged Kobold", cr="1/4", area="Forest"}
		myData9[286] = {name="Wolf", cr="1/4", area="Forest"}
		myData9[287] = {name="Ape", cr="1/2", area="Forest"}
		myData9[288] = {name="Black Bear", cr="1/2", area="Forest"}
		myData9[289] = {name="Darkling", cr="1/2", area="Forest"}
		myData9[290] = {name="Giant Wasp", cr="1/2", area="Forest"}
		myData9[291] = {name="Gnoll", cr="1/2", area="Forest"}
		myData9[292] = {name="Gnoll Hunter", cr="1/2", area="Forest"}
		myData9[293] = {name="Hobgoblin", cr="1/2", area="Forest"}
		myData9[294] = {name="Lizardfolk", cr="1/2", area="Forest"}
		myData9[295] = {name="Orc", cr="1/2", area="Forest"}
		myData9[296] = {name="Orc Nurtured One of Yurtrus", cr="1/2", area="Forest"}
		myData9[297] = {name="Satyr", cr="1/2", area="Forest"}
		myData9[298] = {name="Scout", cr="1/2", area="Forest"}
		myData9[299] = {name="Skulk", cr="1/2", area="Forest"}
		myData9[300] = {name="Swarm of Insects", cr="1/2", area="Forest"}
		myData9[301] = {name="Vine Blight", cr="1/2", area="Forest"}
		myData9[302] = {name="Worg", cr="1/2", area="Forest"}
		myData9[303] = {name="Bronze Scout", cr="1", area="Forest"}
		myData9[304] = {name="Brown Bear", cr="1", area="Forest"}
		myData9[305] = {name="Bugbear", cr="1", area="Forest"}
		myData9[306] = {name="Choker", cr="1", area="Forest"}
		myData9[307] = {name="Deinonychus", cr="1", area="Forest"}
		myData9[308] = {name="Dire Wolf", cr="1", area="Forest"}
		myData9[309] = {name="Dryad", cr="1", area="Forest"}
		myData9[310] = {name="Giant Hyena", cr="1", area="Forest"}
		myData9[311] = {name="Giant Spider", cr="1", area="Forest"}
		myData9[312] = {name="Giant Toad", cr="1", area="Forest"}
		myData9[313] = {name="Gnoll Flesh Gnawer", cr="1", area="Forest"}
		myData9[314] = {name="Goblin Boss", cr="1", area="Forest"}
		myData9[315] = {name="Grung Wildling", cr="1", area="Forest"}
		myData9[316] = {name="Half-Ogre", cr="1", area="Forest"}
		myData9[317] = {name="Harpy", cr="1", area="Forest"}
		myData9[318] = {name="Kobold Dragonshield", cr="1", area="Forest"}
		myData9[319] = {name="Kobold Scale Sorcerer", cr="1", area="Forest"}
		myData9[320] = {name="Meazel", cr="1", area="Forest"}
		myData9[321] = {name="Nilbog", cr="1", area="Forest"}
		myData9[322] = {name="Quickling", cr="1", area="Forest"}
		myData9[323] = {name="Thorny", cr="1", area="Forest"}
		myData9[324] = {name="Tiger", cr="1", area="Forest"}
		myData9[325] = {name="Young Faerie Dragon", cr="1", area="Forest"}
		myData9[326] = {name="Yuan-ti Pureblood", cr="1", area="Forest"}
		myData9[327] = {name="Adult Faerie Dragon", cr="2", area="Forest"}
		myData9[328] = {name="Ankheg", cr="2", area="Forest"}
		myData9[329] = {name="Awakened Tree", cr="2", area="Forest"}
		myData9[330] = {name="Bandit Captain", cr="2", area="Forest"}
		myData9[331] = {name="Berserker", cr="2", area="Forest"}
		myData9[332] = {name="Centaur", cr="2", area="Forest"}
		myData9[333] = {name="Darkling Elder", cr="2", area="Forest"}
		myData9[334] = {name="Druid", cr="2", area="Forest"}
		myData9[335] = {name="Ettercap", cr="2", area="Forest"}
		myData9[336] = {name="Giant Boar", cr="2", area="Forest"}
		myData9[337] = {name="Giant Constrictor Snake", cr="2", area="Forest"}
		myData9[338] = {name="Giant Elk", cr="2", area="Forest"}
		myData9[339] = {name="Gnoll Pack Lord", cr="2", area="Forest"}
		myData9[340] = {name="Grick", cr="2", area="Forest"}
		myData9[341] = {name="Grung Elite Warrior", cr="2", area="Forest"}
		myData9[342] = {name="Guard Drake", cr="2", area="Forest"}
		myData9[343] = {name="Hobgoblin Iron Shadow", cr="2", area="Forest"}
		myData9[344] = {name="Lizardfolk Shaman", cr="2", area="Forest"}
		myData9[345] = {name="Meenlock", cr="2", area="Forest"}
		myData9[346] = {name="Ogre", cr="2", area="Forest"}
		myData9[347] = {name="Orc Eye of Grummsh", cr="2", area="Forest"}
		myData9[348] = {name="Orc Hand of Yurtrus", cr="2", area="Forest"}
		myData9[349] = {name="Orog", cr="2", area="Forest"}
		myData9[350] = {name="Pegasus", cr="2", area="Forest"}
		myData9[351] = {name="Shadow Mastiff", cr="2", area="Forest"}
		myData9[352] = {name="Swarm of Poisonous Snakes", cr="2", area="Forest"}
		myData9[353] = {name="Vegepygmy Chief", cr="2", area="Forest"}
		myData9[354] = {name="Wererat", cr="2", area="Forest"}
		myData9[355] = {name="Will-o-wisp", cr="2", area="Forest"}
		myData9[356] = {name="Yuan-ti Broodguard", cr="2", area="Forest"}
		myData9[357] = {name="Displacer Beast", cr="3", area="Forest"}
		myData9[358] = {name="Flail Snail", cr="3", area="Forest"}
		myData9[359] = {name="Green Hag", cr="3", area="Forest"}
		myData9[360] = {name="Hobgoblin Captain", cr="3", area="Forest"}
		myData9[361] = {name="Orc Red Fang of Shargaas", cr="3", area="Forest"}
		myData9[362] = {name="Owlbear", cr="3", area="Forest"}
		myData9[363] = {name="Phase Spider", cr="3", area="Forest"}
		myData9[364] = {name="Redcap", cr="3", area="Forest"}
		myData9[365] = {name="Vampiric Mist", cr="3", area="Forest"}
		myData9[366] = {name="Veteran", cr="3", area="Forest"}
		myData9[367] = {name="Werewolf", cr="3", area="Forest"}
		myData9[368] = {name="Yuan-ti Malison", cr="3", area="Forest"}
		myData9[369] = {name="Banshee", cr="4", area="Forest"}
		myData9[370] = {name="Barghest", cr="4", area="Forest"}
		myData9[371] = {name="Couatl", cr="4", area="Forest"}
		myData9[372] = {name="Girallon", cr="4", area="Forest"}
		myData9[373] = {name="Gnoll Fang of Yeenoghu", cr="4", area="Forest"}
		myData9[374] = {name="Hobgoblin Devastator", cr="4", area="Forest"}
		myData9[375] = {name="Iron Cobra", cr="4", area="Forest"}
		myData9[376] = {name="Orc Blade of Ilneval", cr="4", area="Forest"}
		myData9[377] = {name="Stegosaurus", cr="4", area="Forest"}
		myData9[378] = {name="Stone Defender", cr="4", area="Forest"}
		myData9[379] = {name="Wereboar", cr="4", area="Forest"}
		myData9[380] = {name="Weretiger", cr="4", area="Forest"}
		myData9[381] = {name="Yeth Hound", cr="4", area="Forest"}
		myData9[382] = {name="Yuan-ti Mind Whisperer", cr="4", area="Forest"}
		myData9[383] = {name="Yuan-ti Nightmare Speaker", cr="4", area="Forest"}
		myData9[384] = {name="Brontosaurus", cr="5", area="Forest"}
		myData9[385] = {name="Gorgon", cr="5", area="Forest"}
		myData9[386] = {name="Oaken Bolter", cr="5", area="Forest"}
		myData9[387] = {name="Revenant", cr="5", area="Forest"}
		myData9[388] = {name="Shambling Mound", cr="5", area="Forest"}
		myData9[389] = {name="Troll", cr="5", area="Forest"}
		myData9[390] = {name="Unicorn", cr="5", area="Forest"}
		myData9[391] = {name="Werebear", cr="5", area="Forest"}
		myData9[392] = {name="Wood Woad", cr="5", area="Forest"}
		myData9[393] = {name="Yuan-ti Pit Master", cr="5", area="Forest"}
		myData9[394] = {name="Hobgoblin Warlord", cr="6", area="Forest"}
		myData9[395] = {name="Giant Ape", cr="7", area="Forest"}
		myData9[396] = {name="Grick Alpha", cr="7", area="Forest"}
		myData9[397] = {name="Korred", cr="7", area="Forest"}
		myData9[398] = {name="Lost Sorrowsworn", cr="7", area="Forest"}
		myData9[399] = {name="Oni", cr="7", area="Forest"}
		myData9[400] = {name="Shadow Dancer", cr="7", area="Forest"}
		myData9[401] = {name="Venom Troll", cr="7", area="Forest"}
		myData9[402]= {name="Yuan-ti Abomination", cr="7", area="Forest"}
		myData9[403] = {name="Corpse Flower", cr="8", area="Forest"}
		myData9[404] = {name="Shoosuva", cr="8", area="Forest"}
		myData9[405] = {name="Young Green Dragon", cr="8", area="Forest"}
		myData9[406] = {name="Flind", cr="9", area="Forest"}
		myData9[407] = {name="Rot Troll", cr="9", area="Forest"}
		myData9[408] = {name="Treant", cr="9", area="Forest"}
		myData9[409] = {name="Autumn Eladrin", cr="10", area="Forest"}
		myData9[410] = {name="Guardian Naga", cr="10", area="Forest"}
		myData9[411] = {name="Spring Eladrin", cr="10", area="Forest"}
		myData9[412] = {name="Summer Eladrin", cr="10", area="Forest"}
		myData9[413] = {name="Winter Eladrin", cr="10", area="Forest"}
		myData9[414] = {name="Young Gold Dragon", cr="10", area="Forest"}
		myData9[415] = {name="Hungry Sorrowsworn", cr="11", area="Forest"}
		myData9[416] = {name="Spirit Troll", cr="11", area="Forest"}
		myData9[417] = {name="Eidolon", cr="12", area="Forest"}
		myData9[418] = {name="Gray Render", cr="12", area="Forest"}
		myData9[419] = {name="Yuan-ti Anathema", cr="12", area="Forest"}
		myData9[420] = {name="Dire Troll", cr="13", area="Forest"}
		myData9[421] = {name="Retriever", cr="14", area="Forest"}
		myData9[422] = {name="Adult Green Dragon", cr="15", area="Forest"}
		myData9[423] = {name="Adult Gold Dragon", cr="17", area="Forest"}
		myData9[424] = {name="Nagpa", cr="17", area="Forest"}
		myData9[425] = {name="Ancient Green Dragon", cr="22", area="Forest"}
		myData9[426] = {name="Zaratan", cr="22", area="Forest"}
		myData9[427] = {name="Ancient Gold Dragon", cr="24", area="Forest"}
		myData9[428] = {name="Cat", cr="0", area="Grassland"}
		myData9[429] = {name="Deer", cr="0", area="Grassland"}
		myData9[430] = {name="Eagle", cr="0", area="Grassland"}
		myData9[431] = {name="Goat", cr="0", area="Grassland"}
		myData9[432] = {name="Hyena", cr="0", area="Grassland"}
		myData9[433] = {name="Jackal", cr="0", area="Grassland"}
		myData9[434] = {name="Vulture", cr="0", area="Grassland"}
		myData9[435] = {name="Blood Hawk", cr="1/8", area="Grassland"}
		myData9[436] = {name="Flying Snake", cr="1/8", area="Grassland"}
		myData9[437] = {name="Giant Weasel", cr="1/8", area="Grassland"}
		myData9[438] = {name="Guard", cr="1/8", area="Grassland"}
		myData9[439] = {name="Poisonous Snake", cr="1/8", area="Grassland"}
		myData9[440] = {name="Stirge", cr="1/8", area="Grassland"}
		myData9[441] = {name="Tribal Warrior", cr="1/8", area="Grassland"}
		myData9[442] = {name="Axe Beak", cr="1/4", area="Grassland"}
		myData9[443] = {name="Boar", cr="1/4", area="Grassland"}
		myData9[444] = {name="Elk", cr="1/4", area="Grassland"}
		myData9[445] = {name="Giant Poisonous Snake", cr="1/4", area="Grassland"}
		myData9[446] = {name="Giant Wolf Spider", cr="1/4", area="Grassland"}
		myData9[447] = {name="Gnoll Witherling", cr="1/4", area="Grassland"}
		myData9[448] = {name="Goblin", cr="1/4", area="Grassland"}
		myData9[449] = {name="Hadrosaurus", cr="1/4", area="Grassland"}
		myData9[450] = {name="Panther", cr="1/4", area="Grassland"}
		myData9[451] = {name="Pteranodon", cr="1/4", area="Grassland"}
		myData9[452] = {name="Riding Horse", cr="1/4", area="Grassland"}
		myData9[453] = {name="Rothe", cr="1/4", area="Grassland"}
		myData9[454] = {name="Velociraptor", cr="1/4", area="Grassland"}
		myData9[455] = {name="Wolf", cr="1/4", area="Grassland"}
		myData9[456] = {name="Cockatrice", cr="1/2", area="Grassland"}
		myData9[457] = {name="Giant Goat", cr="1/2", area="Grassland"}
		myData9[458] = {name="Giant Wasp", cr="1/2", area="Grassland"}
		myData9[459] = {name="Gnoll", cr="1/2", area="Grassland"}
		myData9[460] = {name="Gnoll Hunter", cr="1/2", area="Grassland"}
		myData9[461] = {name="Hobgoblin", cr="1/2", area="Grassland"}
		myData9[462] = {name="Jackalwere", cr="1/2", area="Grassland"}
		myData9[463] = {name="Orc", cr="1/2", area="Grassland"}
		myData9[464] = {name="Orc Nurtured One of Yurtrus", cr="1/2", area="Grassland"}
		myData9[465] = {name="Scout", cr="1/2", area="Grassland"}
		myData9[466] = {name="Swarm of Insects", cr="1/2", area="Grassland"}
		myData9[467] = {name="Worg", cr="1/2", area="Grassland"}
		myData9[468] = {name="Bronze Scout", cr="1", area="Grassland"}
		myData9[469] = {name="Bugbear", cr="1", area="Grassland"}
		myData9[470] = {name="Deinonychus", cr="1", area="Grassland"}
		myData9[471] = {name="Giant Eagle", cr="1", area="Grassland"}
		myData9[472] = {name="Giant Hyena", cr="1", area="Grassland"}
		myData9[473] = {name="Giant Vulture", cr="1", area="Grassland"}
		myData9[474] = {name="Gnoll Flesh Gnawer", cr="1", area="Grassland"}
		myData9[475] = {name="Goblin Boss", cr="1", area="Grassland"}
		myData9[476] = {name="Hippogriff", cr="1", area="Grassland"}
		myData9[477] = {name="Lion", cr="1", area="Grassland"}
		myData9[478] = {name="Meazel", cr="1", area="Grassland"}
		myData9[479] = {name="Scarecrow", cr="1", area="Grassland"}
		myData9[480] = {name="Thri-Kreen", cr="1", area="Grassland"}
		myData9[481] = {name="Tiger", cr="1", area="Grassland"}
		myData9[482] = {name="Allosaurus", cr="2", area="Grassland"}
		myData9[483] = {name="Ankheg", cr="2", area="Grassland"}
		myData9[484] = {name="Aurochs", cr="2", area="Grassland"}
		myData9[485] = {name="Centaur", cr="2", area="Grassland"}
		myData9[486] = {name="Druid", cr="2", area="Grassland"}
		myData9[487] = {name="Giant Boar", cr="2", area="Grassland"}
		myData9[488] = {name="Giant Elk", cr="2", area="Grassland"}
		myData9[489] = {name="Gnoll Pack Lord", cr="2", area="Grassland"}
		myData9[490] = {name="Griffon", cr="2", area="Grassland"}
		myData9[491] = {name="Hobgoblin Iron Shadow", cr="2", area="Grassland"}
		myData9[492] = {name="Ogre Bolt Launcher", cr="2", area="Grassland"}
		myData9[493] = {name="Ogre Howdah", cr="2", area="Grassland"}
		myData9[494] = {name="Orc Eye of Grummsh", cr="2", area="Grassland"}
		myData9[495] = {name="Orc Hand of Yurtrus", cr="2", area="Grassland"}
		myData9[496] = {name="Orog", cr="2", area="Grassland"}
		myData9[497] = {name="Pegasus", cr="2", area="Grassland"}
		myData9[498] = {name="Rhinoceros", cr="2", area="Grassland"}
		myData9[499] = {name="Ankylosaurus", cr="3", area="Grassland"}
		myData9[500] = {name="Hobgoblin Captain", cr="3", area="Grassland"}
		myData9[501] = {name="Leucrotta", cr="3", area="Grassland"}
		myData9[502] = {name="Manticore", cr="3", area="Grassland"}
		myData9[503] = {name="Ogre Chain Brute", cr="3", area="Grassland"}
		myData9[504] = {name="Phase Spider", cr="3", area="Grassland"}
		myData9[505] = {name="Sword Wraith Warrior", cr="3", area="Grassland"}
		myData9[506] = {name="Vampiric Mist", cr="3", area="Grassland"}
		myData9[507] = {name="Veteran", cr="3", area="Grassland"}
		myData9[508] = {name="Barghest", cr="4", area="Grassland"}
		myData9[509] = {name="Couatl", cr="4", area="Grassland"}
		myData9[510] = {name="Elephant", cr="4", area="Grassland"}
		myData9[511] = {name="Gnoll Fang of Yeenoghu", cr="4", area="Grassland"}
		myData9[512] = {name="Hobgoblin Devastator", cr="4", area="Grassland"}
		myData9[513] = {name="Iron Cobra", cr="4", area="Grassland"}
		myData9[514] = {name="Ogre Battering Ram", cr="4", area="Grassland"}
		myData9[515] = {name="Orc Blade of Ilneval", cr="4", area="Grassland"}
		myData9[516] = {name="Stegosaurus", cr="4", area="Grassland"}
		myData9[517] = {name="Stone Defender", cr="4", area="Grassland"}
		myData9[518] = {name="Wereboar", cr="4", area="Grassland"}
		myData9[519] = {name="Weretiger", cr="4", area="Grassland"}
		myData9[520] = {name="Yeth Hound", cr="4", area="Grassland"}
		myData9[521] = {name="Brontosaurus", cr="5", area="Grassland"}
		myData9[522] = {name="Bulette", cr="5", area="Grassland"}
		myData9[523] = {name="Gorgon", cr="5", area="Grassland"}
		myData9[524] = {name="Oaken Bolter", cr="5", area="Grassland"}
		myData9[525] = {name="Triceratops", cr="5", area="Grassland"}
		myData9[526] = {name="Chimera", cr="6", area="Grassland"}
		myData9[527] = {name="Cyclops", cr="6", area="Grassland"}
		myData9[528] = {name="Hobgoblin Warlord", cr="6", area="Grassland"}
		myData9[529] = {name="Mouth of Grolantor", cr="6", area="Grassland"}
		myData9[530] = {name="Howler", cr="8", area="Grassland"}
		myData9[531] = {name="Shoosuva", cr="8", area="Grassland"}
		myData9[532] = {name="Sword Wraith Commander", cr="8", area="Grassland"}
		myData9[533] = {name="Tyrannosaurus Rex", cr="8", area="Grassland"}
		myData9[534] = {name="Flind", cr="9", area="Grassland"}
		myData9[535] = {name="Spring Eladrin", cr="10", area="Grassland"}
		myData9[536] = {name="Young Gold Dragon", cr="10", area="Grassland"}
		myData9[537] = {name="Eidolon", cr="12", area="Grassland"}
		myData9[538] = {name="Ki-rin", cr="12", area="Grassland"}
		myData9[539] = {name="Cadaver Collector", cr="14", area="Grassland"}
		myData9[540] = {name="Adult Gold Dragon", cr="17", area="Grassland"}
		myData9[541] = {name="Zaratan", cr="22", area="Grassland"}
		myData9[542] = {name="Elder Tempest", cr="23", area="Grassland"}
		myData9[543] = {name="Ancient Gold Dragon", cr="24", area="Grassland"}
		myData9[544] = {name="Baboon", cr="0", area="Hill"}
		myData9[545] = {name="Eagle", cr="0", area="Hill"}
		myData9[546] = {name="Goat", cr="0", area="Hill"}
		myData9[547] = {name="Hyena", cr="0", area="Hill"}
		myData9[548] = {name="Raven", cr="0", area="Hill"}
		myData9[549] = {name="Vulture", cr="0", area="Hill"}
		myData9[550] = {name="Bandit", cr="1/8", area="Hill"}
		myData9[551] = {name="Blood Hawk", cr="1/8", area="Hill"}
		myData9[552] = {name="Boggle", cr="1/8", area="Hill"}
		myData9[553] = {name="Giant Weasel", cr="1/8", area="Hill"}
		myData9[554] = {name="Guard", cr="1/8", area="Hill"}
		myData9[555] = {name="Kobold", cr="1/8", area="Hill"}
		myData9[556] = {name="Mastiff", cr="1/8", area="Hill"}
		myData9[557] = {name="Mule", cr="1/8", area="Hill"}
		myData9[558] = {name="Neogi Hatchling", cr="1/8", area="Hill"}
		myData9[559] = {name="Poisonous Snake", cr="1/8", area="Hill"}
		myData9[560] = {name="Stirge", cr="1/8", area="Hill"}
		myData9[561] = {name="Tribal Warrior", cr="1/8", area="Hill"}
		myData9[562] = {name="Xvart", cr="1/8", area="Hill"}
		myData9[563] = {name="Axe Beak", cr="1/4", area="Hill"}
		myData9[564] = {name="Boar", cr="1/4", area="Hill"}
		myData9[565] = {name="Elk", cr="1/4", area="Hill"}
		myData9[566] = {name="Giant Owl", cr="1/4", area="Hill"}
		myData9[567] = {name="Giant Wolf Spider", cr="1/4", area="Hill"}
		myData9[568] = {name="Gnoll Witherling", cr="1/4", area="Hill"}
		myData9[569] = {name="Goblin", cr="1/4", area="Hill"}
		myData9[570] = {name="Kobold Inventor", cr="1/4", area="Hill"}
		myData9[571] = {name="Panther", cr="1/4", area="Hill"}
		myData9[572] = {name="Pseudodragon", cr="1/4", area="Hill"}
		myData9[573] = {name="Swarm of Bats", cr="1/4", area="Hill"}
		myData9[574] = {name="Swarm of Ravens", cr="1/4", area="Hill"}
		myData9[575] = {name="Winged Kobold", cr="1/4", area="Hill"}
		myData9[576] = {name="Wolf", cr="1/4", area="Hill"}
		myData9[577] = {name="Firenewt Warrior", cr="1/2", area="Hill"}
		myData9[578] = {name="Giant Goat", cr="1/2", area="Hill"}
		myData9[579] = {name="Gnoll", cr="1/2", area="Hill"}
		myData9[580] = {name="Gnoll Hunter", cr="1/2", area="Hill"}
		myData9[581] = {name="Hobgoblin", cr="1/2", area="Hill"}
		myData9[582] = {name="Orc", cr="1/2", area="Hill"}
		myData9[583] = {name="Orc Nurtured One of Yurtrus", cr="1/2", area="Hill"}
		myData9[584] = {name="Scout", cr="1/2", area="Hill"}
		myData9[585] = {name="Swarm of Insects", cr="1/2", area="Hill"}
		myData9[586] = {name="Worg", cr="1/2", area="Hill"}
		myData9[587] = {name="Bronze Scout", cr="1", area="Hill"}
		myData9[588] = {name="Brown Bear", cr="1", area="Hill"}
		myData9[589] = {name="Deinonychus", cr="1", area="Hill"}
		myData9[590] = {name="Dire Wolf", cr="1", area="Hill"}
		myData9[591] = {name="Firenewt Warlock of Imix", cr="1", area="Hill"}
		myData9[592] = {name="Giant Eagle", cr="1", area="Hill"}
		myData9[593] = {name="Giant Hyena", cr="1", area="Hill"}
		myData9[594] = {name="Giant Strider", cr="1", area="Hill"}
		myData9[595] = {name="Gnoll Flesh Gnawer", cr="1", area="Hill"}
		myData9[596] = {name="Goblin Boss", cr="1", area="Hill"}
		myData9[597] = {name="Half-Ogre", cr="1", area="Hill"}
		myData9[598] = {name="Harpy", cr="1", area="Hill"}
		myData9[599] = {name="Hippogriff", cr="1", area="Hill"}
		myData9[600] = {name="Kobold Dragonshield", cr="1", area="Hill"}
		myData9[601] = {name="Kobold Scale Sorcerer", cr="1", area="Hill"}
		myData9[602] = {name="Lion", cr="1", area="Hill"}
		myData9[603] = {name="Meazel", cr="1", area="Hill"}
		myData9[604] = {name="Nilbog", cr="1", area="Hill"}
		myData9[605] = {name="Xvart Warlock of Raxivort", cr="1", area="Hill"}
		myData9[606] = {name="Aurochs", cr="2", area="Hill"}
		myData9[607] = {name="Bandit Captain", cr="2", area="Hill"}
		myData9[608] = {name="Berserker", cr="2", area="Hill"}
		myData9[609] = {name="Druid", cr="2", area="Hill"}
		myData9[610] = {name="Giant Boar", cr="2", area="Hill"}
		myData9[611] = {name="Giant Elk", cr="2", area="Hill"}
		myData9[612] = {name="Gnoll Pack Lord", cr="2", area="Hill"}
		myData9[613] = {name="Griffon", cr="2", area="Hill"}
		myData9[614] = {name="Hobgoblin Iron Shadow", cr="2", area="Hill"}
		myData9[615] = {name="Ogre", cr="2", area="Hill"}
		myData9[616] = {name="Ogre Bolt Launcher", cr="2", area="Hill"}
		myData9[617] = {name="Ogre Howdah", cr="2", area="Hill"}
		myData9[618] = {name="Orc Eye of Grummsh", cr="2", area="Hill"}
		myData9[619] = {name="Orc Hand of Yurtrus", cr="2", area="Hill"}
		myData9[620] = {name="Orog", cr="2", area="Hill"}
		myData9[621] = {name="Pegasus", cr="2", area="Hill"}
		myData9[622] = {name="Peryton", cr="2", area="Hill"}
		myData9[623] = {name="Quetzalcoatlus", cr="2", area="Hill"}
		myData9[624] = {name="Shadow Mastiff", cr="2", area="Hill"}
		myData9[625] = {name="Green Hag", cr="3", area="Hill"}
		myData9[626] = {name="Hobgoblin Captain", cr="3", area="Hill"}
		myData9[627] = {name="Manticore", cr="3", area="Hill"}
		myData9[628] = {name="Neogi", cr="3", area="Hill"}
		myData9[629] = {name="Ogre Chain Brute", cr="3", area="Hill"}
		myData9[630] = {name="Orc Red Fang of Shargaas", cr="3", area="Hill"}
		myData9[631] = {name="Phase Spider", cr="3", area="Hill"}
		myData9[632] = {name="Redcap", cr="3", area="Hill"}
		myData9[633] = {name="Veteran", cr="3", area="Hill"}
		myData9[630] = {name="Werewolf", cr="3", area="Hill"}
		myData9[634] = {name="Barghest", cr="4", area="Hill"}
		myData9[635] = {name="Ettin", cr="4", area="Hill"}
		myData9[636] = {name="Gnoll Fang of Yeenoghu", cr="4", area="Hill"}
		myData9[637] = {name="Hobgoblin Devastator", cr="4", area="Hill"}
		myData9[638] = {name="Iron Cobra", cr="4", area="Hill"}
		myData9[639] = {name="Neogi Master", cr="4", area="Hill"}
		myData9[640] = {name="Ogre Battering Ram", cr="4", area="Hill"}
		myData9[641] = {name="Orc Blade of Ilneval", cr="4", area="Hill"}
		myData9[642] = {name="Stone Defender", cr="4", area="Hill"}
		myData9[643] = {name="Wereboar", cr="4", area="Hill"}
		myData9[644] = {name="Yeth Hound", cr="4", area="Hill"}
		myData9[645] = {name="Bulette", cr="5", area="Hill"}
		myData9[646] = {name="Gorgon", cr="5", area="Hill"}
		myData9[647] = {name="Hill Giant", cr="5", area="Hill"}
		myData9[648] = {name="Oaken Bolter", cr="5", area="Hill"}
		myData9[650] = {name="Revenant", cr="5", area="Hill"}
		myData9[651] = {name="Tanarukk", cr="5", area="Hill"}
		myData9[652] = {name="Troll", cr="5", area="Hill"}
		myData9[653] = {name="Werebear", cr="5", area="Hill"}
		myData9[654] = {name="Annis Hag", cr="6", area="Hill"}
		myData9[655] = {name="Chimera", cr="6", area="Hill"}
		myData9[656] = {name="Cyclops", cr="6", area="Hill"}
		myData9[657] = {name="Galeb Duhr", cr="6", area="Hill"}
		myData9[658] = {name="Hobgoblin Warlord", cr="6", area="Hill"}
		myData9[659] = {name="Mouth of Grolantor", cr="6", area="Hill"}
		myData9[660] = {name="Wyvern", cr="6", area="Hill"}
		myData9[661] = {name="Stone Giant", cr="7", area="Hill"}
		myData9[662] = {name="Young Copper Dragon", cr="7", area="Hill"}
		myData9[663] = {name="Howler", cr="8", area="Hill"}
		myData9[664] = {name="Shoosuva", cr="8", area="Hill"}
		myData9[665] = {name="Flind", cr="9", area="Hill"}
		myData9[666] = {name="Stone Giant Dreamwalker", cr="10", area="Hill"}
		myData9[667] = {name="Young Red Dragon", cr="10", area="Hill"}
		myData9[668] = {name="Roc", cr="11", area="Hill"}
		myData9[669] = {name="Gray Render", cr="12", area="Hill"}
		myData9[670] = {name="Dire Troll", cr="13", area="Hill"}
		myData9[671] = {name="Adult Copper Dragon", cr="14", area="Hill"}
		myData9[672] = {name="Adult Red Dragon", cr="17", area="Hill"}
		myData9[673] = {name="Ancient Copper Dragon", cr="21", area="Hill"}
		myData9[674] = {name="Zaratan", cr="22", area="Hill"}
		myData9[675] = {name="Elder Tempest", cr="23", area="Hill"}
		myData9[676] = {name="Ancient Red Dragon", cr="24", area="Hill"}
		myData9[677] = {name="Ankylosaurus", cr="3", area="Jungle"}
		myData9[678] = {name="Flail Snail", cr="3", area="Jungle"}
		myData9[679] = {name="Giant Scorpion", cr="3", area="Jungle"}
		myData9[680] = {name="Yuan-ti Malison", cr="3", area="Jungle"}
		myData9[681] = {name="Girallon", cr="4", area="Jungle"}
		myData9[682] = {name="Stegosaurus", cr="4", area="Jungle"}
		myData9[683] = {name="Wereboar", cr="4", area="Jungle"}
		myData9[684] = {name="Weretiger", cr="4", area="Jungle"}
		myData9[685] = {name="Yuan-ti Mind Whisperer", cr="4", area="Jungle"}
		myData9[686] = {name="Yuan-ti Nightmare Speaker", cr="4", area="Jungle"}
		myData9[687] = {name="Brontosaurus", cr="5", area="Jungle"}
		myData9[688] = {name="Night Hag", cr="5", area="Jungle"}
		myData9[689] = {name="Triceratops", cr="5", area="Jungle"}
		myData9[690] = {name="Troll", cr="5", area="Jungle"}
		myData9[691] = {name="Yuan-ti Pit Master", cr="5", area="Jungle"}
		myData9[692] = {name="Cyclops", cr="6", area="Jungle"}
		myData9[693] = {name="Giant Ape", cr="7", area="Jungle"}
		myData9[694] = {name="Yuan-ti Abomination", cr="7", area="Jungle"}
		myData9[695] = {name="Tyrannosaurus Rex", cr="8", area="Jungle"}
		myData9[696] = {name="Yuan-ti Anathema", cr="12", area="Jungle"}
		myData9[697] = {name="Basilisk", cr="3", area="Mountain"}
		myData9[698] = {name="Duergar Screamer", cr="22", area="Mountain"}
		myData9[699] = {name="Hell Hound", cr="22", area="Mountain"}
		myData9[700] = {name="Manticore", cr="22", area="Mountain"}
		myData9[701] = {name="Ogre Chain Brute", cr="22", area="Mountain"}
		myData9[702] = {name="Orc Red Fang of Shargaas", cr="22", area="Mountain"}
		myData9[703] = {name="Vampiric Mist", cr="22", area="Mountain"}
		myData9[704] = {name="Veteran", cr="22", area="Mountain"}
		myData9[705] = {name="Barghest", cr="22", area="Mountain"}
		myData9[706] = {name="Ettin", cr="22", area="Mountain"}
		myData9[707] = {name="Iron Cobra", cr="22", area="Mountain"}
		myData9[708] = {name="Ogre Battering Ram", cr="22", area="Mountain"}
		myData9[709] = {name="Orc Blade of Ilneval", cr="22", area="Mountain"}
		myData9[710] = {name="Stone Defender", cr="22", area="Mountain"}
		myData9[711] = {name="Air Elemental", cr="22", area="Mountain"}
		myData9[712] = {name="Bulette", cr="22", area="Mountain"}
		myData9[713] = {name="Kruthik Hive Lord", cr="22", area="Mountain"}
		myData9[714] = {name="Oaken Bolter", cr="22", area="Mountain"}
		myData9[715] = {name="Tanarukk", cr="22", area="Mountain"}
		myData9[716] = {name="Troll", cr="22", area="Mountain"}
		myData9[717] = {name="Annis Hag", cr="22", area="Mountain"}
		myData9[718] = {name="Chimera", cr="22", area="Mountain"}
		myData9[719] = {name="Cyclops", cr="22", area="Mountain"}
		myData9[720] = {name="Duergar Warlord", cr="22", area="Mountain"}
		myData9[721] = {name="Galeb Duhr", cr="22", area="Mountain"}
		myData9[722] = {name="Wyvern", cr="22", area="Mountain"}
		myData9[723] = {name="Lost Sorrowsworn", cr="22", area="Mountain"}
		myData9[724] = {name="Stone Giant", cr="22", area="Mountain"}
		myData9[725] = {name="Frost Giant", cr="22", area="Mountain"}
		myData9[726] = {name="Cloud Giant", cr="22", area="Mountain"}
		myData9[727] = {name="Fire Giant", cr="22", area="Mountain"}
		myData9[728] = {name="Lonely Sorrowsworn", cr="22", area="Mountain"}
		myData9[729] = {name="Young Silver Dragon", cr="22", area="Mountain"}
		myData9[730] = {name="Githyanki Gish", cr="22", area="Mountain"}
		myData9[731] = {name="Githzerai Enlightened", cr="22", area="Mountain"}
		myData9[732] = {name="Stone Giant Dreamwalker", cr="22", area="Mountain"}
		myData9[733] = {name="Young Red Dragon", cr="22", area="Mountain"}
		myData9[734] = {name="Balhannoth", cr="22", area="Mountain"}
		myData9[735] = {name="Cloud Giant Smiling One", cr="22", area="Mountain"}
		myData9[736] = {name="Roc", cr="22", area="Mountain"}
		myData9[737] = {name="Duergar Despot", cr="22", area="Mountain"}
		myData9[738] = {name="Eidolon", cr="22", area="Mountain"}
		myData9[739] = {name="Githyanki Kith'rak", cr="22", area="Mountain"}
		myData9[740] = {name="Ki-rin", cr="22", area="Mountain"}
		myData9[741] = {name="Dire Troll", cr="22", area="Mountain"}
		myData9[742] = {name="Star Spawn Seer", cr="22", area="Mountain"}
		myData9[743] = {name="Fire Giant Dreadnought", cr="22", area="Mountain"}
		myData9[744] = {name="Githyanki Supreme Commander", cr="22", area="Mountain"}
		myData9[745] = {name="Adult Silver Dragon", cr="22", area="Mountain"}
		myData9[746] = {name="Phoenix", cr="22", area="Mountain"}
		myData9[747] = {name="Star Spawn Larva Mage", cr="22", area="Mountain"}
		myData9[748] = {name="Storm Giant Quintessent", cr="22", area="Mountain"}
		myData9[749] = {name="Adult Red Dragon", cr="22", area="Mountain"}
		myData9[750] = {name="Red Abishai", cr="22", area="Mountain"}
		myData9[751] = {name="Zaratan", cr="22", area="Mountain"}
		myData9[752] = {name="Ancient Silver Dragon", cr="22", area="Mountain"}
		myData9[753] = {name="Elder Tempest", cr="22", area="Mountain"}
		myData9[754] = {name="Ancient Red Dragon", cr="22", area="Mountain"}
		myData9[755] = {name="Flail Snail", cr="3", area="Swamp"}
		myData9[756] = {name="Green Hag", cr="3", area="Swamp"}
		myData9[757] = {name="Redcap", cr="3", area="Swamp"}
		myData9[758] = {name="Sword Wraith Warrior", cr="3", area="Swamp"}
		myData9[759] = {name="Vampiric Mist", cr="3", area="Swamp"}
		myData9[760] = {name="Wight", cr="3", area="Swamp"}
		myData9[761] = {name="Yuan-ti Malison", cr="3", area="Swamp"}
		myData9[762] = {name="Adult Oblex", cr="5", area="Swamp"}
		myData9[763] = {name="Allip", cr="5", area="Swamp"}
		myData9[764] = {name="Catoblepas", cr="5", area="Swamp"}
		myData9[765] = {name="Giant Crocodile", cr="5", area="Swamp"}
		myData9[766] = {name="Revenant", cr="5", area="Swamp"}
		myData9[767] = {name="Shambling Mound", cr="5", area="Swamp"}
		myData9[768] = {name="Troll", cr="5", area="Swamp"}
		myData9[769] = {name="Water Elemental", cr="5", area="Swamp"}
		myData9[770] = {name="Bodak", cr="6", area="Swamp"}
		myData9[771] = {name="Lost Sorrowsworn", cr="7", area="Swamp"}
		myData9[772] = {name="Maurezhi", cr="7", area="Swamp"}
		myData9[773] = {name="Venom Troll", cr="7", area="Swamp"}
		myData9[774] = {name="Young Black Dragon", cr="7", area="Swamp"}
		myData9[775] = {name="Yuan-ti Abomination", cr="7", area="Swamp"}
		myData9[776] = {name="Corpse Flower", cr="8", area="Swamp"}
		myData9[777] = {name="Hydra", cr="8", area="Swamp"}
		myData9[778] = {name="Sword Wraith Commander", cr="8", area="Swamp"}
		myData9[779] = {name="Rot Troll", cr="9", area="Swamp"}
		myData9[780] = {name="Elder Oblex", cr="10", area="Swamp"}
		myData9[781] = {name="Froghemoth", cr="10", area="Swamp"}
		myData9[782] = {name="Spirit Troll", cr="11", area="Swamp"}
		myData9[783] = {name="Star Spawn Seer", cr="13", area="Swamp"}
		myData9[784] = {name="Wastrilith", cr="13", area="Swamp"}
		myData9[785] = {name="Adult Black Dragon", cr="14", area="Swamp"}
		myData9[786] = {name="Nabassu", cr="15", area="Swamp"}
		myData9[787] = {name="Skull Lord", cr="15", area="Swamp"}
		myData9[788] = {name="Nagpa", cr="17", area="Swamp"}
		myData9[789] = {name="Night Walker", cr="20", area="Swamp"}
		myData9[790] = {name="Ancient Black Dragon", cr="21", area="Swamp"}
		myData9[791] = {name="Cave Fisher", cr="3", area="Underdark"}
		myData9[792] = {name="Choldrith", cr="3", area="Underdark"}
		myData9[793] = {name="Derro Savant", cr="3", area="Underdark"}
		myData9[794] = {name="Doppleganger", cr="3", area="Underdark"}
		myData9[795] = {name="Duergar Screamer", cr="3", area="Underdark"}
		myData9[796] = {name="Flail Snail", cr="3", area="Underdark"}
		myData9[797] = {name="Grell", cr="3", area="Underdark"}
		myData9[798] = {name="Hell Hound", cr="3", area="Underdark"}
		myData9[799] = {name="Hobgoblin Captain", cr="3", area="Underdark"}
		myData9[800] = {name="Hook Horror", cr="3", area="Underdark"}
		myData9[801] = {name="Minotaur", cr="3", area="Underdark"}
		myData9[802] = {name="Neogi", cr="3", area="Underdark"}
		myData9[803] = {name="Orc Red Fang of Shargaas", cr="3", area="Underdark"}
		myData9[804] = {name="Phase Spider", cr="3", area="Underdark"}
		myData9[805] = {name="Quaggoth Thonot", cr="3", area="Underdark"}
		myData9[806] = {name="Slithering Tracker", cr="3", area="Underdark"}
		myData9[807] = {name="Spectator", cr="3", area="Underdark"}
		myData9[808] = {name="Trapper", cr="3", area="Underdark"}
		myData9[809] = {name="Vampiric Mist", cr="3", area="Underdark"}
		myData9[810] = {name="Veteran", cr="3", area="Underdark"}
		myData9[811] = {name="Water Weird", cr="3", area="Underdark"}
		myData9[812] = {name="Wight", cr="3", area="Underdark"}
		myData9[813] = {name="Babau", cr="4", area="Underdark"}
		myData9[814] = {name="Barghest", cr="4", area="Underdark"}
		myData9[815] = {name="Black Pudding", cr="4", area="Underdark"}
		myData9[816] = {name="Bone Naga", cr="4", area="Underdark"}
		myData9[817] = {name="Chuul", cr="4", area="Underdark"}
		myData9[818] = {name="Ettin", cr="4", area="Underdark"}
		myData9[819] = {name="Flameskull", cr="4", area="Underdark"}
		myData9[820] = {name="Ghost", cr="4", area="Underdark"}
		myData9[821] = {name="Neogi Master", cr="4", area="Underdark"}
		myData9[822] = {name="Orc Blade of Ilneval", cr="4", area="Underdark"}
		myData9[823] = {name="Yuan-ti Mind Whisperer", cr="4", area="Underdark"}
		myData9[824] = {name="Yuan-ti Nightmare Speaker", cr="4", area="Underdark"}
		myData9[825] = {name="Adult Obex", cr="5", area="Underdark"}
		myData9[826] = {name="Beholder Zombie", cr="5", area="Underdark"}
		myData9[827] = {name="Drow Elite Warrior", cr="5", area="Underdark"}
		myData9[828] = {name="Earth Elemental", cr="5", area="Underdark"}
		myData9[829] = {name="Kruthik Hive Lord", cr="5", area="Underdark"}
		myData9[830] = {name="Mindwitness", cr="5", area="Underdark"}
		myData9[831] = {name="Otyugh", cr="5", area="Underdark"}
		myData9[832] = {name="Roper", cr="5", area="Underdark"}
		myData9[833] = {name="Salamander", cr="5", area="Underdark"}
		myData9[834] = {name="Spawn of Kyuss", cr="5", area="Underdark"}
		myData9[835] = {name="Swarm of Cranium Rats", cr="5", area="Underdark"}
		myData9[836] = {name="Tanarukk", cr="5", area="Underdark"}
		myData9[837] = {name="Troll", cr="5", area="Underdark"}
		myData9[838] = {name="Umber Hulk", cr="5", area="Underdark"}
		myData9[839] = {name="Vampire Spawn", cr="5", area="Underdark"}
		myData9[840] = {name="Wraith", cr="5", area="Underdark"}
		myData9[841] = {name="Xorn", cr="5", area="Underdark"}
		myData9[842] = {name="Yuan-ti Pit Master", cr="5", area="Underdark"}
		myData9[843] = {name="Bodak", cr="6", area="Underdark"}
		myData9[844] = {name="Chimera", cr="6", area="Underdark"}
		myData9[845] = {name="Cyclops", cr="6", area="Underdark"}
		myData9[846] = {name="Drider", cr="6", area="Underdark"}
		myData9[847] = {name="Duergar Warlord", cr="6", area="Underdark"}
		myData9[848] = {name="Gauth", cr="6", area="Underdark"}
		myData9[849] = {name="Hobgoblin Warlord", cr="6", area="Underdark"}
		myData9[850] = {name="Kuo-toa Archpriest", cr="6", area="Underdark"}
		myData9[851] = {name="Armanite", cr="7", area="Underdark"}
		myData9[852] = {name="Dhergoloth", cr="7", area="Underdark"}
		myData9[853] = {name="Draegloth", cr="7", area="Underdark"}
		myData9[854] = {name="Drow Mage", cr="7", area="Underdark"}
		myData9[855] = {name="Grick Alpha", cr="7", area="Underdark"}
		myData9[856] = {name="Lost Sorrowsworn", cr="7", area="Underdark"}
		myData9[857] = {name="Mind Flayer", cr="7", area="Underdark"}
		myData9[858] = {name="Shadow Dancer", cr="7", area="Underdark"}
		myData9[859] = {name="Stone Giant", cr="7", area="Underdark"}
		myData9[860] = {name="Venom Troll", cr="7", area="Underdark"}
		myData9[861] = {name="Canoloth", cr="8", area="Underdark"}
		myData9[862] = {name="Cloaker", cr="8", area="Underdark"}
		myData9[863] = {name="Fomorian", cr="8", area="Underdark"}
		myData9[864] = {name="Howler", cr="8", area="Underdark"}
		myData9[865] = {name="Mind Flayer Arcanist", cr="8", area="Underdark"}
		myData9[866] = {name="Spirit Naga", cr="8", area="Underdark"}
		myData9[867] = {name="Drow House Captain", cr="9", area="Underdark"}
		myData9[868] = {name="Fire Giant", cr="9", area="Underdark"}
		myData9[869] = {name="Gloom Weaver", cr="9", area="Underdark"}
		myData9[870] = {name="Lonely Sorrowsworn", cr="9", area="Underdark"}
		myData9[871] = {name="Rot Troll", cr="9", area="Underdark"}
		myData9[872] = {name="Ulitharid", cr="9", area="Underdark"}
		myData9[873] = {name="Aboleth", cr="10", area="Underdark"}
		myData9[874] = {name="Alhoon", cr="10", area="Underdark"}
		myData9[875] = {name="Death Kiss", cr="10", area="Underdark"}
		myData9[876] = {name="Elder Oblex", cr="10", area="Underdark"}
		myData9[877] = {name="Froghemoth", cr="10", area="Underdark"}
		myData9[878] = {name="Orthon", cr="10", area="Underdark"}
		myData9[879] = {name="Alkilith", cr="11", area="Underdark"}
		myData9[880] = {name="Balhannoth", cr="11", area="Underdark"}
		myData9[881] = {name="Behir", cr="11", area="Underdark"}
		myData9[882] = {name="Dao", cr="11", area="Underdark"}
		myData9[883] = {name="Drow Shadowblade", cr="11", area="Underdark"}
		myData9[884] = {name="Hungry Sorrowsworn", cr="11", area="Underdark"}
		myData9[885] = {name="Soul Monger", cr="11", area="Underdark"}
		myData9[886] = {name="Spirit Troll", cr="11", area="Underdark"}
		myData9[887] = {name="Duergar Despot", cr="12", area="Underdark"}
		myData9[888] = {name="Oinoloth", cr="12", area="Underdark"}
		myData9[889] = {name="Yuan-ti Anathema", cr="12", area="Underdark"}
		myData9[890] = {name="Angry Sorrowsworn", cr="13", area="Underdark"}
		myData9[891] = {name="Beholder", cr="13", area="Underdark"}
		myData9[892] = {name="Devourer", cr="13", area="Underdark"}
		myData9[893] = {name="Dire Troll", cr="13", area="Underdark"}
		myData9[894] = {name="Drow Arachnomancer", cr="13", area="Underdark"}
		myData9[895] = {name="Neothelid", cr="13", area="Underdark"}
		myData9[896] = {name="Wastrilith", cr="13", area="Underdark"}
		myData9[897] = {name="Young Red Shadow Dragon", cr="13", area="Underdark"}
		myData9[898] = {name="Death Tyrant", cr="14", area="Underdark"}
		myData9[899] = {name="Drow Inquisitor", cr="14", area="Underdark"}
		myData9[900] = {name="Elder Brain", cr="14", area="Underdark"}
		myData9[901] = {name="Fire Giant Dreadnought", cr="14", area="Underdark"}
		myData9[902] = {name="Retriever", cr="14", area="Underdark"}
		myData9[903] = {name="Nabassu", cr="15", area="Underdark"}
		myData9[904] = {name="Purple Worm", cr="15", area="Underdark"}
		myData9[905] = {name="Skull Lord", cr="15", area="Underdark"}
		myData9[906] = {name="Nagpa", cr="17", area="Underdark"}
		myData9[907] = {name="Drow Favored Consort", cr="18", area="Underdark"}
		myData9[908] = {name="Sibriex", cr="18", area="Underdark"}
		myData9[909] = {name="Drow Matron Mother", cr="20", area="Underdark"}
		myData9[910] = {name="Nightwalker", cr="20", area="Underdark"}
		myData9[911] = {name="Mind Flayer Lich", cr="22", area="Underdark"}
		myData9[912] = {name="Zaratan", cr="22", area="Underdark"}
		myData9[913] = {name="Deep Scion", cr="3", area="Underwater"}
		myData9[914] = {name="Killer Whale", cr="3", area="Underwater"}
		myData9[915] = {name="Giant Shark", cr="5", area="Underwater"}
		myData9[916] = {name="Sahuagin Baron", cr="5", area="Underwater"}
		myData9[917] = {name="Water Elemental", cr="5", area="Underwater"}
		myData9[918] = {name="Marid", cr="11", area="Underwater"}
		myData9[919] = {name="Morkoth", cr="11", area="Underwater"}
		myData9[920] = {name="Morkoth (in lair)", cr="12", area="Underwater"}
		myData9[921] = {name="Wastrilith", cr="13", area="Underwater"}
		myData9[922] = {name="Storm Giant Quintessent", cr="16", area="Underwater"}
		myData9[923] = {name="Dragon Turtle", cr="17", area="Underwater"}
		myData9[924] = {name="Leviathan", cr="20", area="Underwater"}
		myData9[925] = {name="Kraken", cr="23", area="Underwater"}
		myData9[926] = {name="Doppleganger", cr="3", area="Urban"}
		myData9[927] = {name="Giff", cr="3", area="Urban"}
		myData9[928] = {name="Knight", cr="3", area="Urban"}
		myData9[929] = {name="Orc Red Fang of Shargaas", cr="3", area="Urban"}
		myData9[930] = {name="Phase Spider", cr="3", area="Urban"}
		myData9[931] = {name="Slithering Tracker", cr="3", area="Urban"}
		myData9[932] = {name="Vampiric Mist", cr="3", area="Urban"}
		myData9[933] = {name="Veteran", cr="3", area="Urban"}
		myData9[934] = {name="Water Weird", cr="3", area="Urban"}
		myData9[935] = {name="Wight", cr="3", area="Urban"}
		myData9[936] = {name="Babau", cr="4", area="Urban"}
		myData9[937] = {name="Couatl", cr="4", area="Urban"}
		myData9[938] = {name="Deathlock", cr="4", area="Urban"}
		myData9[939] = {name="Dybbuk", cr="4", area="Urban"}
		myData9[940] = {name="Ghost", cr="4", area="Urban"}
		myData9[941] = {name="Incubus", cr="4", area="Urban"}
		myData9[942] = {name="Succubus", cr="4", area="Urban"}
		myData9[943] = {name="Adult Oblex", cr="5", area="Urban"}
		myData9[944] = {name="Allip", cr="5", area="Urban"}
		myData9[945] = {name="Banderhobb", cr="5", area="Urban"}
		myData9[946] = {name="Cambion", cr="5", area="Urban"}
		myData9[947] = {name="Gladiator", cr="5", area="Urban"}
		myData9[948] = {name="Revenant", cr="5", area="Urban"}
		myData9[949] = {name="Swarm of Cranium Rats", cr="5", area="Urban"}
		myData9[950] = {name="Vampire Spawn", cr="5", area="Urban"}
		myData9[951] = {name="Bodak", cr="6", area="Urban"}
		myData9[952] = {name="Invisible Stalker", cr="6", area="Urban"}
		myData9[953] = {name="Mage", cr="6", area="Urban"}
		myData9[954] = {name="White Abishai", cr="6", area="Urban"}
		myData9[955] = {name="Black Abishai", cr="7", area="Urban"}
		myData9[956] = {name="Lost Sorrowsworn", cr="7", area="Urban"}
		myData9[957] = {name="Maurezhi", cr="7", area="Urban"}
		myData9[958] = {name="Oni", cr="7", area="Urban"}
		myData9[959] = {name="Shadow Dancer", cr="7", area="Urban"}
		myData9[960] = {name="Shield Guardian", cr="7", area="Urban"}
		myData9[961] = {name="Assassin", cr="8", area="Urban"}
		myData9[962] = {name="Canoloth", cr="8", area="Urban"}
		myData9[963] = {name="Corpse Flower", cr="8", area="Urban"}
		myData9[964] = {name="Deathlock Mastermind", cr="8", area="Urban"}
		myData9[965] = {name="Gloom Weaver", cr="9", area="Urban"}
		myData9[966] = {name="Gray Slaad", cr="9", area="Urban"}
		myData9[967] = {name="Lonely Sorrowsworn", cr="9", area="Urban"}
		myData9[968] = {name="Young Silver Dragon", cr="9", area="Urban"}
		myData9[969] = {name="Elder Oblex", cr="10", area="Urban"}
		myData9[970] = {name="Githyanki Gish", cr="10", area="Urban"}
		myData9[971] = {name="Githzerai Enlightened", cr="10", area="Urban"}
		myData9[972] = {name="Orthon", cr="10", area="Urban"}
		myData9[973] = {name="Alkilith", cr="11", area="Urban"}
		myData9[974] = {name="Hungry Sorrowsworn", cr="11", area="Urban"}
		myData9[975] = {name="Soul Monger", cr="11", area="Urban"}
		myData9[976] = {name="Yagnoloth", cr="11", area="Urban"}
		myData9[977] = {name="Archmage", cr="12", area="Urban"}
		myData9[978] = {name="Boneclaw", cr="12", area="Urban"}
		myData9[979] = {name="Eidolon", cr="12", area="Urban"}
		myData9[980] = {name="Githyanki Kith'rak", cr="12", area="Urban"}
		myData9[981] = {name="Angry Sorrowsworn", cr="13", area="Urban"}
		myData9[982] = {name="Rakshasa", cr="13", area="Urban"}
		myData9[983] = {name="Star Spawn Seer", cr="13", area="Urban"}
		myData9[984] = {name="Vampire", cr="13", area="Urban"}
		myData9[985] = {name="Githyanki Supreme Commander", cr="14", area="Urban"}
		myData9[986] = {name="Green Abishai", cr="15", area="Urban"}
		myData9[987] = {name="Nabassu", cr="15", area="Urban"}
		myData9[988] = {name="Vampire (spellcaster)", cr="15", area="Urban"}
		myData9[989] = {name="Vampire (warrior)", cr="15", area="Urban"}
		myData9[990] = {name="Adult Silver Dragon", cr="16", area="Urban"}
		myData9[991] = {name="Steel Predator", cr="16", area="Urban"}
		myData9[992] = {name="Blue Abishai", cr="17", area="Urban"}
		myData9[993] = {name="Nagpa", cr="17", area="Urban"}
		myData9[994] = {name="Red Abishai", cr="19", area="Urban"}
		myData9[995] = {name="Ancient Silver Dragon", cr="23", area="Urban"}
		myData9[996] = {name="Tarrasque", cr="30", area="Urban"}

		for i = 1, #myData9 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background9 )
		scrollView:insert( title9 )
		scrollView:insert( underline9 )
		scrollView:insert( myList )
		scrollView:insert( columnHeads25 )
		scrollView:insert( columnHeads26 )
		scrollView:insert( columnHeads27 )
		scrollView:insert(view1backButton)

	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
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
		columnHeads25:removeSelf()
		columnHeads26:removeSelf()
		columnHeads27:removeSelf()
		view1backButton:removeSelf()
		scrollView:insert( background9 )
		scrollView:insert( title9 )
		scrollView:insert( underline9 )
		scrollView:insert( myList )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene