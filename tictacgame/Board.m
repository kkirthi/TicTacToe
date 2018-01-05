//
//  board.m
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 02/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import "Board.h"

@implementation Board
@synthesize x,y,box,compname;
-(id)init
{
    self=[super init];
    if(self)
    {
        box=[[NSMutableArray alloc] initWithCapacity:9];
        for(NSUInteger i=0;i<9;i++)
            [box insertObject:@"empty" atIndex:i];
        NSLog(@"count of arry %lu",(unsigned long)box.count);
        NSLog(@"in init of board");
    }
    return self;
}
-(BOOL)status
{
    for(NSInteger i=0;i<9;i++)
    {
        if([[box objectAtIndex:i] isEqualToString:@"empty"])
            return NO;
    }
    return YES;
}
-(void)print
{
    for(NSUInteger i=0;i<9;i+=3)
    {
       NSLog(@"%@   %@   %@",[box objectAtIndex:i],[box objectAtIndex:i+1],[box objectAtIndex:i+2]);
    }
}
-(NSInteger)isGameComplete
{
    NSLog(@"inside game complete");
    for(NSInteger j=0;j<9;j+=3)
    {
        if(([[box objectAtIndex:j] isEqualToString:[box objectAtIndex:j+1]]&&[[box objectAtIndex:j] isEqualToString:[box objectAtIndex:j+2]])&&!([[box objectAtIndex:j] isEqualToString:@"empty"]))
            return (j/3)+1;
    }
    for(NSInteger j=0;j<3;j++)
    {
        if([[box objectAtIndex:j] isEqualToString:[box objectAtIndex:j+3]]&&[[box objectAtIndex:j] isEqualToString:[box objectAtIndex:j+6]]&&![[box objectAtIndex:j] isEqualToString:@"empty"])
            return j+4;
    }
    if([[box objectAtIndex:0] isEqualToString:[box objectAtIndex:4]]&&[[box objectAtIndex:0] isEqualToString:[box objectAtIndex:8]]&&![[box objectAtIndex:0] isEqualToString:@"empty"])
        return 7;
    if([[box objectAtIndex:2] isEqualToString:[box objectAtIndex:4]]&&[[box objectAtIndex:2] isEqualToString:[box objectAtIndex:6]]&&![[box objectAtIndex:2] isEqualToString:@"empty"])
        return 8;
    NSLog(@"end of game complete");
    return NO;
}
-(BOOL)setBoard:(NSInteger)n
{
        if([[box objectAtIndex:n] isEqualToString:@"empty"])
    {
        if([compname isEqualToString:@"o"])
        {

        [box replaceObjectAtIndex:n withObject:@"x"];
        return YES;
        }
        else
            [box replaceObjectAtIndex:n withObject:@"o"];
        return YES;
}
    return NO;
}
-(NSInteger)isWinningPosition
{
    NSInteger j;NSLog(@"in winnig position");
    for(j=0;j<9;j+=3)
    {
        NSInteger f;
        f=[self checkingForIsWinnig:[box objectAtIndex:j] :[box objectAtIndex:j+1] :[box objectAtIndex:j+2]];
        if(f!=-1)
        {
            [box replaceObjectAtIndex:j+f withObject:compname];
            return j+f;
        }

    }
    
    for(j=0;j<3;j++)
    {
        NSInteger f;
        f=[self checkingForIsWinnig:[box objectAtIndex:j] :[box objectAtIndex:j+3] :[box objectAtIndex:j+6]];
        if(f!=-1)
        {
            [box replaceObjectAtIndex:j+(f*3) withObject:compname];
            return j+(f*3);
        }
  }
    
        NSInteger f;
        f=[self checkingForIsWinnig:[box objectAtIndex:0] :[box objectAtIndex:4] :[box objectAtIndex:8]];
        if(f!=-1)
        {
            [box replaceObjectAtIndex:(4*f) withObject:compname];
            return 4*f;
        }

        f=[self checkingForIsWinnig:[box objectAtIndex:2] :[box objectAtIndex:4] :[box objectAtIndex:6]];
        if(f!=-1)
        {
            [box replaceObjectAtIndex:(2+(2*f)) withObject:compname];
            return 2+(2*f);
        }
    NSLog(@
          "at the end of iswiinig");
    [self print];
    return -1;
}
-(NSInteger)isBlockingPosition
{
    NSInteger j;
    for(j=0;j<9;j+=3)
    {
        NSInteger f;
        f=[self checkingForBlocking:[box objectAtIndex:j] :[box objectAtIndex:j+1] :[box objectAtIndex:j+2]];
        if(f!=-1)
        {
            
            NSLog(@"inside blociking %i",f);
            [box replaceObjectAtIndex:j+f withObject:compname];
            return j+f;
        }
  
    }
    for(j=0;j<3;j++)
    {
        NSInteger f;
        f=[self checkingForBlocking:[box objectAtIndex:j] :[box objectAtIndex:j+3] :[box objectAtIndex:j+6]];
        if(f!=-1)
        {
            [box replaceObjectAtIndex:j+(f*3) withObject:compname];
            return j+(f*3);
        }
}
    
NSInteger f;
    f=[self checkingForBlocking:[box objectAtIndex:0] :[box objectAtIndex:4] :[box objectAtIndex:8]];
    if(f!=-1)
    {
        [box replaceObjectAtIndex:(4*f) withObject:compname];
        return 4*f;
    }
    f=[self checkingForBlocking:[box objectAtIndex:2] :[box objectAtIndex:4] :[box objectAtIndex:6]];
    if(f!=-1)
    {
        [box replaceObjectAtIndex:(2+(2*f)) withObject:compname];
        return 2+(2*f);
    }

    
        return -1;
}
-(NSInteger)move
{
    int random;
    NSInteger chosenelement;
    NSLog(@"in center move");
    if([[box objectAtIndex:4] isEqualToString:[NSString stringWithFormat:@"empty"]])
    {
        [box replaceObjectAtIndex:4 withObject:compname];
        return 4;
    }

    random=arc4random()%4;
    int corners[4]={0,2,6,8};
    int c;
    NSLog(@"in move");
    [self print];
    for(c=0;c<4;c++)
    {
        chosenelement=corners[random];
        if([[box objectAtIndex:chosenelement] isEqualToString:[NSString stringWithFormat:@"empty"]])
        {
            [box replaceObjectAtIndex:chosenelement withObject:compname];
            return chosenelement;
        }
        else
            random=(random+1)%4;
    }
        int middleelements[4]={1,3,5,7};
        chosenelement=middleelements[random];
        for(c=0;c<4;c++)
        {
            chosenelement=middleelements[random];
            NSLog(@" value of random %i",random);
            if([[box objectAtIndex:chosenelement] isEqualToString:[NSString stringWithFormat:@"empty"]])
            {
                [box replaceObjectAtIndex:chosenelement withObject:compname];
                return chosenelement;
            }
            else
                random=(random+1)%4;
        }
    NSLog(@"after move");
    return -1;
    [self print];
}
-(NSInteger)checkingForIsWinnig:(NSString*)a :(NSString*)b :(NSString*)c
{
    if([a isEqualToString:compname]||[b isEqualToString:compname]||[c isEqualToString:compname])
    {
        if(([a isEqualToString:b]&&![a isEqualToString:[NSString stringWithFormat:@"empty"]])||([b isEqualToString:c]&&!([b isEqualToString:[NSString stringWithFormat:@"empty"]]))||([a isEqualToString:c]&&!([c isEqualToString:[NSString stringWithFormat:@"empty"]])))
        {
          if([a isEqualToString:@"empty"])
              return 0;
            else
                if([b isEqualToString:@"empty"])
                    return 1;
                else
                    if([c isEqualToString:@"empty"])
                    return 2;
        }
        }
    return -1;
}
-(NSInteger)checkingForBlocking:(NSString*)a :(NSString*)b :(NSString*)c
{
    if([a isEqualToString:compname]||[b isEqualToString:compname]||[c isEqualToString:compname])
    {
        return -1;
    }
    else
    {
        if(([a isEqualToString:b]&&![a isEqualToString:[NSString stringWithFormat:@"empty"]])||([b isEqualToString:c]&&!([b isEqualToString:[NSString stringWithFormat:@"empty"]]))||([a isEqualToString:c]&&!([c isEqualToString:[NSString stringWithFormat:@"empty"]])))
        {
            if([a isEqualToString:@"empty"])
                return 0;
            else
            {
                if([b isEqualToString:@"empty"])
                    return 1;
                else
                    if([c isEqualToString:@"empty"])
                    return 2;
            }
        }
}
    return -1;
}
@end
