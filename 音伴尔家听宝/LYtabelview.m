//
//  LYtabelview.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/12.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYtabelview.h"

@implementation LYtabelview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self = (LYtabelview *)[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    }
    return self;
}
@end
