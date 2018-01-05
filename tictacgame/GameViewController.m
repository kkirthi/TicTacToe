//
//  gameviewController.m
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 02/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import "GameviewController.h"
#import "Button.h"
@interface GameViewController ()
@end
@implementation GameViewController
{
    BOOL gamestatus2;
    NSInteger movemade,gamestatus;
    NSInteger flag,count1,count2;
    UILabel *label,*label2;
    UIButton *button[9];
    UIImageView *image;
    UIView *field1,*field2;
    NSString *username;
}
@synthesize firstPlayer,computerName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
       {
        count1=0;
        count2=0;
       }
    NSLog(@"in init of game");
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)buttonTitleSetting
{
    NSLog(@"in title setting");
    gamestatus=[self.game isGameComplete];
    if(!gamestatus)
    {
        gamestatus2=[self.game status];
        if(!gamestatus2)
        {
            movemade=[self.game isWinningPosition];
        if(movemade==-1)
        {
            movemade=[self.game isBlockingPosition];
        if(movemade==-1)
          movemade= [self.game move];
        }
        flag=1;
        [button[movemade] setTitle:self.game.compname forState:UIControlStateNormal];
        field1.backgroundColor=[UIColor whiteColor];
        field2.backgroundColor=[UIColor blackColor];
    }
    }
    if([self.game isGameComplete])
    {
        NSInteger line=[self.game isGameComplete];
        [self drawLine:line];
        NSLog(@"the line won %li",(long)line);
        if(field1.backgroundColor==[UIColor whiteColor])
         {
        
            UIAlertView *alertbox=[[UIAlertView alloc]initWithTitle:@"game won by computer" message:@"do you wish to continue" delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
        count2++;
        label2.text=[NSString stringWithFormat:@"No of games won by computer:%li",(long)count2];
        [alertbox show];
         }
        if(field2.backgroundColor==[UIColor whiteColor])
        {
                        UIAlertView *alertbox=[[UIAlertView alloc]initWithTitle:@"game won by user" message:@"do you wish to continue" delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
            count1++;
            label.text=[NSString stringWithFormat:@"No of games won by user:%li",(long)count1];
            [alertbox show];
        }
    }
    else
    {
    if([self.game status])
        {
            UIAlertView *alertbox=[[UIAlertView alloc]initWithTitle:@"game over draw" message:@"do you wish to continue" delegate:self cancelButtonTitle:@"no" otherButtonTitles:@"yes", nil];
            [alertbox show];
        }
    }
}
-(void)drawLine:(NSInteger)line
{
    image=[[UIImageView alloc]initWithFrame:self.view.frame];
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGContextRef ref=UIGraphicsGetCurrentContext();
    if(line==1||line==2||line==3)
    {
        CGContextMoveToPoint(ref,100,300+200*(line-1));
        CGContextSetLineWidth(ref,10);
        CGContextAddLineToPoint(ref,650,300+200*(line-1));
    }
    if(line==5||line==4||line==6)
    {
        CGContextMoveToPoint(ref,175+200*(line-4),225);
        CGContextSetLineWidth(ref,10);
        CGContextAddLineToPoint(ref,175+200*(line-4),775);
    }
    if(line==7)
    {
        CGContextMoveToPoint(ref,110,225);
        CGContextSetLineWidth(ref,10);
        CGContextAddLineToPoint(ref,650,775);
    }
    if(line==8)
    {
        CGContextMoveToPoint(ref,650,225);
        CGContextSetLineWidth(ref,10);
        CGContextAddLineToPoint(ref,100,775);
    }
    CGContextSetRGBStrokeColor(ref, 1,0, 0, 1);
    CGContextDrawPath(ref, kCGPathFillStroke);
    image.image=UIGraphicsGetImageFromCurrentImageContext();
    [self.view addSubview:image];

}
-(void)viewWillAppear:(BOOL)animated
{
   // [super viewDidLoad];
    UIImage *bgimage=[UIImage imageNamed:@"images.jpg"];
    UIColor *bgcolor=[UIColor colorWithPatternImage:bgimage];
    //FirstViewController *firstView=[[FirstViewController alloc]init];
    self.view.backgroundColor=bgcolor;
    int n,r;
    flag=1;
    if(image)
        [image removeFromSuperview];
    self.game=[[Board alloc]init];
    NSLog(@"in  view will appearbefore for");
    
    for(int i=0;i<9;i++)
    {
        n=i/3;
        r=i%3;
        button[i]=[[Button alloc]initWithFrame:CGRectMake(((2*r)+1)*100,((2*n))*100+225,150,150)];
        button[i].tag=i;
        [button[i] addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button[i]];
    }
    NSLog(@"in view will appaear");
    field1=[[UIView alloc]initWithFrame:CGRectMake(150,75,150,50)];
    field2=[[UIView alloc]initWithFrame:CGRectMake(450,75,150,50)];
    field1.backgroundColor=[UIColor whiteColor];
    field2.backgroundColor=[UIColor blackColor];
    [self.view addSubview:field1];
    [self.view addSubview:field2];
    field1.layer.cornerRadius=15;
    field2.layer.cornerRadius=15;
    UITextField *txt1=[[UITextField alloc]initWithFrame:CGRectMake(200,90,50,25)];
    txt1.text=@"user";
    txt1.userInteractionEnabled=NO;
    UITextField *txt2=[[UITextField alloc]initWithFrame:CGRectMake(480,90,100,25)];
    txt2.text=@"computer";
    txt2.userInteractionEnabled=NO;
    [self.view addSubview:txt1];
    [self.view addSubview:txt2];
    txt1.font=[UIFont systemFontOfSize:22.0f];
    txt1.background=nil;
    txt2.background=nil;
    txt2.font=[UIFont systemFontOfSize:22.0f];
    self.title=@"TicTacToe";
    UIView *scorebottom1=[[UIView alloc]initWithFrame:CGRectMake(150,810,400,50)];
    UIView *scorebottom2=[[UIView alloc]initWithFrame:CGRectMake(150,900,400,50)];
    scorebottom2.backgroundColor=[UIColor whiteColor];
    label=[[UILabel alloc]initWithFrame:CGRectMake(160,810,400,50)];
    label2=[[UILabel alloc]initWithFrame:CGRectMake(160,900,400,50)];
    scorebottom1.backgroundColor=[UIColor whiteColor];
    label2.text=[NSString stringWithFormat:@"No of games won by computer: %li",(long)count2];
    label.text=[NSString stringWithFormat:@"No of games won by user: %li",(long)count1];
    [self.view addSubview:scorebottom1];
    [self.view addSubview:scorebottom2];
    [self.view addSubview:label];
    [self.view addSubview:label2];
    NSLog(@"in view will appear");
    if(computerName)
    {
        self.game.compname=@"o";
        username=@"x";
    }
    else
    {
        self.game.compname=@"x";
        username=@"o";
    }
   if(firstPlayer)
    {
        //NSLog(@"in this loop %li",firstPlayer);
      [self buttonTitleSetting];
        
    }
    self.navigationItem.hidesBackButton=YES;
    NSLog(@"in view willappear end");
    }
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"view did appear");
}
-(void)buttonPressed:(UIButton *)b1
{
    if(flag==1)
    {
        flag=0;
        NSLog(@"flag is set to zero");
        gamestatus2=[self.game setBoard:b1.tag];
        if(gamestatus2)
        {
            [b1 setTitle:username forState:UIControlStateNormal];
            field1.backgroundColor=[UIColor blackColor];
            field2.backgroundColor=[UIColor whiteColor];
            [self performSelector:@selector(buttonTitleSetting) withObject:nil afterDelay:0.5];
        }
        else
        flag=1;
        NSLog(@"at the end of button presssed");
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   for(NSInteger c=0;c<9;c++)
    {
        [button[c] release];
        
    }
    [field1 release];
    [field2 release];
    [label release];
    [label2 release];

    NSArray *viewsToRemove = [self.view subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    
 if(buttonIndex==1)
 {
     [self viewWillAppear:NO];
}
 if(buttonIndex==0)
 {
     [self navigateView];
}
}
-(void)navigateView
{
   
AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.navigationController pushViewController:[[ThirdViewController alloc]init] animated:YES];
}
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
