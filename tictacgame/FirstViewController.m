//
//  FirstViewController.m
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 09/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import "FirstViewController.h"
#import "QuartzCore/Quartzcore.h"

@interface FirstViewController ()
@end
@implementation FirstViewController
{
    UIImageView *imageView;
    NSInteger y;
    UIImageView *image1,*image2;
    UILabel *label1;
    NSInteger flag1;
    BOOL tossWon;
    GameViewController *gameView;
    int x;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
	
}
-(void)viewWillAppear:(BOOL)animated
{
    x=0;
    image1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cointail.png"]];
    image2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"coinhead.png"]];
    label1=[[UILabel alloc] initWithFrame:CGRectMake(300,200,400,100)];
    label1.text=@"TAP TO CHOOSE";
    [self.view addSubview:label1];
    label1.backgroundColor=[UIColor clearColor];
    image1.layer.masksToBounds=YES;
    image2.layer.masksToBounds=YES;
    image1.frame=CGRectMake(100,400,100,100);
    image2.frame=CGRectMake(500,400, 100, 100);
    image1.layer.cornerRadius=image1.frame.size.width/2;
    image2.layer.cornerRadius=image2.frame.size.width/2;
    [image1 setUserInteractionEnabled:YES];
    image2.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseSide:)];
    [image1 addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseSide:)];
    [image2 addGestureRecognizer:tap2];
    [self.view addSubview:image1];
    [self.view addSubview:image2];
    y=arc4random()%2+20;
    UIImage *image = [UIImage imageNamed:@"cointail.png"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(220,320,300,300);
    imageView.layer.cornerRadius = imageView.frame.size.width/2;
    [imageView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(taptap)];
    [imageView addGestureRecognizer:tap];
    [tap release];
    [tap1 release];
    [tap2 release];
}
-(void)chooseSide:(UITapGestureRecognizer *)recognizer
{
    
    [image1 setUserInteractionEnabled:NO];
    [image1 setUserInteractionEnabled:NO];
    //NSLog(@"choose side");
    [UIView animateWithDuration:2 animations:^(void){
        UILabel *label2=[[UILabel alloc] initWithFrame:CGRectMake(100, 50,150,50)];
        UILabel *label3=[[UILabel alloc] initWithFrame:CGRectMake(500, 50,150,50)];
        label2.text=@"USER";
        label3.text=@"COMPUTER";
        [self.view addSubview:label2];
        [self.view addSubview:label3];
    if(recognizer.view==image1)
     {
        image1.frame=CGRectMake(100, 100, 100, 100);
        image2.frame=CGRectMake(500, 100, 100, 100);
        flag1=0;
     }
    else
    {
        image1.frame=CGRectMake(500, 100, 100, 100);
        image2.frame=CGRectMake(100, 100, 100, 100);
        flag1=1;
    }} completion:^(BOOL finished)
     {
         [self.view addSubview: imageView];
         [imageView release];
        label1.text=@"TAP TO TOSS";
         
     }
    
];
}
-(void)buttonPressed:(UIButton *)button
{
    NSLog(@"in if else");
if([button.titleLabel.text isEqual:@"X"])
{
    NSLog(@"pressed the x button");
    gameView.computerName=1;
}
else
    gameView.computerName=0;
    [self navigateView];
}
-(void)taptap
{
    [imageView setUserInteractionEnabled:NO];
    [  UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
                       animations:^(void) {
                           imageView.transform = CGAffineTransformMakeScale(0, 1);
    }
                       completion:^(BOOL finished) {
                           if(finished){
                               if(x%2 == 0)
                                   imageView.image = [UIImage imageNamed:@"coinhead.png"];
                               else
                                   imageView.image = [UIImage imageNamed:@"cointail.png"];
[UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
animations:^(void) {
        
imageView.transform = CGAffineTransformMakeScale(1, 1);
    
}
completion:^(BOOL finished) {
[UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionCurveEaseIn
animations:^(void)
 {
                                            
imageView.transform = CGAffineTransformMakeScale(0, 1);
}
completion:^(BOOL finished) {
    x++;
if(x<=y)
[self taptap];
else
{
if(x%2==0)
    imageView.image = [UIImage imageNamed:@"coinhead.png"];
else
imageView.image = [UIImage imageNamed:@"cointail.png"];
imageView.transform = CGAffineTransformMakeScale(1, 1);
if(y%2==1)
{
 if(flag1==0)
 {
label1.text=@"COMPUTER WON THE TOSS";
     tossWon=YES;
     [self performSelector:@selector(chooseSymbol) withObject:nil afterDelay:1.5];
 }
else
{
   label1.text=@"USER WON THE TOSS";
    tossWon=NO;
    [self chooseSymbol];
}
    label1.userInteractionEnabled=NO;
}
else
    {
        if(flag1==1)
        {
            label1.text=@"COMPUTER WON THE TOSS";
            tossWon=YES;
            [self performSelector:@selector(chooseSymbol) withObject:nil afterDelay:0.5];
        }
        else
        {
            label1.text=@"USER WON THE TOSS";
            tossWon=NO;
            [self chooseSymbol];
        }
        label1.userInteractionEnabled=NO;
    }
    ;
}
}];
                                                    
}];
}
}];
    
}
-(void)chooseSymbol
    {
        gameView=[[GameViewController alloc]init];
  if(tossWon)
  {
      gameView.computerName=y%2;
      gameView.firstPlayer=1;
      [self navigateView];
  }
  else
  {
      UILabel *label4=[[UILabel alloc]initWithFrame:(CGRectMake(300, 700, 400, 50))];
      label4.text=@"CHOOSE  X  OR  O";
      UIButton *button1=[[UIButton alloc]initWithFrame:(CGRectMake(100, 800, 100, 100))];
      UIButton *button2=[[UIButton alloc]initWithFrame:(CGRectMake(540,800,100,100))];
      button1.layer.cornerRadius=25;
      button2.layer.cornerRadius=25;
      button1.backgroundColor=[UIColor blackColor];
      button2.backgroundColor=[UIColor blackColor];
      [button1 setTitle:@"X" forState:UIControlStateNormal];
      [button2 setTitle:@"O" forState:UIControlStateNormal];
      [self.view addSubview:label4];
      gameView.firstPlayer=0;
      [button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [button2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [self.view addSubview:button1];
      [self.view addSubview:button2];
      NSLog(@"retain count of button %li",(unsigned long)button1.retainCount);
     [button1 release];
     [button2 release];
     [label4 release];
  }
}
-(void)navigateView
{
    NSLog(@"in navigate view");
  [image1 release];
  [image2 release];
  [label1 release];
    NSLog(@"after navigating vieew");
    NSArray *viewsToRemove = [self.view subviews];
    for (UIView *v in viewsToRemove)
    {
        [v removeFromSuperview];
    }
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.navigationController pushViewController:gameView animated:YES];
    [gameView release];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
