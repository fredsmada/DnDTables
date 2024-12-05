-----------------------------------------------------------------------------------------
--
-- view5.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view5")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view5")
		composer.gotoScene( "openMenu")
	end

local function onRowRender( event )
   local row = event.row
   local id = row.index
 
   row.rollText = display.newText( myData5[id].roll, 12, 0, "Centaur", 17 )
   row.rollText.anchorX = 0
   row.rollText.anchorY = 0.5
   row.rollText:setFillColor( 0 )
   row.rollText.y = 20
   row.rollText.x = display.contentCenterX * .11
 
   row.gemsArtText = display.newText( myData5[id].gemsArt, 12, 0, "Centaur", 17 )
   row.gemsArtText.anchorY = 0.5
   row.gemsArtText:setFillColor( 0, 0.25, 0.25, 1 )
   row.gemsArtText.y = 20
   row.gemsArtText.x = display.contentCenterX * 1.1
 
   row.itemsText = display.newText( myData5[id].items, 12, 0, "Centaur", 17 )
   row.itemsText.anchorY = 0.5
   row.itemsText:setFillColor( 0, 0.5, 0.25, 1 )
   row.itemsText.y = 20
   row.itemsText.x = display.contentCenterX * 2.5
 
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
		background5 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background5:setFillColor( 1 )	-- white

		title5 = display.newText( "Treasure Table: CR 6-10", display.contentCenterX, display.contentCenterY / 5, "Centaur", 32 )
		title5:setFillColor( 0.7, 0.5, 0 )

		columnHeads16 = display.newText( "Roll", display.contentCenterX * .2, display.contentCenterY / 2.5, "Centaur", 22 )
		columnHeads16:setFillColor( 0 )
		columnHeads17 = display.newText( "Gems/Art", display.contentCenterX * 1.15, display.contentCenterY / 2.5, "Centaur", 22 )
		columnHeads17:setFillColor( 0 )
		columnHeads18 = display.newText( "Magic Items", display.contentCenterX * 2.6, display.contentCenterY / 2.5, "Centaur", 22 )
		columnHeads18:setFillColor( 0 )

		underline5 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline5:setStrokeColor( 0 )

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

		myData5 = {}
		myData5[1] = {roll="Coins", gemsArt="          2d6 x 100 CP  2d6 x 1000 SP   ", items=" --    6d6 x 100 GP     3d6 x 10 PP"}
		myData5[2] = {roll="d100", gemsArt="Gems/Art Objects", items="Magic Items"}
		myData5[3] = {roll="01", gemsArt="--", items="+2 Armor"}
		myData5[4] = {roll="02-04", gemsArt="--", items="--"}
		myData5[5] = {roll="05-10", gemsArt="2d4 (5) 25 gp art", items="--"}
		myData5[6] = {roll="11-16", gemsArt="3d6 (10) 50 gp gems", items="--"}
		myData5[7] = {roll="17-22", gemsArt="3d6 (10) 100 gp gems", items="--"}
		myData5[8] = {roll="23-28", gemsArt="2d4 (5) 25 gp art", items="--"}
		myData5[9] = {roll="29-32", gemsArt="2d4 (5) 25 gp art", items="Roll 1d6 Magic Table A"}
		myData5[10] = {roll="33-36", gemsArt="3d6 (10) 50 gp gems", items="Roll 1d6 Magic Table A"}
		myData5[11] = {roll="37-40", gemsArt="3d6 (10) 100 gp gems", items="Roll 1d6 Magic Table A"}
		myData5[12] = {roll="41-44", gemsArt="2d4 (5) 250 gp art", items="Roll 1d6 Magic Table A"}
		myData5[13] = {roll="45-49", gemsArt="2d4 (5) 25 gp art", items="Roll 1d4 Magic Table B"}
		myData5[14] = {roll="50-54", gemsArt="3d6 (10) 50 gp gems", items="Roll 1d4 Magic Table B"}
		myData5[15] = {roll="55-59", gemsArt="3d6 (10) 100 gp gems", items="Roll 1d4 Magic Table B"}
		myData5[16] = {roll="60-63", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table B"}
		myData5[17] = {roll="64-66", gemsArt="2d4 (5) 25 gp art", items="Roll 1d4 Magic Table C"}
		myData5[18] = {roll="67-69", gemsArt="3d6 (10) 50 gp gems", items="Roll 1d4 Magic Table C"}
		myData5[19] = {roll="70-72", gemsArt="3d6 (10) 100 gp gems", items="Roll 1d4 Magic Table C"}
		myData5[20] = {roll="73-74", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table C"}
		myData5[21] = {roll="75-76", gemsArt="2d4 (5) 25 gp art", items="Roll 1 Magic Table D"}
		myData5[22] = {roll="77-78", gemsArt="3d6 (10) 50 gp gems", items="Roll 1 Magic Table D"}
		myData5[23] = {roll="79", gemsArt="3d6 (10) 100 gp gems", items="Roll 1 Magic Table D"}
		myData5[24] = {roll="80", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table D"}
		myData5[25] = {roll="81-84", gemsArt="2d4 (5) 25 gp art", items="Roll 1d4 Magic Table F"}
		myData5[26] = {roll="85-88", gemsArt="3d6 (10) 50 gp gems", items="Roll 1d4 Magic Table F"}
		myData5[27] = {roll="89-91", gemsArt="3d6 (10) 100 gp gems", items="Roll 1d4 Magic Table F"}
		myData5[28] = {roll="92-94", gemsArt="2d4 (5) 250 gp art", items="Roll 1d4 Magic Table F"}
		myData5[29] = {roll="95-96", gemsArt="3d6 (10) 100 gp gems", items="Roll 1d6 Magic Table G"}
		myData5[30] = {roll="97-98", gemsArt="2d4 (5) 250 gp art", items="Roll 1d6 Magic Table G"}
		myData5[31] = {roll="99", gemsArt="3d6 (10) 100 gp gems", items="Roll 1 Magic Table H"}
		myData5[32] = {roll="100", gemsArt="2d4 (5) 250 gp art", items="Roll 1 Magic Table H"}
		
		for i = 1, #myData5 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	     -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background5 )
		scrollView:insert( title5 )
		scrollView:insert( underline5 )
		scrollView:insert( myList )
		scrollView:insert( columnHeads16 )
		scrollView:insert( columnHeads17 )
		scrollView:insert( columnHeads18 )
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
		columnHeads16:removeSelf()
		columnHeads17:removeSelf()
		columnHeads18:removeSelf()
		view1backButton:removeSelf()
		scrollView:insert( background5 )
		scrollView:insert( title5 )
		scrollView:insert( underline5 )
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