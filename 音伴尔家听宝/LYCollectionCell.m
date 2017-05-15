//
//  LYCorseCell.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/26.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYCollectionCell.h"

@implementation LYCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"LYCollectionCell" owner:NULL options:NULL]firstObject];
        self.corseBtn.titleLabel.numberOfLines = 0;
    }
    return self;
}
@end
