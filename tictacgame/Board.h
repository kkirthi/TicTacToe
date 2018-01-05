//
//  board.h
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 02/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Board : NSObject
@property int x,y;
@property (retain)NSMutableArray *box;
@property (retain)NSString *compname;
//@property NSMutableArray *box;
-(NSInteger)isGameComplete;
-(NSInteger)isWinningPosition;
-(NSInteger)isBlockingPosition;
-(NSInteger)move;
-(void)print;
-(BOOL)setBoard:(NSInteger)n;
-(BOOL)status;
-(NSInteger)checkingForIsWinnig:(NSString*)a :(NSString*)b :(NSString*)c;
-(NSInteger)checkingForBlocking:(NSString*)a :(NSString*)b :(NSString*)c;
@end

