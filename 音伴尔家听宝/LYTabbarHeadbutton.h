//
//  LYTabbarHeadbutton.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/15.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTabbarHeadbutton : UIView
//上面小视图下端的小红条
@property(nonatomic ,strong)UIScrollView *littlescroll;
//上面的小视图
@property(nonatomic ,strong)UIView * littleredview;
//上面小视图里面的三个按钮
@property(nonatomic ,strong)UIButton * btn1;
@property(nonatomic ,strong)UIButton * btn2;
@property(nonatomic ,strong)UIButton * btn3;

@end
