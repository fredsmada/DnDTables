-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
	function goBack()
		composer.removeScene( "view2")
		composer.gotoScene( "menu" )
	end

-- function to go to tables pop out view
	function tableMenu()
		composer.removeScene("view2")
		composer.gotoScene( "openMenu")
	end

local function onRowRender( event )
   local row = event.row
   local id = row.index
 
   row.nameText = display.newText( myData2[id].name, 12, 0, "Centaur", 17 )
   row.nameText.anchorX = 0
   row.nameText.anchorY = 0.5
   row.nameText:setFillColor( 0 )
   row.nameText.y = 20
   row.nameText.x = display.contentCenterX / 20
 
   row.costText = display.newText( myData2[id].cost, 12, 0, "Centaur", 17 )
   row.costText.anchorY = 0.5
   row.costText:setFillColor( 0, 0.25, 0.25, 1 )
   row.costText.y = 20
   row.costText.x = display.contentCenterX * 0.85
 
   row.acText = display.newText( myData2[id].ac, 12, 0, "Centaur", 17 )
   row.acText.anchorY = 0.5
   row.acText:setFillColor( 0, 0.5, 0.25, 1 )
   row.acText.y = 20
   row.acText.x = display.contentCenterX * 1.5
 
   row.weightText = display.newText( myData2[id].weight, 12, 0, "Centaur", 17 )
   row.weightText.anchorY = 0.5
   row.weightText:setFillColor( 0 )
   row.weightText.y = 20
   row.weightText.x = display.contentCenterX * 2.2
 
   row:insert( row.nameText )
   row:insert( row.costText )
   row:insert( row.acText )
   row:insert( row.weightText )
   return true
end

local options = {
	x = display.contentCenterX * 1.5,
	y = display.contentCenterY / 13,
	isEnabled = true,
	label = "Go Back",
	textOnly = true,
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.8 } },
	onPress = goBack
}

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
		background2 = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background2:setFillColor( 1 )	-- white

		title2 = display.newText( "Armor Table", display.contentCenterX, display.contentCenterY / 6, "Centaur", 32 )
		title2:setFillColor( 0.7, 0.5, 0 )

		columnHeads4 = display.newText( "Name", display.contentCenterX / 5, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads4:setFillColor( 0 )
		columnHeads5 = display.newText( "Cost", display.contentCenterX * 0.85, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads5:setFillColor( 0 )
		columnHeads6 = display.newText( "AC", display.contentCenterX * 1.5, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads6:setFillColor( 0 )
		columnHeads7 = display.newText( "Weight", display.contentCenterX * 2.2, display.contentCenterY / 3, "Centaur", 22 )
		columnHeads7:setFillColor( 0 )

		underline2 = display.newLine( -50, display.contentCenterY - 80, display.safeActualContentWidth, display.contentCenterY - 80 )
		underline2:setStrokeColor( 0 )

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

		myData2 = {}
		myData2[1] = { name="Padded", cost="5 GP", ac="11 + DEX", weight="8 lb" }
		myData2[2] = { name="Leather", cost="10 GP", ac="11 + DEX", weight="10 lb" }
		myData2[3] = { name="Studded Leather", cost="45 GP", ac="12 + DEX", weight="13 lb" }
		myData2[4] = { name="Hide", cost="10 GP", ac="12 + DEX (max 2)", weight="12 lb" }
		myData2[5] = { name="Chain Shirt", cost="50 GP", ac="13 + DEX (max 2)", weight="20 lb" }
		myData2[6] = { name="Scale Mail", cost="50 GP", ac="14 + DEX (max 2)", weight="45 lb" }
		myData2[7] = { name="Breastplate", cost="400 GP", ac="14 + DEX (max 2)", weight="20 lb" }
		myData2[8] = { name="Half Plate", cost="750 GP", ac="15 + DEX (max 2)", weight="40 lb" }
		myData2[9] = { name="Ring Mail", cost="30 GP", ac="14", weight="40 lb" }
		myData2[10] = { name="Chain Mail", cost="75 GP", ac="16", weight="55 lb" }
		myData2[11] = { name="Splint", cost="200 GP", ac="17", weight="60 lb" }
		myData2[12] = { name="Plate", cost="1,500 GP", ac="18", weight="65 lb" }
		myData2[13] = { name="Shield", cost="10 GP", ac="+2", weight="6 lb" }
		 
		for i = 1, #myData2 do
		    myList:insertRow{
		       rowHeight = 60,
		       isCategory = false,
		       rowColor = { 1, 1, 1 },
		       lineColor = { 0.90, 0.90, 0.90 }
		    }
		end

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( myList )
		scrollView:insert( background2 )
		scrollView:insert( underline2 )
		scrollView:insert( view1backButton )
		scrollView:insert( columnHeads4 )
		scrollView:insert( columnHeads5 )
		scrollView:insert( columnHeads6 )
		scrollView:insert( columnHeads7 )
		scrollView:insert( title2 )
		scrollView:insert( myList )

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
	columnHeads4:removeSelf()
	columnHeads5:removeSelf()
	columnHeads6:removeSelf()
	columnHeads7:removeSelf()
	view1backButton:removeSelf()
	scrollView:remove( myList )
	scrollView:remove( view1backButton )
	scrollView:remove( background2 )
	scrollView:remove( underline2 )
	scrollView:remove( title2 )
	scrollView:remove( myList )
	scrollView:removeSelf()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
