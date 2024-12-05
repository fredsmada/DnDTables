-----------------------------------------------------------------------------------------
--
-- viewCharacter.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

addButtonText = native.newTextBox(display.contentCenterX - 330, display.contentCenterY - 70, 100, 30)
addButtonText2 = native.newTextBox(display.contentCenterX - 200, display.contentCenterY - 70, 100, 30)

textInsert = ""
initiativeList = {}
nameList = {}
for some = 1, 50 do
	nameList[some] = ""
	initiativeList[some] = 0
end
it = 1

-- function to add a character to list
function newCharacter()
	if(it >= 2) then
		theList.text = ""
	end
	nameList[it] = tostring(addButtonText.text)
	initiativeList[it] = tonumber(addButtonText2.text)
	textInsert = textInsert .. addButtonText.text .. "  " .. addButtonText2.text .. "\n"
	theList = display.newText( textInsert, display.contentCenterX + 185, 25 + (15 * it), "Centaur", 25 )
	theList:setFillColor( 0,0,0 )
	--theList.text = textInsert
	it = it + 1
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
	--theList.text = ""
	for i = 1, 50 do
		if(initiativeList[i] == 0) then
			-- do nothing
		else
			--table.sort(initiativeList)
			if(initiativeList[i + 1] > initiativeList[i]) then
				nameList[49] = nameList[i]
				nameList[i] = nameList[i + 1]
				nameList[i + 1] = nameList[49]
				nameList[49] = 0
				initiativeList[49] = initiativeList[i]
				initiativeList[i] = initiativeList[i + 1]
				initiativeList[i + 1] = initiativeList[49]
				initiativeList[49] = 0
			end
			-- Add player names to right side of screen
			-- if (initiativeList[i] ~= 0) then
			-- 	theList.text = ""
			-- 	theList.text = nameList[i] .. " " .. initiativeList[i] .. "\n"
			-- end
			--theList.text = theList.text .. nameList[i] .. " " .. initiativeList[i] .. "\n"
		end
	end
end

-- function to clear the list
function clearList()
	for some = 1, 50 do
		initiativeList[some] = 0
	end
	it = 1
	composer.removeScene( "view8")
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

function scene:create( event )
	local sceneGroup = self.view
	-- Called when scene is created
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
 
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
		mainGroup = display.newGroup() 
		sceneGroup:insert( mainGroup ) 

        sceneGroup.rotation = 90;

		-- create a white background to fill screen
		--background = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight )
        background = display.newRect( 0, 0, display.actualContentHeight + 400, display.actualContentWidth + 400 )
        background:setFillColor( 1 )	-- white

		title = display.newText( "Character Creator", display.contentCenterX - 100, -520, "Centaur", 32 )
		title:setFillColor( 0, 0.2, 1 )

		options = {
			x = display.contentCenterX - 100,
			y = -420,
			isEnabled = true,
			label = "New Character",
			labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.25 } },
			onPress = newCharacter
		}

		options2 = {
			x = display.contentCenterX - 100,
			y = -320,
			isEnabled = true,
			label = "Load Character",
			labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.25 } },
			onPress = nextCharacter
		}

		options3 = {
			x = display.contentCenterX - 100,
			y = -220,
			isEnabled = true,
			label = "Random Character",
			labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.25 } },
			onPress = sortList
		}


		-- Buttons to manipulate list
		addButton = widget.newButton(options)
		nextButton = widget.newButton(options2)
		sortButton = widget.newButton(options3)

		-- Boxes to make button look more like a button
		local buttonBox = display.newRect( display.contentCenterX - 100, -420, 140, 45 )
		buttonBox:setFillColor( 0.1,0.1,0.1,0.5 )
		local buttonBox2 = display.newRect( display.contentCenterX - 100, -320, 140, 45 )
		buttonBox2:setFillColor( 0,0.5,0,0.5 )
		local buttonBox3 = display.newRect( display.contentCenterX - 100, -220, 160, 45 )
		buttonBox3:setFillColor( 0.5,0,0,0.5 )

		label1 = display.newText( "Enter Name", display.contentCenterX - 200, display.contentCenterY - 100, "Centaur", 15 )
		label1:setFillColor( 0,0,0)

		label2 = display.newText( "Enter Initiative", display.contentCenterX - 200, display.contentCenterY - 30, "Centaur", 15 )
		label2:setFillColor( 0,0,0)

		display.remove(addButtonText)
		display.remove(addButtonText2)

		-- Create text box for name
		addButtonText = native.newTextBox(display.contentCenterX - 200, display.contentCenterY - 70, 100, 30)
		addButtonText.text = ""
		addButtonText.isEditable = true
		addButtonText:addEventListener( "userInput", textListener )
		addButtonText.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
		addButtonText.size = addButton.size

		-- Create text box for Initiative
		addButtonText2 = native.newTextBox(display.contentCenterX - 200, display.contentCenterY, 100, 30)
		addButtonText2.text = ""
		addButtonText2.isEditable = true
		addButtonText2:addEventListener( "userInput", textListener )
		addButtonText2.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
		addButtonText2.size = addButton.size

		-- Add box for added players/mons
		-- theList = native.newTextBox(display.contentCenterX + 200, 100, 170, 165)
		-- theList.text = ""
		-- theList.isEditable = false
		-- theList.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
		-- theList.size = addButton.size
		-- theList:toBack()

	    -- all objects must be added to group (e.g. self.view). Number is zindex
		mainGroup:insert( 1, background )
		mainGroup:insert( 2, title )
		mainGroup:insert( 2, addButtonText)
		mainGroup:insert( 2, addButtonText2)
		mainGroup:insert( 2, label1)
		mainGroup:insert( 2, label2)
		mainGroup:insert( 3, buttonBox )
		mainGroup:insert( 3, buttonBox2)
		mainGroup:insert( 3, buttonBox3)
		mainGroup:insert( 4, addButton )
		mainGroup:insert( 4, nextButton )
		mainGroup:insert( 4, sortButton )
		--mainGroup:insert( 5, theList )

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
		display.remove(title)
		display.remove(background)
		display.remove(label1)
		display.remove(label2)
		display.remove(addButtonText)
		display.remove(addButtonText2)
		display.remove(buttonBox)
		display.remove(buttonBox2)
		display.remove(buttonBox3)
		display.remove(buttonBox4)
		display.remove(addButton)
		display.remove(nextButton)
		display.remove(backButton)
		display.remove(theList)
		display.remove(turn)
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