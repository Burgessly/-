



//
//  LYHeadCloudDetailView.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/14.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYHeadCloudDetailView.h"

@implementation LYHeadCloudDetailView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:NULL]firstObject];
    }
    return self;
}
@end
