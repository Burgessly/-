//
//  LYmusicCell.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/17.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYmusicCell.h"

@implementation LYmusicCell
+(instancetype)initwhitcell{
    LYmusicCell * cell = [[[NSBundle mainBundle]loadNibNamed:@"LYmusicCell" owner:NULL options:NULL]firstObject];
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
