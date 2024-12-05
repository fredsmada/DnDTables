-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar( display.DefaultStatusBar )

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"
local dbfunc = require ("copyDBto")

local function onMenuView( event )
	composer.removeScene( "Previous")
	composer.gotoScene( "menu" )
end


-- event listeners for tab buttons:
local function onFirstView( event )
	composer.removeScene( "Previous")
	composer.gotoScene( "view1" )
end

local function onSecondView( event )
	composer.removeScene( "Previous")
	composer.gotoScene( "view2" )
end

local function onThirdView( event )
	composer.removeScene( "Previous")
	composer.gotoScene( "view3" )
end

local function onFourthView( event )
	composer.gotoScene( "view4" )
end

local function onFifthView( event )
	composer.gotoScene( "view5" )
end

local function onSixthView( event )
	composer.gotoScene( "view6" )
end

local function onSeventhView( event )
	composer.gotoScene( "view7" )
end

local function onEighthView( event )
	composer.gotoScene( "view8" )
end

local function onNinthView( event )
	composer.gotoScene( "view9" )
end

local function onTenthView( event )
	composer.gotoScene( "view10" )
end

local function onCharacterView( event )
	composer.gotoScene( "viewCharacter" )
end

local function onNewCharacterView( event )
	composer.gotoScene( "viewNewCharacter" )
end

local function onOpenMenu( event )
	composer.gotoScene( "openMenu" )
end

local function onMapView( event )
	composer.gotoScene( "main" )
end

local function onWidgetView( event )
	composer.gotoScene( "addWidget" )
end

local scrollView = widget.newScrollView({
	top = display.safeActualContentHeight,
	left = -50,
	width = display.safeActualContentWidth + 50,
	verticalScrollDisabled = true,
	backgroundColor = { 0.5, 0.5, 0.5 },
 });

 options4 = {
	x = display.contentCenterX,
	y = display.safeActualContentHeight - 250,
	isEnabled = true,
	label = "Clear List",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 1, 0.25 } },
	onPress = clearList
}

-- Buttons to manipulate list
addButton = widget.newButton(options)
scrollView:insert(addButton)


-- create a tabBar widget with two buttons at the bottom of the screen

-- table to setup buttons
tabButtons = {
	{ label="Exp", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onFirstView, selected=true },
	{ label="Armor", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onSecondView },
	{ label="Weapons", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onThirdView },
	{ label="Treasure 0-4", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onFourthView },
	{ label="Treasure 5-10", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onFifthView },
}

tabButtons2 = {
	{ label="Treasure 11-16", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onSixthView },
	{ label="Treasure 17+", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onSeventhView },
	{ label="Initiative", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onEighthView },
	{ label="Monsters: Area", defaultFile="button2.png", overFile="button2-down.png", width = 32, height = 32, onPress=onNinthView },
	{ label="Monsters: CR", defaultFile="button1.png", overFile="button1-down.png", width = 32, height = 32, onPress=onTenthView },
}

-- -- create the actual tabBar widget
-- local tabBar = widget.newTabBar{
-- 	top = display.contentHeight - 100,	-- 50 is default height for tabBar widget
-- 	left = -50,
-- 	buttons = tabButtons,
-- 	width = display.safeActualContentWidth
-- }

-- -- create the second tabBar widget
-- local tabBar = widget.newTabBar{
-- 	top = display.contentHeight - 50,	-- 50 is default height for tabBar widget
-- 	left = -50,
-- 	buttons = tabButtons2,
-- 	width = display.safeActualContentWidth
-- }

--onNewCharacterView()	-- invoke first tab button's onPress event manually
--onEighthView()
onMenuView()
--onMapView()