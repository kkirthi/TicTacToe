//
//  FirstViewController.h
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 09/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "GameViewController.h"

@interface FirstViewController : UIViewController
-(void)chooseSide:(UITapGestureRecognizer *)recognizer;
-(void)buttonPressed:(UIButton *)button;
-(void)navigateView;
-(void)chooseSymbol;
@end
