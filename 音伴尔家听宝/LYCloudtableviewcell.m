//
//  LYCloudtableviewcell.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYCloudtableviewcell.h"

@interface LYCloudtableviewcell()

@end

@implementation LYCloudtableviewcell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self ) {
        self = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:NULL]firstObject] ;
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    NSLog(@"%@",NSStringFromCGRect(frame));
    CGRect rect = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height-10);
    [super setFrame:rect];
}

@end
