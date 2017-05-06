//
//  LYTabbarHeadbutton.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/15.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYTabbarHeadbutton.h"
@implementation LYTabbarHeadbutton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //  上面按钮的个数
    NSUInteger num = 3;
    
    UIView * headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    headview.backgroundColor = [UIColor whiteColor];
    int width = headview.bounds.size.width/num;
    int hight = headview.bounds.size.height-10;
    
    for (int i =0 ; i<num; i++) {
        CGRect rect = CGRectMake(width*i, 20, width, hight);
        if (i == 0) {
            _btn1 = [[UIButton alloc]initWithFrame:rect];
        }else if (i == 1){
            _btn2 = [[UIButton alloc]initWithFrame:rect];
        }else{
            _btn3 = [[UIButton alloc]initWithFrame:rect];

        }
    }
    
        [_btn1 addTarget:self action:@selector(clickshouye:) forControlEvents:UIControlEventTouchDown];
        [_btn2 addTarget:self action:@selector(clickshouye:) forControlEvents:UIControlEventTouchDown];
        [_btn3 addTarget:self action:@selector(clickshouye:) forControlEvents:UIControlEventTouchDown];
    
        [_btn1 setTitle:@"首页" forState: UIControlStateNormal ];
        [_btn2 setTitle:@"云课堂" forState: UIControlStateNormal ];
        [_btn3 setTitle:@"定时课程" forState: UIControlStateNormal ];
    
        UIColor * c1 =[UIColor blackColor];
        [_btn1 setTitleColor:LySystemColor forState:UIControlStateNormal];
        [_btn2 setTitleColor:c1 forState:UIControlStateNormal];
        [_btn3 setTitleColor:c1 forState:UIControlStateNormal];
    
    
    _littlescroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 55, 375, 5)];
    _littlescroll.contentSize = CGSizeMake(375, 0);
    _littlescroll.bounces = NO;
    _littleredview = [[UIView alloc]initWithFrame:CGRectMake(20, 2, 85,3)];
    _littleredview.backgroundColor = LySystemColor;
    
    [headview addSubview:_btn1];
    [headview addSubview:_btn2];
    [headview addSubview:_btn3];
    [headview addSubview:_littlescroll];
    [_littlescroll addSubview:_littleredview];
    
    [self addSubview:headview];

}
- (void)clickshouye:(UIButton *)sender {
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    if ([sender.titleLabel.text isEqualToString:@"首页"]) {
        _littlescroll.contentOffset  =CGPointMake(0, 0);
    } else if ([sender.titleLabel.text isEqualToString:@"云课堂"]) {
        _littlescroll.contentOffset  =CGPointMake(375, 0);
    }else{
        _littlescroll.contentOffset  =CGPointMake(750, 0);
    }
    [UIView commitAnimations];
    //   动画还没有实现呢！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
}

@end
