//
//  Button.m
//  tictacgame
//
//  Created by Kirthika Meenakshi K on 20/01/14.
//  Copyright (c) 2014 Kirthika Meenakshi K. All rights reserved.
//

#import "Button.h"

@implementation Button

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font=[UIFont systemFontOfSize:50];
        self.backgroundColor=[UIColor grayColor];
        self.layer.cornerRadius=25;
        self.exclusiveTouch=YES;
        self.backgroundColor=[UIColor brownColor];
  }
    return self;
}
-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
