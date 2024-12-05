-----------------------------------------------------------------------------------------
--
-- view4.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view4")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view4")
		composer.gotoScene( "openMenu")
	end

local function onRowRender( event )
   local row = event.row
   local id = row.index
 
   row.rollText = display.newText( myData4[id].roll, 12, 0, "Centaur", 17 )
   row.rollText.anchorX = 0
   row.rollText.anchorY = 0.5
   row.rollText:setFillColor( 0 )
   row.rollText.y = 20
   row.rollText.x = display.contentCenterX * .2
 
   row.gemsArtText = display.newText( myData4[id].gemsArt, 12, 0, "Centaur", 17 )
   row.gemsArtText.anchorY = 0.5
   row.gemsArtText:setFillColor( 0, 0.25, 0.25, 1 )
   row.gemsArtText.y = 20
   row.gemsArtText.x = display.contentCenterX * 1.5
 
   row.itemsText = display.newText( myData4[id].items, 12, 0, "Centaur", 17 )
   row.itemsText.anchorY = 0.5
   row.itemsText:setFillColor( 0, 0.5, 0.25, 1 )
   row.itemsText.y = 20
   row.itemsText.x = display.contentCenterX * 2.7
 
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
		background4 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background4:setFillColor( 1 )	-- white

		title4 = display.newText( "Treasure Table: CR 0-4", display.contentCenterX, display.contentCenterY / 5, "Centaur", 32 )
		title4:setFillColor( 0.7, 0.5, 0 )

		columnHeads13 = display.newText( "Roll", display.contentCenterX * .3, display.contentCenterY / 2.75, "Centaur", 22 )
		columnHeads13:setFillColor( 0 )
		columnHeads14 = display.newText( "Gems/Art", display.contentCenterX * 1.55, display.contentCenterY / 2.75, "Centaur", 22 )
		columnHeads14:setFillColor( 0 )
		columnHeads15 = display.newText( "Magic Items", display.contentCenterX * 2.65, display.contentCenterY / 2.75, "Centaur", 22 )
		columnHeads15:setFillColor( 0 )

		underline4 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline4:setStrokeColor( 0 )

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

		myData4 = {}
		myData4[1] = {roll="Coins", gemsArt="      6d6 x 100 CP    3d6 x 100 SP ", items="    --    2d6 x 10 GP  --"}
		myData4[2] = {roll="d100", gemsArt="Gems/Art Objects", items="Magic Items"}
		myData4[3] = {roll="01", gemsArt="--", items="Robe of the Stars"}
		myData4[4] = {roll="02-06", gemsArt="--", items="--"}
		myData4[5] = {roll="07-16", gemsArt="2d6 (7) 10 gp gems", items="--"}
		myData4[6] = {roll="17-26", gemsArt="2d4 (5) 25 gp art", items="--"}
		myData4[7] = {roll="27-36", gemsArt="2d6 (7) 50 gp gems", items="--"}
		myData4[8] = {roll="37-44", gemsArt="2d6 (7) 10 gp gems", items="Roll 1d6 Magic Table A"}
		myData4[9] = {roll="45-52", gemsArt="2d4 (5) 25 gp art", items="Roll 1d6 Magic Table A"}
		myData4[10] = {roll="53-60", gemsArt="2d6 (7) 50 gp gems", items="Roll 1d6 Magic Table A"}
		myData4[11] = {roll="61-65", gemsArt="2d6 (7) 10 gp gems", items="Roll 1d6 Magic Table B"}
		myData4[12] = {roll="66-70", gemsArt="2d4 (5) 25 gp art", items="Roll 1d6 Magic Table B"}
		myData4[13] = {roll="71-75", gemsArt="2d6 (7) 50 gp gems", items="Roll 1d6 Magic Table B"}
		myData4[14] = {roll="76-78", gemsArt="2d6 (7) 10 gp gems", items="Roll 1d6 Magic Table C"}
		myData4[15] = {roll="79-80", gemsArt="2d4 (5) 25 gp art", items="Roll 1d6 Magic Table C"}
		myData4[16] = {roll="81-85", gemsArt="2d6 (7) 50 gp gems", items="Roll 1d6 Magic Table C"}
		myData4[17] = {roll="86-92", gemsArt="2d4 (5) 25 gp art", items="Roll 1d6 Magic Table F"}
		myData4[18] = {roll="93-97", gemsArt="2d6 (7) 50 gp gems", items="Roll 1d6 Magic Table F"}
		myData4[19] = {roll="98-99", gemsArt="2d4 (5) 25 gp art", items="Roll 1d6 Magic Table G"}
		myData4[20] = {roll="100", gemsArt="2d6 (7) 50 gp gems", items="Roll 1d6 Magic Table G"}
		
		for i = 1, #myData4 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background4 )
		scrollView:insert( title4 )
		scrollView:insert( underline4 )
		scrollView:insert( myList )
		scrollView:insert( columnHeads13 )
		scrollView:insert( columnHeads14 )
		scrollView:insert( columnHeads15 )
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
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
		columnHeads13:removeSelf()
		columnHeads14:removeSelf()
		columnHeads15:removeSelf()
		view1backButton:removeSelf()
		--tablesButton:removeSelf()
		scrollView:remove( background4 )
		scrollView:remove( title4 )
		scrollView:remove( underline4 )
		scrollView:remove( myList )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene