//
//  gameviewController.h
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 02/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"
#import "AppDelegate.h"
#import "ThirdViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface GameViewController : UIViewController<UIAlertViewDelegate>
@property (assign)Board *game;
@property NSInteger firstPlayer,computerName;
-(void)buttonTitleSetting;
@end
