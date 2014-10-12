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

-(void)windowDidOpen {
    [super windowDidOpen];
    [self reposition];
}

-(UIViewController *)_controller {
	return [(DeMarcelpociotSidemenuSideMenu*)[self view] controller];
}

-(TiUIView*)newView {
	return [[DeMarcelpociotSidemenuSideMenu alloc] init];
}

# pragma API

-(void)presentLeftMenuViewController:(id)args {
    TiThreadPerformOnMainThread(^{[(DeMarcelpociotSidemenuSideMenu*)[self view] presentLeftMenuViewController:args];}, NO);
}
-(void)presentRightMenuViewController:(id)args {
    TiThreadPerformOnMainThread(^{[(DeMarcelpociotSidemenuSideMenu*)[self view] presentRightMenuViewController:args];}, NO);
}

-(void)hideMenuViewController:(id)args {
    TiThreadPerformOnMainThread(^{[(DeMarcelpociotSidemenuSideMenu*)[self view] hideMenuViewController:args];}, NO);
}

# pragma Deleagte methods


- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    if ([self _hasListeners:@"willShowMenuViewController"]) {
        [self fireEvent:@"willShowMenuViewController" withObject:@{} propagate:YES];
    }
}
- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    if ([self _hasListeners:@"didShowMenuViewController"]) {
        [self fireEvent:@"didShowMenuViewController" withObject:@{} propagate:YES];
    }
}
- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    if ([self _hasListeners:@"willHideMenuViewController"]) {
        [self fireEvent:@"willHideMenuViewController" withObject:@{} propagate:YES];
    }
}
- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    if ([self _hasListeners:@"didHideMenuViewController"]) {
        [self fireEvent:@"didHideMenuViewController" withObject:@{} propagate:YES];
    }
}
@end
