//
//  LYVerticalButton.m
//  Login百思不得其解
//
//  Created by Burgess on 2017/4/24.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYVerticalButton.h"

@implementation LYVerticalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
    self.titleLabel.frame = CGRectMake(0, self.bounds.size.width,self.bounds.size.width, self.bounds.size.height-self.bounds.size.width);

}

@end
