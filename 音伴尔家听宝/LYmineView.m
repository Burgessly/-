//
//  LYmineView.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/10.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYmineView.h"

@implementation LYmineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    //  设置头像时圆角的状态
//    _image.layer.cornerRadius = _image.bounds.size.width*0.5;
//    _image.clipsToBounds = YES;
    _background.backgroundColor = [UIColor colorWithRed:49.0/255.0 green:61.0/255.0 blue:62.0/255.0 alpha:1.0];
    _downbackground.backgroundColor = LyBackgroundColor;
}
+(instancetype)initmineview{
    LYmineView * mineview = [[[NSBundle mainBundle]loadNibNamed:@"LYView" owner:self options:NULL]firstObject];
    mineview.btnluyin.layer.cornerRadius = mineview.btnluyin.bounds.size.width*0.02;
    [mineview.btnluyin.layer setMasksToBounds:YES];
    [mineview.btnluyin.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    //边框宽度
    [mineview.btnluyin setTitleColor:LySystemColor forState:UIControlStateNormal];
    [mineview.btnluyin.layer setBorderWidth:1.2];
    //设置边框颜色有两种方法：第一种如下:
    [mineview.btnluyin.layer setBorderColor:LySystemColor.CGColor];//边框颜色
    
    [mineview.finenum setTextColor:LySystemColor];
    [mineview.soundnum setTextColor:LySystemColor];
    [mineview.coursenum setTextColor:LySystemColor];
    [mineview.guanzhunum setTextColor:LySystemColor];
    
    return mineview;
}
-(instancetype)initWithCoder:(NSCoder*)aDecoder{
    
    return [super initWithCoder:aDecoder];
}
-(void)awakefromNib{
    NSLog(@"awakefromNib   ---   ");
    [super awakeFromNib];
}
@end
