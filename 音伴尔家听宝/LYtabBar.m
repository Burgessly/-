//
//  LYtabBar.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYtabBar.h"
#import "LYMusicBtnVc.h"
#import "LYMusicBtnWindowSingleton.h"

@implementation LYtabBar

-(id)initWithFrame:(CGRect)frame
 {
         self = [super initWithFrame:frame];
         if (self) {
                 // 添加加号按钮
//                 [self setupPlusButton];
             //   让tabbar变透明
//             [self setShadowImage:[UIImage new]];
             [self setBackgroundImage:[UIImage imageNamed:@"tabbarbeijing"]];
             }
         return self;
     }

 /**
      *  添加加号按钮
      */
-(void)setupPlusButton
 {
//         UIButton *plusButton = [[UIButton alloc] init];
         // 设置背景
//         [plusButton setBackgroundImage:[UIImage imageNamed:@"vip"] forState:UIControlStateNormal];
//         [plusButton setBackgroundImage:[UIImage imageNamed:@"vip"] forState:UIControlStateHighlighted];
//         // 设置图标
//         [plusButton setImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
//         [plusButton setImage:[UIImage imageNamed:@"music"] forState:UIControlStateHighlighted];
//         [plusButton addTarget:self action:@selector(musicClick) forControlEvents:UIControlEventTouchUpInside];
         // 添加
//         [self addSubview:plusButton];
  
     
//     self.MusicWindow = [[UIWindow alloc]initWithFrame:CGRectMake(150, 600, 75, 75)];
//     self.MusicWindow.windowLevel = UIWindowLevelNormal+1;
//     [self.MusicWindow setRootViewController:vc];
//     self.MusicWindow.hidden = NO;
//     [self.MusicWindow makeKeyAndVisible];
//         self.plusButton = plusButton;
     }

 - (void)musicClick
 {
     if ([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton)]) {
                  [self.delegate tabBarDidClickedPlusButton];
              }
     }

 /**
      *  布局子控件
      */
 - (void)layoutSubviews
 {
         [super layoutSubviews];
    
         // 设置plusButton的frame
         [self setupPlusButtonFrame];
    
         // 设置所有tabbarButton的frame
         [self setupAllTabBarButtonsFrame];
//     self.MusicWindow.hidden = NO;
//     [self.MusicWindow makeKeyAndVisible];
     }

 /**
      *  设置所有plusButton的frame
      */
 - (void)setupPlusButtonFrame
 {
     
     
     
     CGSize  size  = self.plusButton.currentBackgroundImage.size;
     CGRect  rect = CGRectMake(0, 0, size.width*2,size.height*2);
     self.plusButton.bounds = rect;
     self.plusButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.2);
     }

 /**
      *  设置所有tabbarButton的frame
      */
 - (void)setupAllTabBarButtonsFrame
 {
         int index = 0;
    
         // 遍历所有的button
         for (UIView *tabBarButton in self.subviews) {
                 // 如果不是UITabBarButton， 直接跳过
                 if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
                 // 根据索引调整位置
                 [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        
                // 遍历UITabBarButton中的所有子控件
                 [self setupTabBarButtonTextColor:tabBarButton atIndex:index];
        
                 // 索引增加
                 index++;
             }
     }

 /**
      *  设置某个按钮的文字颜色
      *
      *  @param tabBarButton 需要设置的按钮
      *  @param index        按钮所在的索引
      */
 - (void)setupTabBarButtonTextColor:(UIView *)tabBarButton atIndex:(int)index
 {
         // 选中按钮的索引
         NSUInteger selectedIndex = [self.items indexOfObject:self.selectedItem];
    
         for (UILabel *label in tabBarButton.subviews) {
                 // 说明不是个Label
                 if (![label isKindOfClass:[UILabel class]]) continue;
        
                 // 设置字体
                 label.font = [UIFont systemFontOfSize:10];
                 if (selectedIndex == index) { // 说明这个Button选中, 设置label颜色为蓝色
                         label.textColor = LySystemColor;
                     } else { // 说明这个Button没有选中, 设置label颜色为黑色
                             label.textColor = [UIColor blackColor];
                         }
             }
}

 /**
       *  设置某个按钮的frame
       *
       *  @param tabBarButton 需要设置的按钮
       *  @param index        按钮所在的索引
       */
 - (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
 {
          // 计算button的尺寸
          CGFloat buttonW = self.bounds.size.width / (self.items.count + 1);
         CGFloat buttonH = self.bounds.size.height;
     
     CGRect rect2 = CGRectMake(buttonW * (index + 1), 0, buttonW, buttonH);
     CGRect rect3 = CGRectMake(buttonW * index, 0, buttonW, buttonH);
     
          if (index >= 2) {
                  tabBarButton.frame = rect2;
              } else {
                      tabBarButton.frame = rect3;
                  }
}


@end
