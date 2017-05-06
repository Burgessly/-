//
//  LYPageView.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/12.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYPageView : UIView
+ (instancetype)pageView;
/** 图片名字 */
@property (nonatomic, strong) NSArray *imageWebNames;
/** 其他圆点颜色 */
@property (nonatomic, strong) UIColor *otherColor;
/** 当前圆点颜色 */
@property (nonatomic, strong) UIColor *currentColor;
@end
