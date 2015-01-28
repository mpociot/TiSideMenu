/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "DeMarcelpociotSidemenuSideMenu.h"
#import "DeMarcelpociotSidemenuSideMenuProxy.h"
#import "TiUtils.h"
#import "TiApp.h"
#import "TiViewController.h"
#import "TiUIiOSNavWindowProxy.h"

UIViewController * TiSideMenuControllerForViewProxy(TiViewProxy * proxy);

UIViewController * TiSideMenuControllerForViewProxy(TiViewProxy * proxy)
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

UINavigationController * TiSideMenuNavigationControllerForViewProxy(TiUIiOSNavWindowProxy *proxy)
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
        UIViewController *centerWindow = useNavController ? TiSideMenuNavigationControllerForViewProxy([self.proxy valueForUndefinedKey:@"contentView"]) : TiSideMenuControllerForViewProxy([self.proxy valueForUndefinedKey:@"contentView"]);
        
		TiViewProxy *leftWindow                 = [self.proxy valueForUndefinedKey:@"leftMenuView"];
		TiViewProxy *rightWindow                = [self.proxy valueForUndefinedKey:@"rightMenuView"];
        UIViewController *leftMenuViewController    = TiSideMenuControllerForViewProxy(leftWindow);
        UIViewController *rightMenuViewController    = TiSideMenuControllerForViewProxy(rightWindow);
        
        controller = [[RESideMenu alloc]    initWithContentViewController:centerWindow
                                                   leftMenuViewController:leftMenuViewController
                                                  rightMenuViewController:rightMenuViewController];
        
        
        bool blurView = [TiUtils boolValue:[self.proxy valueForUndefinedKey:@"blurBackground"] def:NO];
        UIImage *backgroundImageView = [TiUtils image:[self.proxy valueForUndefinedKey:@"backgroundImage"] proxy:self.proxy];
        controller.tintColor            = [TiUtils colorValue:[self.proxy valueForUndefinedKey:@"tintColor"]].color;
        controller.backgroundImage      = backgroundImageView;
        
        // Check creation time parameters
        // setContentViewScaleValue
        [controller setContentViewScaleValue:[TiUtils floatValue:[self.proxy valueForUndefinedKey:@"contentViewScaleValue"] def:0.5]];
        
        [controller setScaleContentView:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"scaleContentView"] def:YES]];
        
        [controller setPanGestureEnabled:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"panGestureEnabled"] def:YES]];
        
        [controller setLeftPanEnabled:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"leftPanEnabled"] def:YES]];

        [controller setRightPanEnabled:[TiUtils boolValue:[self.proxy valueForUndefinedKey:@"rightPanEnabled"] def:YES]];

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
    id window;
    BOOL animated = FALSE;
    if( [args respondsToSelector:@selector(objectForKey:)] )
    {
        window      = [args objectForKey:@"window"];
        animated    = [TiUtils boolValue:[args objectForKey:@"animated"] def:FALSE];
    } else {
        window = args;
    }
	BOOL useNavController = FALSE;
    if([[[window class] description] isEqualToString:@"TiUIiOSNavWindowProxy"]) {
        useNavController = TRUE;
    }
    UIViewController *centerWindow = useNavController ? TiSideMenuNavigationControllerForViewProxy(window) : TiSideMenuControllerForViewProxy(window);
    [controller setContentViewController:centerWindow animated:animated];
}

-(void)setLeftMenuWindow_:(id)args
{
    ENSURE_UI_THREAD(setLeftMenuWindow_, args);
    ENSURE_SINGLE_ARG(args, TiViewProxy);
    [controller setLeftMenuViewController:args];
}

-(void)setRightMenuWindow_:(id)args
{
    ENSURE_UI_THREAD(setRightMenuWindow_, args);
    ENSURE_SINGLE_ARG(args, TiViewProxy);
    [controller setRightMenuViewController:args];
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

-(void)setPanFromEdge_:(id)args
{
    ENSURE_UI_THREAD(setPanFromEdge_, args);
    [controller setPanFromEdge:[TiUtils boolValue:args]];
}

-(void)setMenuPrefersStatusBarHidden_:(id)args
{
    ENSURE_UI_THREAD(setMenuPrefersStatusBarHidden_, args);
    [controller setMenuPrefersStatusBarHidden:[TiUtils boolValue:args]];
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

-(void)setLeftPanEnabled_:(id)args
{
    ENSURE_UI_THREAD(setLeftPanEnabled_, args);
    [controller setLeftPanEnabled:[TiUtils boolValue:args]];
}

-(void)setRightPanEnabled_:(id)args
{
    ENSURE_UI_THREAD(setRightPanEnabled_, args);
    [controller setRightPanEnabled:[TiUtils boolValue:args]];
}

#pragma API
-(void)presentLeftMenuViewController:(id)args
{
    ENSURE_UI_THREAD(presentLeftMenuViewController,args);
    [controller presentLeftMenuViewController];
}
-(void)presentRightMenuViewController:(id)args
{
    ENSURE_UI_THREAD(presentRightMenuViewController,args);
    [controller presentRightMenuViewController];
}

-(void)hideMenuViewController:(id)args
{
    ENSURE_UI_THREAD(hideMenuViewController, args);
    [controller hideMenuViewController];
}


@end
