-----------------------------------------------------------------------------------------
--
-- view6.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view6")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view6")
		composer.gotoScene( "openMenu")
	end

local function onRowRender( event )
   local row = event.row
   local id = row.index
 
   row.rollText = display.newText( myData6[id].roll, 12, 0, "Centaur", 17 )
   row.rollText.anchorX = 0
   row.rollText.anchorY = 0.5
   row.rollText:setFillColor( 0 )
   row.rollText.y = 20
   row.rollText.x = display.contentCenterX * .1
 
   row.gemsArtText = display.newText( myData6[id].gemsArt, 12, 0, "Centaur", 17 )
   row.gemsArtText.anchorY = 0.5
   row.gemsArtText:setFillColor( 0, 0.25, 0.25, 1 )
   row.gemsArtText.y = 20
   row.gemsArtText.x = display.contentCenterX * .99
 
   row.itemsText = display.newText( myData6[id].items, 12, 0, "Centaur", 17 )
   row.itemsText.anchorY = 0.5
   row.itemsText:setFillColor( 0, 0.5, 0.25, 1 )
   row.itemsText.y = 20
   row.itemsText.x = display.contentCenterX * 2.25
 
   row:insert( row.rollText )
   row:insert( row.gemsArtText )
   row:insert( row.itemsText )
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
		background6 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background6:setFillColor( 1 )	-- white

		title6 = display.newText( "Treasure Table: CR 11-16", display.contentCenterX, display.contentCenterY / 5, "Centaur", 32 )
		title6:setFillColor( 0.7, 0.5, 0 )

		columnHeads19 = display.newText( "Roll", display.contentCenterX * .2, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads19:setFillColor( 0 )
		columnHeads20 = display.newText( "Gems/Art", display.contentCenterX * .99, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads20:setFillColor( 0 )
		columnHeads21 = display.newText( "Magic Items", display.contentCenterX * 2.25, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads21:setFillColor( 0 )

		underline6 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline6:setStrokeColor( 0 )

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

		myData6 = {}
		myData6[1] = {roll="Coins", gemsArt="", items="       4d6 x 1000 GP     5d6 x 100 PP"}
		myData6[2] = {roll="d100", gemsArt="Gems/Art Objects", items="Magic Items"}
		myData6[3] = {roll="01", gemsArt="--", items="+3 Weapon"}
		myData6[4] = {roll="02-03", gemsArt="--", items="--"}
		myData6[5] = {roll="04-06", gemsArt="2d4 (5) 250 gp art", items="--"}
		myData6[6] = {roll="07-10", gemsArt="2d4 (5) 750 gp art", items="--"}
		myData6[7] = {roll="11-12", gemsArt="3d6 (10) 500 gp gems", items="--"}
		myData6[8] = {roll="13-15", gemsArt="3d6 (10) 1000 gp gems", items="--"}
		myData6[9] = {roll="16-19", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table A, 1d6 B"}
		myData6[10] = {roll="20-23", gemsArt="2d4 (5) 750 gp art", items="Roll 1d4 Magic Table A, 1d6 B"}
		myData6[11] = {roll="24-26", gemsArt="3d6 (10) 500 gp gems", items="Roll 1d4 Magic Table A, 1d6 B"}
		myData6[12] = {roll="27-29", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d4 Magic Table A, 1d6 B"}
		myData6[13] = {roll="30-35", gemsArt="2d4 (5) 250 gp art", items="Roll 1d6 Magic Table C"}
		myData6[14] = {roll="36-40", gemsArt="2d4 (5) 750 gp art", items="Roll 1d6 Magic Table C"}
		myData6[15] = {roll="41-45", gemsArt="3d6 (10) 500 gp gems", items="Roll 1d6 Magic Table C"}
		myData6[16] = {roll="46-50", gemsArt="2d4 (5) 250 gp art", items="Roll 1d6 Magic Table C"}
		myData6[17] = {roll="51-54", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table D"}
		myData6[18] = {roll="55-58", gemsArt="2d4 (5) 750 gp art", items="Roll 1d4 Magic Table D"}
		myData6[19] = {roll="59-62", gemsArt="3d6 (10) 500 gp gems", items="Roll 1d4 Magic Table D"}
		myData6[20] = {roll="63-66", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table D"}
		myData6[21] = {roll="67-68", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table E"}
		myData6[22] = {roll="69-70", gemsArt="2d4 (5) 750 gp art", items="Roll 1 Magic Table E"}
		myData6[23] = {roll="71-72", gemsArt="3d6 (10) 500 gp gems", items="Roll 1 Magic Table E"}
		myData6[24] = {roll="73-74", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table E"}
		myData6[25] = {roll="75-76", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table F, 1d4 G"}
		myData6[26] = {roll="77-78", gemsArt="2d4 (5) 750 gp art", items="Roll 1 Magic Table F, 1d4 G"}
		myData6[27] = {roll="79-80", gemsArt="3d6 (10) 500 gp gems", items="Roll 1 Magic Table F, 1d4 G"}
		myData6[28] = {roll="81-82", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table F, 1d4 G"}
		myData6[29] = {roll="83-85", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table H"}
		myData6[30] = {roll="86-88", gemsArt="2d4 (5) 750 gp art", items="Roll 1d4 Magic Table H"}
		myData6[31] = {roll="89-90", gemsArt="3d6 (10) 500 gp gems", items="Roll 1d4 Magic Table H"}
		myData6[32] = {roll="91-92", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table H"}
		myData6[33] = {roll="93-94", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table I"}
		myData6[34] = {roll="95-96", gemsArt="2d4 (5) 750 gp art", items="Roll 1d4 Magic Table I"}
		myData6[35] = {roll="97-98", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table I"}
		myData6[36] = {roll="99-100", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table I"}
		
		for i = 1, #myData6 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background6 )
		scrollView:insert( title6 )
		scrollView:insert( underline6 )
		scrollView:insert( myList )
		scrollView:insert( columnHeads19 )
		scrollView:insert( columnHeads20 )
		scrollView:insert( columnHeads21 )
		scrollView:insert(view1backButton)
		--scrollView:insert(tablesButton)


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
		columnHeads19:removeSelf()
		columnHeads20:removeSelf()
		columnHeads21:removeSelf()
		view1backButton:removeSelf()
		scrollView:insert( background6 )
		scrollView:insert( title6 )
		scrollView:insert( underline6 )
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