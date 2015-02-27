var TiSideMenu = require('de.marcelpociot.sidemenu');


var leftMenuWin = Ti.UI.createWindow({
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
leftMenuWin.add(leftTableView);


var rightMenuWin = Ti.UI.createWindow({
	backgroundColor:'transparent',
	statusBarStyle: Titanium.UI.iPhone.StatusBar.LIGHT_CONTENT
});
var rightTableView = Ti.UI.createTableView({
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
rightMenuWin.add(rightTableView);

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
	var toggleLeftMenuBtn = Ti.UI.createButton({
		title: 'LEFT'
	});
	contentWin.leftNavButton = toggleLeftMenuBtn;
	toggleLeftMenuBtn.addEventListener('click',function(e)
	{
		win.presentLeftMenuViewController();
	});

	var toggleRightMenuBtn = Ti.UI.createButton({
		title: 'RIGHT'
	});
	contentWin.rightNavButton = toggleRightMenuBtn;
	toggleRightMenuBtn.addEventListener('click',function(e)
	{
		win.presentRightMenuViewController();
	});

	// Module settings
	var scaleContentViewLabel = Ti.UI.createLabel({
		text: 'Scale content view:',
		top: 50,
		left: 10
	});
	var scaleContentViewBtn = Ti.UI.createSwitch({
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


	var scaleBackgroundImageViewLabel = Ti.UI.createLabel({
		text: 'Scale background image:',
		top: 100,
		left: 10
	});
	var scaleBackgroundImageViewBtn = Ti.UI.createSwitch({
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

	var scaleMenuViewLabel = Ti.UI.createLabel({
		text: 'Scale menu view:',
		top: 150,
		left: 10
	});
	var scaleMenuViewBtn = Ti.UI.createSwitch({
		value: true,
		top: 150,
		right: 10
	});
	contentWin.add( scaleMenuViewLabel );
	contentWin.add( scaleMenuViewBtn );
	scaleMenuViewBtn.addEventListener('change',function(e)
	{
		win.setScaleMenuView( scaleMenuViewBtn.value );
	});

	var parallaxLabel = Ti.UI.createLabel({
		text: 'Parallax enabled:',
		top: 200,
		left: 10
	});
	var parallaxBtn = Ti.UI.createSwitch({
		value: true,
		top: 200,
		right: 10
	});
	contentWin.add( parallaxLabel );
	contentWin.add( parallaxBtn );
	parallaxBtn.addEventListener('change',function(e)
	{
		win.setParallaxEnabled( parallaxBtn.value );
	});


	var panLabel = Ti.UI.createLabel({
		text: 'Pan gesture enabled:',
		top: 250,
		left: 10
	});
	var panBtn = Ti.UI.createSwitch({
		value: true,
		top: 250,
		right: 10
	});
	contentWin.add( panLabel );
	contentWin.add( panBtn );
	panBtn.addEventListener('change',function(e)
	{
		win.setPanGestureEnabled( panBtn.value );
	});

	var scaleLabel = Ti.UI.createLabel({
		text: 'Content View scale:',
		top: 300,
		left: 10
	});
	var scaleSlider = Titanium.UI.createSlider({
    	top: 340,
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
	leftMenuView: 		leftMenuWin,
	rightMenuView: 		rightMenuWin,
	backgroundImage: 	'stars.png',
	contentViewScaleValue: 0.2,
	scaleContentView: true,
	panGestureEnabled: true,
	panFromEdge: true,
	scaleBackgroundImageView: true,
	scaleMenuView: true,
	parallaxEnabled: true,
	// Blur options
	blurBackground: false,
	tintColor: '#ffffff',
	blurRadius: 0,
	iterations: 0
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
