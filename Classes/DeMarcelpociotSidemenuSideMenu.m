/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "DeMarcelpociotSidemenuSideMenu.h"
#import "DeMarcelpociotSidemenuSideMenuProxy.h"
#import "TiUtils.h"
#import "TiViewController.h"
#import "TiUIiOSNavWindowProxy.h"

UIViewController * ControllerForViewProxy(TiViewProxy * proxy);

UIViewController * ControllerForViewProxy(TiViewProxy * proxy)
{
    [[proxy view] setAutoresizingMask:UIViewAutoresizingNone];
    
    //make the proper resize !
    TiThreadPerformOnMainThread(^{
        [proxy windowWillOpen];
        [proxy reposition];
        [proxy windowDidOpen];
    },YES);
    return [[TiViewController alloc] initWithViewProxy:proxy];
}

UINavigationController * NavigationControllerForViewProxy(TiUIiOSNavWindowProxy *proxy)
{
    return [proxy controller];
}

@implementation DeMarcelpociotSidemenuSideMenu


-(RESideMenu*)controller
{
    if (controller==nil)
	{
        // Check in centerWindow is a UINavigationController
        BOOL useNavController = FALSE;
        if([[[[self.proxy valueForUndefinedKey:@"contentView"] class] description] isEqualToString:@"TiUIiOSNavWindowProxy"]) {
            useNavController = TRUE;
        }
        
        // navController or TiWindow ?
        UIViewController *centerWindow = useNavController ? NavigationControllerForViewProxy([self.proxy valueForUndefinedKey:@"contentView"]) : ControllerForViewProxy([self.proxy valueForUndefinedKey:@"contentView"]);
        
		TiViewProxy *leftWindow                 = [self.proxy valueForUndefinedKey:@"menuView"];
        UIViewController *menuViewController    = ControllerForViewProxy(leftWindow);
        
        controller = [[RESideMenu alloc] initWithContentViewController:centerWindow
                                                    menuViewController:menuViewController];
        
        controller.backgroundImage = [TiUtils image:[self.proxy valueForUndefinedKey:@"backgroundImage"] proxy:self.proxy];
        
        // Check creation time parameters
        // setContentViewScaleValue
        [controller setContentViewScaleValue:[TiUtils floatValue:[self.proxy valueForUndefinedKey:@"contentViewScaleValue"] def:0.5]];
        
        [controller setScaleContentView:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"scaleContentView"] def:YES]];
        
        [controller setPanGestureEnabled:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"panGestureEnabled"] def:YES]];
        
        [controller setScaleBackgroundImageView:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"scaleBackgroundImageView"] def:YES]];
        
        [controller setParallaxEnabled:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"parallaxEnabled"] def:YES]];
        
        
        UIView * controllerView = [controller view];
        [controllerView setFrame:[self bounds]];
        [self addSubview:controllerView];
        
        [controller setDelegate:(DeMarcelpociotSidemenuSideMenuProxy *)[self proxy]];
        
        [controller viewWillAppear:NO];
        [controller viewDidAppear:NO];
	}
	return controller;
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
	[[[self controller] view] setFrame:bounds];
    [super frameSizeChanged:frame bounds:bounds];
}


-(void)setContentWindow_:(id)args
{
	ENSURE_UI_THREAD(setContentWindow_, args);
	BOOL useNavController = FALSE;
    if([[[args class] description] isEqualToString:@"TiUIiOSNavWindowProxy"]) {
        useNavController = TRUE;
    }
    UIViewController *centerWindow = useNavController ? NavigationControllerForViewProxy(args) : ControllerForViewProxy(args);
    [controller setContentViewController:centerWindow];
}

-(void)setMenuWindow_:(id)args
{
	ENSURE_UI_THREAD(setMenuWindow_, args);
	ENSURE_SINGLE_ARG(args, TiViewProxy);
	[controller setMenuViewController:args];
}

-(void)setContentViewScaleValue_:(id)args
{
    ENSURE_UI_THREAD(setContentViewScaleValue_, args);
    [controller setContentViewScaleValue:[TiUtils floatValue:args def:0.5]];
}

-(void)setScaleContentView_:(id)args
{
    ENSURE_UI_THREAD(setScaleContentView_, args);
    [controller setScaleContentView:[TiUtils boolValue:args]];
}

-(void)setPanGestureEnabled_:(id)args
{
    ENSURE_UI_THREAD(setPanGestureEnabled_, args);
    [controller setPanGestureEnabled:[TiUtils boolValue:args]];
}

-(void)setScaleBackgroundImageView_:(id)args
{
    ENSURE_UI_THREAD(setScaleBackgroundImageView_, args);
    [controller setScaleBackgroundImageView:[TiUtils boolValue:args]];
}

-(void)setParallaxEnabled_:(id)args
{
    ENSURE_UI_THREAD(setParallaxEnabled_, args);
    [controller setParallaxEnabled:[TiUtils boolValue:args]];
}

#pragma API
-(void)presentMenuViewController:(id)args
{
    ENSURE_UI_THREAD(presentMenuViewController,args);
    [controller presentMenuViewController];
}

-(void)hideMenuViewController:(id)args
{
    ENSURE_UI_THREAD(hideMenuViewController, args);
    [controller hideMenuViewController];
}


@end
