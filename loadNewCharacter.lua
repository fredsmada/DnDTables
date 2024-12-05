-----------------------------------------------------------------------------------------
--
-- loadNewCharacter.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
scene = composer.newScene()
local widget = require( "widget" )
local lfs = require( "lfs" )

-- function to go back
function goBack()
    composer.removeScene( "loadNewCharacter")
    composer.gotoScene( "viewNewCharacter" )
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

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

    -- Buttons to manipulate list
    randomButton = widget.newButton(options)
	if phase == "will" then
        -- Code to check how many character files are in folder
        local path = system.pathForFile( nil, system.DocumentsDirectory )
        i = 1
        --***TODO: Figure out how to get name into newCharacter file***
        -- options = {
        --     x = display.contentCenterX,
        --     y = (50 * i) + 30 ,
        --     isEnabled = true,
        --     label = string.sub(file, 0, -5),
        --     textOnly = true,
        --     labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.8 } },
        --     onPress = loadCharacter
        -- }
        for file in lfs.dir( path ) do
            if string.sub(file, -3) == "txt" then
                if string.len(file) <= 20 then
                    temp = widget.newButton( string.sub(file, 0, -5), display.contentCenterX, (50 * i) + 30 )
                    i = i + 1
                else
                    temp = widget.newButton( string.sub(file, 0, -5), display.contentCenterX, (50 * i) + 30 )
                    i = i + 1
                end
            end
        end

        options = {
           x = display.contentCenterX / 2,
           y = -30,
           isEnabled = true,
           label = "Add Character",
           fontSize = 20,
           labelColor = { default={ 0, 0.5, 1 }, over={ 1, 0, 0, 0.25 } },
           onPress = addCharacter
        }
        options2 = {
            x = display.contentCenterX * 1.6,
            y = -30,
            isEnabled = true,
            label = "Go Back",
            fontSize = 20,
            labelColor = { default={ 0.5, 0.5, 0 }, over={ 1, 0, 0, 0.25 } },
            onPress = goBack
        }
		-- Called when the scene is still off screen and is about to move on screen
		mainGroup = display.newGroup()  -- Display group for some assets
		--sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

		-- create a white background to fill screen
		background = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		background:setFillColor( 1 )	-- white

        title = display.newText( "Choose a Character", display.contentCenterX, display.contentCenterY / 8, "Centaur", 32 )
		title:setFillColor( 0.5, 0.5, 0.5 )

        --addCharacterButton = widget.newButton( options )
        addEnemyButton = widget.newButton( options2 )

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background )
        scrollView:insert(title)
        --mainGroup:insert(addCharacterButton)
        mainGroup:insert(addEnemyButton)


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
        --mainGroup:remove(addCharacterButton)
        mainGroup:remove(addEnemyButton)
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
    --addCharacterButton:removeSelf()
    mainGroup:removeSelf()
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene