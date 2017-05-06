//
//  LYdownCellView.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/19.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYdownCellView.h"

@implementation LYdownCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.image.layer.cornerRadius = self.image.bounds.size.width*0.5;
    self.image.clipsToBounds = YES;
    self.label.font = [UIFont systemFontOfSize:14];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
