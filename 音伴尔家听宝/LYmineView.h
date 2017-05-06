//
//  LYmineView.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/10.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYmineView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIButton *btnluyin;
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UILabel *soundnum;
@property (weak, nonatomic) IBOutlet UILabel *coursenum;
@property (weak, nonatomic) IBOutlet UILabel *guanzhunum;
@property (weak, nonatomic) IBOutlet UILabel *finenum;
@property (weak, nonatomic) IBOutlet UIView *downbackground;

+(instancetype)initmineview;

@end
