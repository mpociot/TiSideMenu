/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "DeMarcelpociotSidemenuSideMenuProxy.h"
#import "TiBase.h"
#import "TiApp.h"
#import "TiUtils.h"

@implementation DeMarcelpociotSidemenuSideMenuProxy


-(UIViewController *)_controller {
	return [(DeMarcelpociotSidemenuSideMenu*)[self view] controller];
}

-(TiUIView*)newView {
	return [[DeMarcelpociotSidemenuSideMenu alloc] init];
}

# pragma API

-(void)presentMenuViewController:(id)args {
    TiThreadPerformOnMainThread(^{[(DeMarcelpociotSidemenuSideMenu*)[self view] presentMenuViewController:args];}, NO);
}

-(void)hideMenuViewController:(id)args {
    TiThreadPerformOnMainThread(^{[(DeMarcelpociotSidemenuSideMenu*)[self view] hideMenuViewController:args];}, NO);
}

@end
