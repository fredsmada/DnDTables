-----------------------------------------------------------------------------------------
--
-- view7.lua
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
 
   row.rollText = display.newText( myData7[id].roll, 12, 0, "Centaur", 17 )
   row.rollText.anchorX = 0
   row.rollText.anchorY = 0.5
   row.rollText:setFillColor( 0 )
   row.rollText.y = 20
   row.rollText.x = display.contentCenterX * .05
 
   row.gemsArtText = display.newText( myData7[id].gemsArt, 12, 0, "Centaur", 17 )
   row.gemsArtText.anchorY = 0.5
   row.gemsArtText:setFillColor( 0, 0.25, 0.25, 1 )
   row.gemsArtText.y = 20
   row.gemsArtText.x = display.contentCenterX
 
   row.itemsText = display.newText( myData7[id].items, 12, 0, "Centaur", 17 )
   row.itemsText.anchorY = 0.5
   row.itemsText:setFillColor( 0, 0.5, 0.25, 1 )
   row.itemsText.y = 20
   row.itemsText.x = display.contentCenterX * 2.2
 
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
		background7 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background7:setFillColor( 1 )	-- white

		title7 = display.newText( "Treasure Table: CR 17+", display.contentCenterX, display.contentCenterY / 5, "Centaur", 32 )
		title7:setFillColor( 0.7, 0.5, 0 )

		columnHeads22 = display.newText( "Roll", display.contentCenterX * .17, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads22:setFillColor( 0 )
		columnHeads23 = display.newText( "Gems/Art", display.contentCenterX * .99, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads23:setFillColor( 0 )
		columnHeads24 = display.newText( "Magic Items", display.contentCenterX * 2.25, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads24:setFillColor( 0 )

		underline7 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline7:setStrokeColor( 0 )

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

		myData7 = {}
		myData7[1] = {roll="Coins", gemsArt="", items="    12d6 x 1000 GP     8d6 x 1000 PP"}
		myData7[2] = {roll="d100", gemsArt="Gems/Art Objects", items="Magic Items"}
		myData7[3] = {roll="01", gemsArt="--", items="Vorpal Sword or Robe of the Magi"}
		myData7[4] = {roll="02", gemsArt="--", items="--"}
		myData7[5] = {roll="03-05", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d8 Magic Table C"}
		myData7[6] = {roll="06-08", gemsArt="1d10 (5) 2500 gp art", items="Roll 1d8 Magic Table C"}
		myData7[7] = {roll="09-11", gemsArt="1d4 (2) 7500 gp art", items="Roll 1d8 Magic Table C"}
		myData7[8] = {roll="12-14", gemsArt="1d8 (4) 5000 gp gems", items="Roll 1d8 Magic Table C"}
		myData7[9] = {roll="15-22", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d6 Magic Table D"}
		myData7[10] = {roll="23-30", gemsArt="1d10 (5) 2500 gp art", items="Roll 1d6 Magic Table D"}
		myData7[11] = {roll="31-38", gemsArt="1d4 (2) 7500 gp art", items="Roll 1d6 Magic Table D"}
		myData7[12] = {roll="39-46", gemsArt="1d8 (4) 5000 gp gems", items="Roll 1d6 Magic Table D"}
		myData7[13] = {roll="47-52", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d6 Magic Table E"}
		myData7[14] = {roll="53-58", gemsArt="1d10 (5) 2500 gp art", items="Roll 1d6 Magic Table E"}
		myData7[15] = {roll="59-63", gemsArt="1d4 (2) 7500 gp art", items="Roll 1d6 Magic Table E"}
		myData7[16] = {roll="64-68", gemsArt="1d8 (4) 5000 gp gems", items="Roll 1d6 Magic Table E"}
		myData7[17] = {roll="69", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d4 Magic Table G"}
		myData7[18] = {roll="70", gemsArt="1d10 (5) 2500 gp art", items="Roll 1d4 Magic Table G"}
		myData7[19] = {roll="71", gemsArt="1d4 (2) 7500 gp art", items="Roll 1d4 Magic Table G"}
		myData7[20] = {roll="72", gemsArt="1d8 (4) 5000 gp gems", items="Roll 1d4 Magic Table G"}
		myData7[21] = {roll="73-74", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d4 Magic Table H"}
		myData7[22] = {roll="75-76", gemsArt="1d10 (5) 2500 gp art", items="Roll 1d4 Magic Table H"}
		myData7[23] = {roll="77-78", gemsArt="1d4 (2) 7500 gp art", items="Roll 1d4 Magic Table H"}
		myData7[24] = {roll="79-80", gemsArt="1d8 (4) 5000 gp gems", items="Roll 1d4 Magic Table H"}
		myData7[25] = {roll="81-85", gemsArt="3d6 (10) 1000 gp gems", items="Roll 1d4 Magic Table I"}
		myData7[26] = {roll="86-90", gemsArt="1d10 (5) 2500 gp art", items="Roll 1d4 Magic Table I"}
		myData7[27] = {roll="91-95", gemsArt="1d4 (2) 7500 gp art", items="Roll 1d4 Magic Table I"}
		myData7[28] = {roll="96-100", gemsArt="1d8 (4) 5000 gp gems", items="Roll 1d4 Magic Table I"}		
		for i = 1, #myData7 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background7 )
		scrollView:insert( title7 )
		scrollView:insert( underline7 )
		scrollView:insert( myList )
		scrollView:insert( columnHeads22 )
		scrollView:insert( columnHeads23 )
		scrollView:insert( columnHeads24 )
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
		columnHeads22:removeSelf()
		columnHeads23:removeSelf()
		columnHeads24:removeSelf()
		view1backButton:removeSelf()
		scrollView:insert( background7 )
		scrollView:insert( title7 )
		scrollView:insert( underline7 )
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