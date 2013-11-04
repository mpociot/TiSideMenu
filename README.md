TiSideMenu
===========================================

** iOS 7 ONLY **

iOS 7 style side menu with parallax effect.

Wrapper module for the great [RESideMenu](https://github.com/romaonthego/RESideMenu)

<img src="https://github.com/mpociot/TiSideMenu/raw/master/Demo.gif" alt="RESideMenu Screenshot" width="320" height="568" />

### Usage

Use TiSideMenu as a replacement for your root window.

	var contentView = Ti.UI.createWindow({
		background: 'red'
	});
	
	var menuView    = Ti.UI.createWindow({
		background: 'transparent'
	});
	
	var win = TiSideMenu.createSideMenu({
		contentView: 		contentView,
		menuView: 			menuView,
		backgroundImage: 	'stars.png',
		contentViewScaleValue: 0.2,
		scaleContentView: true,		
		panGestureEnabled: false,	
		scaleBackgroundImageView: false,
		parallaxEnabled: false,
		// Blur settings
		blurBackground: true,
		tintColor: '#ffffff',
		radius: 20,
		iterations: 10
	});
	win.open();

### Configuration
	
* Enable / Disable the pan gesture 
	`win.setPanGestureEnabled( true / false );`
	
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

`win.presentMenuViewController()`

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

#### scaleBackgroundImageView

Type: `Boolean`  
Default: `true`

Should the background image view be scaled for showing the menu.

#### parallaxEnabled

Type: `Boolean`  
Default: `true`

Enable / disable the parallax effect.

#### blurBackground

Type: `Boolean`  
Default: `false`

Enable / disable the iOS 7 blur effect on the background image.

#### tintColor

Type: `Color`  
Default: `transparent`

The tinting color used for the background image.

#### blurRadius

Type: `Float`  
Default: `40`

The radius used for blurring the background image.





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



ABOUT THE AUTHOR
========================
I'm a web enthusiast located in Germany.

Follow me on twitter: @marcelpociot