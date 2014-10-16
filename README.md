TiSideMenu
===========================================

** iOS 7 / 8 ONLY **

iOS 7 / 8 style side menu with parallax effect.

Wrapper module for the great [RESideMenu](https://github.com/romaonthego/RESideMenu)

Since 1.2 this module supports both left and right menu views.


<img src="https://github.com/mpociot/TiSideMenu/raw/master/Demo.gif" alt="RESideMenu Screenshot" width="320" height="568" />

### Usage

Use TiSideMenu as a replacement for your root window.

	var contentView = Ti.UI.createWindow({
		background: 'red'
	});
	
	var leftMenuView    = Ti.UI.createWindow({
		background: 'transparent'
	});
	var rightMenuView    = Ti.UI.createWindow({
		background: 'transparent'
	});
	
	var win = TiSideMenu.createSideMenu({
		contentView: 		contentView,
		leftMenuView: 		leftMenuView,
		rightMenuView: 		rightMenuView,
		backgroundImage: 	'stars.png',
		contentViewScaleValue: 0.2,
		scaleContentView: true,		
		panGestureEnabled: false,	
		scaleBackgroundImageView: false,
		parallaxEnabled: false,
		panFromEdge: true,
	});
	win.open();
	
### Replacing the content window

* Setting the content window without animation `Default`

		win.setContentWindow(newWin);
	
* Setting the content window with an animation

		win.setContentWindow({
				window: newWin,
				animated: true 
		});
		
### Alloy

To use this module within Alloy, please take a look at this repository: [de.marcelpociot.alloysidemenu](https://github.com/manumaticx/de.marcelpociot.alloysidemenu)
	
		
### Known issues
If the slide animation is enabled, a bug exists where an incomplete slide results in opening empty windows through a navigation / tabgroup. 
To resolve this issue be sure to manually hide the side Menu before opening the new window.

`win.hideMenuViewController();`


### Configuration
	
* Enable / Disable the pan gesture 
	`win.setPanGestureEnabled( true / false );`
	
* Enable / Disable then pan from the edge
	`win.setPanFromEdge( true / false ); `

* Enable / Disable Parallax effect	
	`win.setParallaxEnabled( true / false ); `
	
* Enable / Disable Background image scaling
	`win.setScaleBackgroundImageView( true / false );`
	
* Enable / Disable Content view scaling
	`win.setScaleContentView( true / false );`
	
* Set the content view scale value
	`win.setContentViewScaleValue( 0.0 - 1.0 );`

Manually showing / hiding the menu:

`win.hideMenuViewController()`

`win.presentLeftMenuViewController()`

`win.presentRightMenuViewController()`

### Options


#### backgroundImage

Type: `Blog / Image URL`  
Default: `empty String`

Background image to use for the menu.

#### contentViewScaleValue

Type: `Float`  
Default: `0.5`

Scale value used for the content view when the menu is shown.

#### scaleContentView

Type: `Boolean`  
Default: `true`

Should the content view be scaled when the menu gets displayed.


#### panGestureEnabled

Type: `Boolean`  
Default: `true`

Should the pan gesture be available for showing the menu.

#### panFromEdge

Type: `Boolean`  
Default: `false`

Should the pan gesture only trigger when it starts from the edge

#### scaleBackgroundImageView

Type: `Boolean`  
Default: `true`

Should the background image view be scaled for showing the menu.

#### parallaxEnabled

Type: `Boolean`  
Default: `true`

Enable / disable the parallax effect.



Events
===

	
	win.addEventListener("willShowMenuViewController",function()
	{
		alert("Will show menu view controller");
	});

	win.addEventListener("didShowMenuViewController",function()
	{
		alert("Did show menu view controller");
	});

	win.addEventListener("willHideMenuViewController",function()
	{
		alert("Will hide menu view controller");
	});

	win.addEventListener("didHideMenuViewController",function()
	{
		alert("Did hide menu view controller");
	});


Changelog
===
#### 2.0
* Added iOS 8 support
* Removed the build-in blur APIs as they where crushing the battery
* Updated to the latest RESideMenu Version

#### 1.2
* Added support for left and right menu views


ABOUT THE AUTHOR
========================
I'm a web enthusiast located in Germany.

Follow me on twitter: @marcelpociot


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/mpociot/tisidemenu/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

