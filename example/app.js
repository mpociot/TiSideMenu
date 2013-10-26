var TiSideMenu = require('de.marcelpociot.sidemenu');


var menuWin = Ti.UI.createWindow({
	backgroundColor:'transparent'
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
			win.setContentWindow(newWin);
			win.hideMenuViewController();
			break;
		case 3:
			win.setContentWindow( createContentWindow() );
			win.hideMenuViewController();
			break;
	}
});

function createContentWindow()
{
	var contentWin = Ti.UI.createWindow({
		backgroundColor:'#ddd',
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

	var navController = Ti.UI.iOS.createNavigationWindow({
		window : contentWin
	});
	return navController;
}

var win = TiSideMenu.createSideMenu({
	contentView: 		createContentWindow(),
	menuView: 			menuWin,
	backgroundImage: 	'stars.png'
});


win.open();