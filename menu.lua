-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local native = require("native")

-- function to go to character view
	function newCharacter()
		composer.removeScene( "menu")
		composer.gotoScene( "viewNewCharacter" )
	end

-- function to go to DM tables view
	function toTables()
		composer.removeScene( "menu")
		composer.gotoScene( "view1" )
	end

-- function to go to map view
	-- function toMap()
	-- 	composer.removeScene( "menu")
	-- 	composer.gotoScene( "map" )
	-- end

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

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end
	
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
	end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
 
	if phase == "will" then

		-- Called when the scene is still off screen and is about to move on screen
		-- mainGroup = display.newGroup() 
		-- sceneGroup:insert( mainGroup )

		-- create a white background to fill screen
		local background = display.newImageRect(sceneGroup, "dragonBack.png", 400, 700)
		background.x = display.contentCenterX
		background.y = display.contentCenterY

		menuTitle = display.newText( "D and D 5e Tools", display.contentCenterX, 50, "Centaur", 32 )
		menuTitle:setFillColor( 1, 1, 1 )

		options = {
			x = display.contentCenterX,
			y = display.contentCenterY - 100,
			isEnabled = true,
			label = "Create a Character",
			labelColor = { default={ 0,0.5,1 }, over={ 0, 0, 1, 0.8 } },
			fontSize = 28,
			textOnly = true,
			width = display.actualContentWidth - 100,
			onPress = newCharacter
		}

		options2 = {
			x = display.contentCenterX,
			y = display.contentCenterY,
			isEnabled = true,
			label = "DM Tables",
			labelColor = { default={ 1, 0.9, 0 }, over={ 0, 0, 1, 0.25 } },
			fontSize = 28,
			textOnly = true,
			width = display.actualContentWidth / 2,
			onPress = toTables
		}

		-- options3 = {
		-- 	x = display.contentCenterX,
		-- 	y = display.contentCenterY * 1.45,
		-- 	isEnabled = true,
		-- 	label = "Gameplay Map",
		-- 	labelColor = { default={ .7, 0.9, 0.7 }, over={ 0, 0, 1, 0.25 } },
		-- 	fontSize = 28,
		-- 	textOnly = true,
		-- 	width = display.actualContentWidth / 2,
		-- 	onPress = toMap
		-- }

		-- Buttons to manipulate list
		newCharacter = widget.newButton(options)
		tables = widget.newButton(options2)
		--map = widget.newButton(options3)

		--sceneGroup:insert(scrollView)
		scrollView:insert( background )
        scrollView:insert( menuTitle )
        scrollView:insert( newCharacter )
        scrollView:insert( tables )
        --scrollView:insert( map )

	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		-- function to make scrollView scroll
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
	scrollView:remove( background )
	scrollView:remove( tables )
	scrollView:remove( menuTitle )
	scrollView:remove( newCharacter )
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