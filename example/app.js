var TiSideMenu = require('de.marcelpociot.sidemenu');


var menuWin = Ti.UI.createWindow({
	backgroundColor:'transparent',
	statusBarStyle: Titanium.UI.iPhone.StatusBar.LIGHT_CONTENT
});
var leftTableView = Ti.UI.createTableView({
	top: 100,
	font:{fontSize:12,color: '#ffffff'},
	rowHeight:40,
	backgroundColor:'transparent',
	data:[
		{title:'Row 1',color: 'white'},
		{title:'Row 2',color: 'white'},  
		{title:'Change Center Window',color: 'white'},
		{title:'Push new Window',color: 'white'},
		{title:'Reset Window',color: 'white'}
	]
});
menuWin.add(leftTableView);
leftTableView.addEventListener("click", function(e){
	switch(e.index){
		case 0:
		case 1:
			win.hideMenuViewController();
			alert("You clicked " + e.rowData.title + ".");
			break;
		case 2:
			var newWin = Ti.UI.createWindow({
				backgroundColor:'red'
			});
			win.setContentWindow({
				window: newWin,
				animated: true 
			});
			win.hideMenuViewController();
			break;
		case 3:
			var newWin = Ti.UI.createWindow({
				backgroundColor:'red'
			});
			contentWindow.openWindow(newWin);
			win.hideMenuViewController();
			break;
		case 4:
			win.setContentWindow( createContentWindow() );
			win.hideMenuViewController();
			break;
	}
});

function createContentWindow()
{
	var contentWin = Ti.UI.createWindow({
		backgroundColor:'transparent',
		title:"RE Side Menu",
		barColor:"#f7f7f7"
	});
	toggleMenuBtn = Ti.UI.createButton({
		title: 'MENU'
	});
	contentWin.leftNavButton = toggleMenuBtn;
	toggleMenuBtn.addEventListener('click',function(e)
	{
		win.presentMenuViewController();
	});

	// Module settings
	scaleContentViewLabel = Ti.UI.createLabel({
		text: 'Scale content view:',
		top: 50,
		left: 10
	})
	scaleContentViewBtn = Ti.UI.createSwitch({
		value: true,
		top: 50,
		right: 10
	});
	contentWin.add( scaleContentViewLabel );
	contentWin.add( scaleContentViewBtn );
	scaleContentViewBtn.addEventListener('change',function(e)
	{
		win.setScaleContentView( scaleContentViewBtn.value );
	});


	scaleBackgroundImageViewLabel = Ti.UI.createLabel({
		text: 'Scale background image:',
		top: 100,
		left: 10
	})
	scaleBackgroundImageViewBtn = Ti.UI.createSwitch({
		value: true,
		top: 100,
		right: 10
	});
	contentWin.add( scaleBackgroundImageViewLabel );
	contentWin.add( scaleBackgroundImageViewBtn );
	scaleBackgroundImageViewBtn.addEventListener('change',function(e)
	{
		win.setScaleBackgroundImageView( scaleBackgroundImageViewBtn.value );
	});

	parallaxLabel = Ti.UI.createLabel({
		text: 'Parallax enabled:',
		top: 150,
		left: 10
	})
	parallaxBtn = Ti.UI.createSwitch({
		value: true,
		top: 150,
		right: 10
	});
	contentWin.add( parallaxLabel );
	contentWin.add( parallaxBtn );
	parallaxBtn.addEventListener('change',function(e)
	{
		win.setParallaxEnabled( parallaxBtn.value );
	});


	panLabel = Ti.UI.createLabel({
		text: 'Pan gesture enabled:',
		top: 200,
		left: 10
	});
	panBtn = Ti.UI.createSwitch({
		value: true,
		top: 200,
		right: 10
	});
	contentWin.add( panLabel );
	contentWin.add( panBtn );
	panBtn.addEventListener('change',function(e)
	{
		win.setPanGestureEnabled( panBtn.value );
	});

	scaleLabel = Ti.UI.createLabel({
		text: 'Content View scale:',
		top: 250,
		left: 10
	})
	var scaleSlider = Titanium.UI.createSlider({
    	top: 290,
    	min: 0,
    	max: 100,
    	width: '100%',
    	value: 50
    });
	contentWin.add( scaleLabel );
	contentWin.add( scaleSlider );
	scaleSlider.addEventListener('change', function(e) {
	    win.setContentViewScaleValue( e.value / 100 );
	});


	var navController = Ti.UI.iOS.createNavigationWindow({
		statusBarStyle: Titanium.UI.iPhone.StatusBar.LIGHT_CONTENT,
		window : contentWin
	});
	return navController;
}
var contentWindow = createContentWindow();
var win = TiSideMenu.createSideMenu({
	contentView: 		contentWindow,
	menuView: 			menuWin,
	backgroundImage: 	'stars.png',
	contentViewScaleValue: 0.2,
	scaleContentView: true,
	panGestureEnabled: true,
	scaleBackgroundImageView: true,
	parallaxEnabled: true,
	// Blur options
	blurBackground: true,
	tintColor: '#ffffff',
	blurRadius: 20,
});


win.addEventListener("willShowMenuViewController",function()
{
	//alert("Will show menu view controller");
});

win.addEventListener("didShowMenuViewController",function()
{
	//alert("Did show menu view controller");
});

win.addEventListener("willHideMenuViewController",function()
{
	//alert("Will hide menu view controller");
});

win.addEventListener("didHideMenuViewController",function()
{
	//alert("Did hide menu view controller");
});


win.open();