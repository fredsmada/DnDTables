-----------------------------------------------------------------------------------------
--
-- map.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
scene = composer.newScene()
local widget = require( "widget" )

-- function to go back
function goBack()
    composer.removeScene( "map")
    composer.gotoScene( "menu" )
end

-- function to go to widget screen
function addWidget()
    composer.removeScene( "map")
    composer.gotoScene( "addWidget" )
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

	function zoomIn()
		image.width = image.width * 1.5
		image.height = image.height * 1.5
		image.x = image.x * 1.5
		image.y = image.y * 1.5
		scrollView:setScrollWidth( image.width * 1.5 )
		scrollView:setScrollHeight( image.height * 1.5 )
	end

	function zoomOut()
		image.width = image.width / 1.5
		image.height = image.height / 1.5
		image.x = image.x / 1.5
		image.y = image.y / 1.5
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
           x = display.contentCenterX / 3,
           y = -30,
           isEnabled = true,
           label = "Add Widget",
           labelColor = { default={ 0.75, 0.75, 0.75 }, over={ 0, 0, 1, 0.25 } },
           onPress = addWidget
        }
	    options2 = {
			x = display.contentCenterX,
			y = -30,
			isEnabled = true,
			label = "Zoom In +",
			labelColor = { default={ 0.5, 0.75, 0 }, over={ 0, 0, 1, 0.25 } },
			onPress = zoomIn
		}
	    options3 = {
			x = display.contentCenterX * 1.65,
			y = -30,
			isEnabled = true,
			label = "Zoom Out -",
			labelColor = { default={ 0.5, 0.5, 1 }, over={ 0, 0, 1, 0.25 } },
			onPress = zoomOut
		}options4 = {
            x = display.contentCenterX,
            y = -60,
            isEnabled = true,
            label = "Go Back",
            labelColor = { default={ 0.5, 0.5, 0 }, over={ 1, 0, 0, 0.25 } },
            onPress = goBack
        }

		-- Called when the scene is still off screen and is about to move on screen
		mainGroup = display.newGroup()  -- Display group for some assets
		sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

		-- create a white background to fill screen
		-- background = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
		-- background:setFillColor( 1 )	-- white

        -- Add buttons to manipulate the map
        addButton = widget.newButton(options)
        zoomIn = widget.newButton(options2)
        zoomOut = widget.newButton(options3)
        backButton = widget.newButton(options4)

        image = display.newImageRect( "images/croc_map.jpg", system.DocumentsDirectory, 1200, 921 )
        image.x = display.contentCenterX * 4
        image.y = display.contentCenterY * 1.75

	    -- all objects must be added to group (e.g. self.view)
		scrollView:insert( background )
		scrollView:insert( image )
		mainGroup:insert( addButton )
		mainGroup:insert( backButton )
		mainGroup:insert( zoomIn )
		mainGroup:insert( zoomOut )
		-- for i = 1,#mapCharacter.character,1 do
		-- 	scrollView:insert(character[i])
		-- end
		-- for i = 1,#character,1 do
		-- 	scrollView:insert(character[i])
		-- end

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
		--scrollView:remove( background )
		scrollView:remove( addButton )
		scrollView:remove( backButton )
		mainGroup:remove( addButton )
		mainGroup:remove( zoomIn )
		mainGroup:remove( zoomOut )
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