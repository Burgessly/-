//
//  LYtabBar.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LYtabBar;
@protocol LYTabBarDelegate <UITabBarDelegate,NSObject>
-(void)tabBarDidClickedPlusButton;

@end
@interface LYtabBar : UITabBar
@property (nonatomic, weak) UIButton *plusButton;
@property(nonatomic,weak)id <LYTabBarDelegate> delegate;
@property (strong, nonatomic) UIWindow *MusicWindow;
@end
