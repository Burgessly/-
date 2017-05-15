//
//  LYmusicCell.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/17.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYmusicCell.h"

@implementation LYmusicCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:NULL]firstObject];
    }
    return self;
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
