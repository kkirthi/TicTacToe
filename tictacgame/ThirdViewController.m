//
//  ThirdViewController.m
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 06/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"
@interface ThirdViewController ()
@end
@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"in third view");
    }
    return self;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *bgcolor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"summer-background-with-blurs-and-refelctions-5011096.jpg"]];
    self.view.backgroundColor=bgcolor;
    self.navigationItem.hidesBackButton=YES;
    UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(325,250,150,150)];
    textview.editable=NO;
    textview.text=@"game over";
    [self.view addSubview:textview];
    [textview release];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100,500,100,100)];
    button.backgroundColor=nil;
    [button setTitle:@"quit" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonpressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
    textview.backgroundColor=nil;
    textview.font=[UIFont systemFontOfSize:30];
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    UIImageView *imageViewForAnimation=[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageViewForAnimation.image=[UIImage imageNamed:@"smiley.png"];
    [self.view addSubview:imageViewForAnimation];
    CGRect pathrect=CGRectMake(200,200,300,300);
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(curvedPath, NULL,pathrect);
    pathAnimation.path = curvedPath;
    pathAnimation.repeatCount=10;
    pathAnimation.duration =2;
    CGPathRelease(curvedPath);
    [imageViewForAnimation.layer addAnimation:pathAnimation forKey:@"curveAnimation"];
    [imageViewForAnimation release];
    
    
}
-(void)buttonpressed
{
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
