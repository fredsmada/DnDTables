-----------------------------------------------------------------------------------------
--
-- view10.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view10")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view10")
		composer.gotoScene( "openMenu")
	end

	local function onRowRender( event )
		local row = event.row
		local id = row.index
		print(myData10[id])
	  
		row.nameText = display.newText( myData10[id], 12, 0, "Centaur", 17 )
		row.nameText.anchorX = 0
		row.nameText.anchorY = 0.5
		row.nameText:setFillColor( 0 )
		row.nameText.y = 20
		row.nameText.x = display.contentCenterX / 2
	  
		row:insert( row.nameText )
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
		background8 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background8:setFillColor( 1 )	-- white

		title8 = display.newText( "Monsters by Challenge Rating", display.contentCenterX, display.contentCenterY / 5, "Centaur", 32 )
		title8:setFillColor( 0.7, 0.5, 0 )

		underline8 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline8:setStrokeColor( 0 )

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

		myData10 = {}
		myData10[1] = "Challenge 0 (10 XP)"
		myData10[2] = "Awakened shrub"
		myData10[3] = "Baboon"
		myData10[4] = "Badger"
		myData10[5] = "Bat"
		myData10[6] = "Cat"
		myData10[7] = "Commoner"
		myData10[8] = "Crab"
		myData10[9] = "Crawling claw"
		myData10[10] = "Deer"
		myData10[11] = "Eagle"
		myData10[12] = "Frog"
		myData10[13] = "Giant fire beetle"
		myData10[14] = "Goat"
		myData10[15] = "Hawk"
		myData10[16] = "Homunculus"
		myData10[17] = "Hyena"
		myData10[18] = "Jackal"
		myData10[19] = "Lemure"
		myData10[20] = "Lizard"
		myData10[21] = "Myconid sprout"
		myData10[22] = "Octopus"
		myData10[23] = "Owl"
		myData10[24] = "Quipper"
		myData10[25] = "Rat"
		myData10[26] = "Raven"
		myData10[27] = "Scorpion"
		myData10[28] = "Sea horse"
		myData10[29] = "Shrieker"
		myData10[30] = "Spider"
		myData10[31] = "Vulture"
		myData10[32] = "Weasel"
		myData10[33] = "Challenge 1/8 (25 XP)"
		myData10[34] = "Bandit"
		myData10[35] = "Blood hawk"
		myData10[36] = "Camel"
		myData10[37] = "Cultist"
		myData10[38] = "Flumph"
		myData10[39] = "Flying snake"
		myData10[40] = "Giant crab"
		myData10[41] = "Giant rat"
		myData10[42] = "Giant weasel"
		myData10[43] = "Guard"
		myData10[44] = "Kobold"
		myData10[45] = "Manes"
		myData10[46] = "Mastiff"
		myData10[47] = "Merfolk"
		myData10[48] = "Monodrone"
		myData10[49] = "Mule"
		myData10[50] = "Noble"
		myData10[51] = "Poisonous snake"
		myData10[52] = "Pony"
		myData10[53] = "Slaad tadpole"
		myData10[54] = "Stirge"
		myData10[55] = "Tribal warrior"
		myData10[56] = "Twig blight"
		myData10[57] = "Challenge 1/4 (50 XP)"
		myData10[58] = "Aarakocra"
		myData10[59] = "Acolyte"
		myData10[60] = "Axe beak"
		myData10[61] = "Blink dog"
		myData10[62] = "Boar"
		myData10[63] = "Bullywug"
		myData10[64] = "Constrictor snake"
		myData10[65] = "Draft horse"
		myData10[66] = "Dretch"
		myData10[67] = "Drow"
		myData10[68] = "Duodrone"
		myData10[69] = "Elk"
		myData10[70] = "Flying sword"
		myData10[71] = "Giant badger"
		myData10[72] = "Giant bat"
		myData10[73] = "Giant centipede"
		myData10[74] = "Giant frog"
		myData10[75] = "Giant lizard"
		myData10[76] = "Giant owl"
		myData10[77] = "Giant poisonous snake"
		myData10[78] = "Giant wolf spider"
		myData10[79] = "Goblin"
		myData10[80] = "Grimlock"
		myData10[81] = "Kenku"
		myData10[82] = "Kuo-toa"
		myData10[83] = "Mud mephit"
		myData10[84] = "Needle blight"
		myData10[85] = "Panther"
		myData10[86] = "Pixie"
		myData10[87] = "Pseudodragon"
		myData10[88] = "Pteranodon"
		myData10[89] = "Riding horse"
		myData10[90] = "Skeleton"
		myData10[91] = "Smoke mephit"
		myData10[92] = "Sprite"
		myData10[93] = "Steam mephit"
		myData10[94] = "Swarm of bats"
		myData10[95] = "Swarm of rats"
		myData10[96] = "Swarm of ravens"
		myData10[97] = "Troglodyte"
		myData10[98] = "Violet fungus"
		myData10[99] = "Winged kobold"
		myData10[100] = "Wolf"
		myData10[101] = "Zombie"
		myData10[102] = "Challenge 1/2 (100 XP)"
		myData10[103] = "Ape"
		myData10[104] = "Black bear"
		myData10[105] = "Cockatrice"
		myData10[106] = "Crocodile"
		myData10[107] = "Darkmantle"
		myData10[108] = "Deep gnome"
		myData10[109] = "Dust mephit"
		myData10[110] = "Gas spore"
		myData10[111] = "Giant goat"
		myData10[112] = "Giant sea horse"
		myData10[113] = "Giant wasp"
		myData10[114] = "Gnoll"
		myData10[115] = "Gray ooze"
		myData10[116] = "Hobgoblin"
		myData10[117] = "Ice mephit"
		myData10[118] = "Jackalwere"
		myData10[119] = "Lizardfolk"
		myData10[120] = "Magma mephit"
		myData10[121] = "Magmin"
		myData10[122] = "Myconid adult"
		myData10[123] = "Orc"
		myData10[124] = "Piercer"
		myData10[125] = "Reef shark"
		myData10[126] = "Rust monster"
		myData10[127] = "Sahuagin"
		myData10[128] = "Satyr"
		myData10[129] = "Scout"
		myData10[130] = "Shadow"
		myData10[131] = "Swarm of insects"
		myData10[132] = "Thug"
		myData10[133] = "Tridrone"
		myData10[134] = "Vine blight"
		myData10[135] = "Warhorse"
		myData10[136] = "Warhorse skeleton"
		myData10[137] = "Worg"
		myData10[138] = "Challenge 1 (200 XP)"
		myData10[139] = "Animated armor"
		myData10[140] = "Brass dragon wyrmling"
		myData10[141] = "Brown bear"
		myData10[142] = "Bugbear"
		myData10[143] = "Copper dragon wyrmling"
		myData10[144] = "Death dog"
		myData10[145] = "Dire wolf"
		myData10[146] = "Dryad"
		myData10[147] = "Duergar"
		myData10[148] = "Faerie dragon (young)"
		myData10[149] = "Fire snake"
		myData10[150] = "Ghoul"
		myData10[151] = "Giant eagle"
		myData10[152] = "Giant hyena"
		myData10[153] = "Giant octopus"
		myData10[154] = "Giant spider"
		myData10[155] = "Giant toad"
		myData10[156] = "Giant vulture"
		myData10[157] = "Goblin boss"
		myData10[158] = "Half-ogre"
		myData10[159] = "Harpy"
		myData10[160] = "Hippogriff"
		myData10[161] = "Imp"
		myData10[162] = "Kuo-toa whip"
		myData10[163] = "Lion"
		myData10[164] = "Quadrone"
		myData10[165] = "Quaggoth spore servant"
		myData10[166] = "Quasit"
		myData10[167] = "Scarecrow"
		myData10[168] = "Specter"
		myData10[169] = "Spy"
		myData10[170] = "Swarm of quippers"
		myData10[171] = "Thri-kreen"
		myData10[172] = "Tiger"
		myData10[173] = "Yuan-ti pureblood"
		myData10[174] = "Challenge 2 (450 XP)"
		myData10[175] = "Allosaurus"
		myData10[176] = "Ankheg"
		myData10[177] = "Awakened tree"
		myData10[178] = "Azer"
		myData10[179] = "Bandit captain"
		myData10[180] = "Berserker"
		myData10[181] = "Black dragon wyrmling"
		myData10[182] = "Bronze dragon wyrmling"
		myData10[183] = "Carrion crawler"
		myData10[184] = "Centaur"
		myData10[185] = "Cult fanatic"
		myData10[186] = "Druid"
		myData10[187] = "Ettercap"
		myData10[188] = "Faerie dragon (old)"
		myData10[189] = "Gargoyle"
		myData10[190] = "Gelatinous cube"
		myData10[191] = "Ghast"
		myData10[192] = "Giant boar"
		myData10[193] = "Giant constrictor snake"
		myData10[194] = "Giant elk"
		myData10[195] = "Gibbering mouther"
		myData10[196] = "Githzerai monk"
		myData10[197] = "Gnoll pack lord"
		myData10[198] = "Green dragon wyrmling"
		myData10[199] = "Grick"
		myData10[200] = "Griffon"
		myData10[201] = "Hunter shark"
		myData10[202] = "Intellect devourer"
		myData10[203] = "Lizardfolk shaman"
		myData10[204] = "Merrow"
		myData10[205] = "Mimic"
		myData10[206] = "Minotaur skeleton"
		myData10[207] = "Myconid sovereign"
		myData10[208] = "Nothic"
		myData10[209] = "Ochre jelly"
		myData10[210] = "Ogre"
		myData10[211] = "Ogre zombie"
		myData10[212] = "Orc Eye of Gruumsh"
		myData10[213] = "Orog"
		myData10[214] = "Pegasus"
		myData10[215] = "Pentadrone"
		myData10[216] = "Peryton"
		myData10[217] = "Plesiosaurus"
		myData10[218] = "Polar bear"
		myData10[219] = "Poltergeist (specter)"
		myData10[220] = "Priest"
		myData10[221] = "Quaggoth"
		myData10[222] = "Rhinoceros"
		myData10[223] = "Rug of smothering"
		myData10[224] = "Saber-toothed tiger"
		myData10[225] = "Sahuagin priestess"
		myData10[226] = "Sea hag"
		myData10[227] = "Silver dragon wyrmling"
		myData10[228] = "Spined devil"
		myData10[229] = "Swarm of poisonous snakes"
		myData10[230] = "Wererat"
		myData10[231] = "White dragon wyrmling"
		myData10[232] = "Will-o’-wisp"
		myData10[233] = "Challenge 3 (700 XP)"
		myData10[234] = "Ankylosaurus"
		myData10[235] = "Basilisk"
		myData10[236] = "Bearded devil"
		myData10[237] = "Blue dragon wyrmling"
		myData10[238] = "Bugbear chief"
		myData10[239] = "Displacer beast"
		myData10[240] = "Doppelganger"
		myData10[241] = "Giant scorpion"
		myData10[242] = "Githyanki warrior"
		myData10[243] = "Gold dragon wyrmling"
		myData10[244] = "Green hag"
		myData10[245] = "Grell"
		myData10[246] = "Hell hound"
		myData10[247] = "Hobgoblin captain"
		myData10[248] = "Hook horror"
		myData10[249] = "Killer whale"
		myData10[250] = "Knight"
		myData10[251] = "Kuo-toa monitor"
		myData10[252] = "Manticore"
		myData10[253] = "Minotaur"
		myData10[254] = "Mummy"
		myData10[255] = "Nightmare"
		myData10[256] = "Owlbear"
		myData10[257] = "Phase spider"
		myData10[258] = "Quaggoth thonot"
		myData10[259] = "Spectator"
		myData10[260] = "Veteran"
		myData10[261] = "Water weird"
		myData10[262] = "Werewolf"
		myData10[263] = "Wight"
		myData10[264] = "Winter wolf"
		myData10[265] = "Yeti"
		myData10[266] = "Yuan-ti malison"
		myData10[267] = "Challenge 4 (1,100 XP)"
		myData10[268] = "Banshee"
		myData10[269] = "Black pudding"
		myData10[270] = "Bone naga"
		myData10[271] = "Chuul"
		myData10[272] = "Couatl"
		myData10[273] = "Elephant"
		myData10[274] = "Ettin"
		myData10[275] = "Flameskull"
		myData10[276] = "Ghost"
		myData10[277] = "Gnoll fang of Yeenoghu"
		myData10[278] = "Helmed horror"
		myData10[279] = "Incubus"
		myData10[280] = "Lamia"
		myData10[281] = "Lizard king/queen"
		myData10[282] = "Orc war chief"
		myData10[283] = "Red dragon wyrmling"
		myData10[284] = "Sea hag (in coven)"
		myData10[285] = "Shadow demon"
		myData10[286] = "Succubus"
		myData10[287] = "Wereboar"
		myData10[288] = "Weretiger"
		myData10[289] = "Challenge 5 (1,800 XP)"
		myData10[290] = "Air elemental"
		myData10[291] = "Barbed devil"
		myData10[292] = "Barlgura"
		myData10[293] = "Beholder zombie"
		myData10[294] = "Bulette"
		myData10[295] = "Cambion"
		myData10[296] = "Drow elite warrior"
		myData10[297] = "Earth elemental"
		myData10[298] = "Fire elemental"
		myData10[299] = "Flesh golem"
		myData10[300] = "Giant crocodile"
		myData10[301] = "Giant shark"
		myData10[302] = "Gladiator"
		myData10[303] = "Gorgon"
		myData10[304] = "Green hag (in coven)"
		myData10[305] = "Half-red dragon veteran"
		myData10[306] = "Hill giant"
		myData10[307] = "Mezzoloth"
		myData10[308] = "Night hag"
		myData10[309] = "Otyugh"
		myData10[310] = "Red slaad"
		myData10[311] = "Revenant"
		myData10[312] = "Roper"
		myData10[313] = "Sahuagin baron"
		myData10[314] = "Salamander"
		myData10[315] = "Shambling mound"
		myData10[316] = "Triceratops"
		myData10[317] = "Troll"
		myData10[318] = "Umber hulk"
		myData10[319] = "Unicorn"
		myData10[320] = "Vampire spawn"
		myData10[320] = "Water elemental"
		myData10[321] = "Werebear"
		myData10[322] = "Wraith"
		myData10[323] = "Xorn"
		myData10[324] = "Young remorhaz"
		myData10[325] = "Challenge 6 (2,300 XP)"
		myData10[326] = "Chasme"
		myData10[327] = "Chimera"
		myData10[328] = "Cyclops"
		myData10[329] = "Drider"
		myData10[330] = "Galeb duhr"
		myData10[331] = "Githzerai zerth"
		myData10[332] = "Hobgoblin warlord"
		myData10[333] = "Invisible stalker"
		myData10[334] = "Kuo-toa archpriest"
		myData10[335] = "Mage"
		myData10[336] = "Mammoth"
		myData10[337] = "Medusa"
		myData10[338] = "Vrock"
		myData10[339] = "Wyvern"
		myData10[340] = "Young brass dragon"
		myData10[341] = "Young white dragon"
		myData10[342] = "Challenge 7 (2,900 XP)"
		myData10[343] = "Blue slaad"
		myData10[344] = "Drow mage"
		myData10[345] = "Giant ape"
		myData10[346] = "Grick alpha"
		myData10[347] = "Mind flayer"
		myData10[348] = "Night hag (in coven)"
		myData10[349] = "Oni"
		myData10[350] = "Shield guardian"
		myData10[351] = "Stone giant"
		myData10[352] = "Young black dragon"
		myData10[353] = "Young copper dragon"
		myData10[354] = "Yuan-ti abomination"
		myData10[355] = "Challenge 8 (3,900 XP)"
		myData10[356] = "Assassin"
		myData10[357] = "Chain devil"
		myData10[358] = "Cloaker"
		myData10[359] = "Drow priestess of Lolth"
		myData10[360] = "Fomorian"
		myData10[361] = "Frost giant"
		myData10[362] = "Githyanki knight"
		myData10[363] = "Green slaad"
		myData10[364] = "Hezrou"
		myData10[365] = "Hydra"
		myData10[366] = "Mind flayer arcanist"
		myData10[367] = "Spirit naga"
		myData10[368] = "Tyrannosaurus rex"
		myData10[369] = "Young bronze dragon"
		myData10[370] = "Young green dragon"
		myData10[371] = "Challenge 9 (5,000 XP)"
		myData10[372] = "Abominable yeti"
		myData10[373] = "Bone devil"
		myData10[374] = "Clay golem"
		myData10[375] = "Cloud giant"
		myData10[376] = "Fire giant"
		myData10[377] = "Glabrezu"
		myData10[378] = "Gray slaad"
		myData10[379] = "Nycaloth"
		myData10[380] = "Treant"
		myData10[381] = "Young blue dragon"
		myData10[382] = "Young silver dragon"
		myData10[383] = "Challenge 10 (5,900 XP)"
		myData10[384] = "Aboleth"
		myData10[385] = "Death slaad"
		myData10[386] = "Deva"
		myData10[387] = "Guardian naga"
		myData10[388] = "Stone golem"
		myData10[389] = "Yochlol"
		myData10[390] = "Young gold dragon"
		myData10[391] = "Young red dragon"
		myData10[392] = "Challenge 11 (7,200 XP)"
		myData10[393] = "Behir"
		myData10[394] = "Dao"
		myData10[395] = "Djinni"
		myData10[396] = "Efreeti"
		myData10[397] = "Gynosphinx"
		myData10[398] = "Horned devil"
		myData10[399] = "Marid"
		myData10[400] = "Remorhaz"
		myData10[401] = "Roc"
		myData10[402] = "Challenge 12 (8,400 XP)"
		myData10[403] = "Arcanaloth"
		myData10[404] = "Archmage"
		myData10[405] = "Erinyes"
		myData10[406] = "Challenge 13 (10,000 XP)"
		myData10[407] = "Adult brass dragon"
		myData10[408] = "Adult white dragon"
		myData10[409] = "Beholder (not in lair)"
		myData10[410] = "Nalfeshnee"
		myData10[411] = "Rakshasa"
		myData10[412] = "Storm giant"
		myData10[413] = "Ultroloth"
		myData10[414] = "Vampire"
		myData10[415] = "Young red shadow dragon"
		myData10[416] = "Challenge 14 (11,500 XP)"
		myData10[417] = "Adult black dragon"
		myData10[418] = "Adult copper dragon"
		myData10[419] = "Beholder (in lair)"
		myData10[420] = "Death tyrant (not in lair)"
		myData10[421] = "Ice devil"
		myData10[422] = "Challenge 15 (13,000 XP)"
		myData10[423] = "Adult bronze dragon"
		myData10[424] = "Adult green dragon"
		myData10[425] = "Death tyrant (in lair)"
		myData10[426] = "Mummy lord (not in lair"
		myData10[427] = "Purple worm"
		myData10[428] = "Vampire (spellcaster)"
		myData10[429] = "Vampire (warrior)"
		myData10[430] = "Challenge 16 (15,000 XP)"
		myData10[431] = "Adult blue dragon"
		myData10[432] = "Adult silver dragon"
		myData10[433] = "Iron golem"
		myData10[434] = "Marilith"
		myData10[435] = "Mummy lord (in lair)"
		myData10[436] = "Planetar"
		myData10[437] = "Challenge 17 (18,000 XP)"
		myData10[438] = "Adult blue dracolich"
		myData10[439] = "Adult gold dragon"
		myData10[440] = "Adult red dragon"
		myData10[441] = "Androsphinx"
		myData10[442] = "Death knight"
		myData10[443] = "Dragon turtle"
		myData10[444] = "Goristro"
		myData10[445] = "Challenge 18 (20,000 XP)"
		myData10[446] = "Demilich (not in lair)"
		myData10[447] = "Challenge 19 (22,000 XP)"
		myData10[448] = "Balor"
		myData10[449] = "Challenge 20 (25,000 XP)"
		myData10[450] = "Ancient brass dragon"
		myData10[451] = "Ancient white dragon"
		myData10[452] = "Demilich (in lair)"
		myData10[453] = "Pit fiend"
		myData10[454] = "Challenge 21 (33,000 XP)"
		myData10[455] = "Ancient black dragon"
		myData10[456] = "Ancient copper dragon"
		myData10[457] = "Lich (not in lair)"
		myData10[458] = "Solar"
		myData10[459] = "Challenge 22 (41,000 XP)"
		myData10[460] = "Ancient bronze dragon"
		myData10[461] = "Ancient green dragon"
		myData10[462] = "Lich (in lair)"
		myData10[463] = "Challenge 23 (50,000 XP)"
		myData10[464] = "Ancient blue dragon"
		myData10[465] = "Ancient silver dragon"
		myData10[466] = "Empyrean"
		myData10[467] = "Kraken"
		myData10[468] = "Challenge 24 (62,000 XP)"
		myData10[469] = "Ancient gold dragon"
		myData10[470] = "Ancient red dragon"
		myData10[471] = "Challenge 30 (155,000 XP)"
		myData10[472] = "Tarrasque"

		for i = 1, #myData10 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background8 )
		scrollView:insert( title8 )
		scrollView:insert( underline8 )
		scrollView:insert( myList )
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
		view1backButton:removeSelf()
		scrollView:remove( background8 )
		scrollView:remove( title8 )
		scrollView:remove( underline8 )
		scrollView:remove( myList )
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