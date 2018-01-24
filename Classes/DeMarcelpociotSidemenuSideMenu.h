/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"
#import "TiBase.h"
#import "RESideMenu.h"

UIViewController * ControllerForProxy(TiViewProxy * proxy);

@interface DeMarcelpociotSidemenuSideMenu : TiUIView {

@private
    RESideMenu *controller;
}
-(RESideMenu*)controller;

-(void)presentLeftMenuViewController:(id)args;
-(void)presentRightMenuViewController:(id)args;
-(void)hideMenuViewController:(id)args;


@end
