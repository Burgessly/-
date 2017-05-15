//
//  LYHorizontalButton.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/14.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYHorizontalButton.h"

@implementation LYHorizontalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    self.titleLabel.frame = CGRectMake(self.frame.size.height, 0, self.frame.size.width- self.frame.size.height, self.frame.size.height);
}
@end
