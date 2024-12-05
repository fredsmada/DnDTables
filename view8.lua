-----------------------------------------------------------------------------------------
--
-- view8.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

-- function to go to last view
	function goBack()
		composer.removeScene( "view8")
		composer.gotoScene( "menu" )
	end

textInsert = ""
initiativeList = {}
nameList = {}
for some = 1, 51 do
	nameList[some] = ""
	initiativeList[some] = 0
end
it = 1

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
		backgroundColor = { 0, 0, 0 }
		}
	)
	
	function scrollListener(event)
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

-- function to add a character to list
function addCharacter()
	if(it >= 2) then
		theList.text = ""
	end
	nameList[it] = tostring(addButtonText.text)
	initiativeList[it] = tonumber(addButtonText2.text)
	textInsert = textInsert .. addButtonText.text .. "  " .. addButtonText2.text .. "\n"
	theList = display.newText( textInsert, display.contentCenterX * 1.25, display.contentCenterY * 1.55 - (15 / it), "Centaur", 25 )
	theList:setFillColor( 0,0,0 )
	theList.text = textInsert
	it = it + 1
	print(theList.text)
end

i = 1

-- function to go to the next spot in list (for DM purposes)
function nextCharacter()
	if(i < it) then
		display.remove(turn)
		turn = display.newText( nameList[i] .. "'s Turn", display.contentCenterX, display.contentCenterY + 50, "Centaur", 20 )
		i = i + 1
	elseif (i == it) then
		i = 1
	end
	turn:setFillColor( 0,1,0,0.5 )
end

-- function to sort the list in descending order
function sortList()
	for i = 1, #initiativeList do
		largest = initiativeList[i]
		--table.sort(initiativeList)
		if(i >= 48) then
			-- Stop sorting
		elseif(initiativeList[i + 1] > initiativeList[i]) then
			nameList[49] = "" .. nameList[i]
			nameList[i] = "" .. nameList[i + 1]
			nameList[i + 1] = "" .. nameList[49]
			nameList[49] = ""
			initiativeList[49] = initiativeList[i]
			initiativeList[i] = initiativeList[i + 1]
			initiativeList[i + 1] = initiativeList[49]
			initiativeList[49] = 0
		end
	end
	theList.text = ""
	for i = 1, #initiativeList do
		-- Add player names to right side of screen
		--theList.text = nameList[i] .. "  " .. initiativeList[i] .. "\n"
		if(initiativeList[i] == 0) then
			-- do nothing
		else
			theList.text = theList.text .. nameList[i] .. " " .. initiativeList[i] .. "\n"
		end
	end
end

-- function to clear the list
function clearList()
	composer.removeScene("view8")
	composer.gotoScene("view8")
end

-- Listener to add text to textbox
local function textListener( event )

    if ( event.phase == "began" ) then
        -- User begins editing "defaultBox"
 
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
        -- Output resulting text from "defaultBox"
        --print( event.target.text )
 
    elseif ( event.phase == "editing" ) then
        -- print( event.newCharacters )
        -- print( event.oldText )
        -- print( event.startPosition )
        -- print( event.text )
    end
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
		--mainGroup = display.newGroup() 
		--sceneGroup:insert( scrollView ) 

		-- create a white background to fill screen
		background = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth * 2, display.actualContentHeight * 2 )
		background:setFillColor( 1 )	-- white

		title = display.newText( "Initiative Tracker", display.contentCenterX, display.contentCenterY / 6, "Centaur", 32 )
		title:setFillColor( 0.7, 0, 0 )

		options = {
			x = display.contentCenterX / 2,
			y = display.contentCenterY / 1.25,
			isEnabled = true,
			label = "Add Character",
			textOnly = true,
			labelColor = { default={ .5, 1, 0 }, over={ 0, 0, 0, 0.25 } },
			onPress = addCharacter
		}

		options2 = {
			x = display.contentCenterX / 2,
			y = display.contentCenterY,
			isEnabled = true,
			label = "Next",
			textOnly = true,
			labelColor = { default={ 1, 0.5, 0.25 }, over={ 0, 0, 1, 0.25 } },
			onPress = nextCharacter
		}

		options3 = {
			x = display.contentCenterX / 2,
			y = display.contentCenterY * 1.2,
			isEnabled = true,
			label = "Sort",
			textOnly = true,
			labelColor = { default={ 0.5, 0.5, 0.5 }, over={ 0, 0, 1, 0.25 } },
			onPress = sortList
		}

		options4 = {
			x = display.contentCenterX / 2,
			y = display.contentCenterY * 1.4,
			isEnabled = true,
			label = "Clear List",
			textOnly = true,
			labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.25 } },
			onPress = clearList
		}

		options5 = {
			x = display.contentCenterX * 1.75,
			y = 10,
			isEnabled = true,
			label = "Back",
			textOnly = true,
			labelColor = { default={ 1, 0, 0 }, over={ 0, 0, 1, 0.8 } },
			onPress = goBack
		}

		-- Buttons to manipulate list
		addButton = widget.newButton(options)
		nextButton = widget.newButton(options2)
		sortButton = widget.newButton(options3)
		clearButton = widget.newButton(options4)
		backButton = widget.newButton(options5)
		
		label1 = display.newText( "Enter Name", display.contentCenterX / 2.5, display.contentCenterY / 3, "Centaur", 20 )
		label1:setFillColor( 0,0,0)

		label2 = display.newText( "Enter Initiative", display.contentCenterX / 2.5, display.contentCenterY / 2, "Centaur", 20 )
		label2:setFillColor( 0,0,0)

		-- Create text box for name
		addButtonText = native.newTextBox(display.contentCenterX * 1.15, display.contentCenterY / 3, display.actualContentWidth / 2.5, 30)
		addButtonText.text = ""
		addButtonText.isEditable = true
		addButtonText:addEventListener( "userInput", textListener )
		addButtonText.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
		addButtonText.size = addButton.size

		-- Create text box for Initiative
		addButtonText2 = native.newTextBox(display.contentCenterX * 1.2, display.contentCenterY / 2, display.actualContentWidth / 4, 30)
		addButtonText2.text = ""
		addButtonText2.isEditable = true
		addButtonText2:addEventListener( "userInput", textListener )
		addButtonText2.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
		addButtonText2.size = addButton.size

		-- Add box for added players/mons
		theList = native.newTextBox(display.contentCenterX * 1.5, display.contentCenterY * 1.25, display.contentCenterX / 1.1, display.contentCenterY)
		theList.text = ""
		theList.isVisible = false
		theList.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
		theList.size = addButton.size
		theList:toBack()

	    -- all objects must be added to group (e.g. self.view). Number is zindex
		scrollView:insert( background )
		scrollView:insert( title )
		scrollView:insert( label1)
		scrollView:insert( label2)
		scrollView:insert( addButtonText )
		scrollView:insert( addButtonText2 )
		scrollView:insert( addButton )
		scrollView:insert( nextButton )
		scrollView:insert( sortButton )
		scrollView:insert( clearButton )
		scrollView:insert( backButton )
		scrollView:insert( theList )

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
	addButtonText:removeSelf()
	addButtonText2:removeSelf()
	scrollView:remove( background )
	scrollView:remove( title )
	scrollView:remove( label1)
	scrollView:remove( label2)
	scrollView:remove( addButton )
	scrollView:remove( nextButton )
	scrollView:remove( sortButton )
	scrollView:remove( clearButton )
	scrollView:remove( backButton )
	scrollView:remove( theList )
	display.remove(scrollView)
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene