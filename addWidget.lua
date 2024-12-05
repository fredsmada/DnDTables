-----------------------------------------------------------------------------------------
--
-- addWidget.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
function goBack()
    composer.removeScene( "addWidget")
    composer.gotoScene( "map" )
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
	
	-- function to add a character to the map
	function addCharacter()
		composer.removeScene( "addWidget")
		composer.gotoScene( "mapCharacter" )
	end

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then

        options = {
           x = display.contentCenterX,
           y = display.contentCenterY / 2,
           isEnabled = true,
           label = "Add Character",
           fontSize = 20,
           labelColor = { default={ 0, 0.5, 1 }, over={ 1, 0, 0, 0.25 } },
           onPress = addCharacter
       }
       options2 = {
        x = display.contentCenterX,
        y = display.contentCenterY / 1.25,
        isEnabled = true,
        label = "Add Enemy",
        fontSize = 20,
        labelColor = { default={ 0.5, 0.5, 0 }, over={ 1, 0, 0, 0.25 } },
        onPress = addWidget
    }
		-- Called when the scene is still off screen and is about to move on screen
		-- mainGroup = display.newGroup()  -- Display group for some assets
		-- sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

		-- create a white background to fill screen
		background = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background:setFillColor( 1 )	-- white

        title = display.newText( "Add a Widget", display.contentCenterX, display.contentCenterY / 8, "Centaur", 32 )
		title:setFillColor( 0.5, 0.5, 0.5 )

        addCharacterButton = widget.newButton( options )
        addEnemyButton = widget.newButton( options2 )

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background )
        scrollView:insert(title)
        scrollView:insert(addCharacterButton)
        scrollView:insert(addEnemyButton)

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
		scrollView:remove( background )
        scrollView:remove(title)
        scrollView:remove(addCharacterButton)
        scrollView:remove(addEnemyButton)
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