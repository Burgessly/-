//
//  LYmusicCell.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/17.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYmusicCell : UITableViewCell

/**
 *      cell左侧，选中就会显示的指示view
 */
@property (weak, nonatomic) IBOutlet UIView *indicatorView;

/**
 *      数字label，用于显示序号
 */
@property (weak, nonatomic) IBOutlet UILabel *numlabel;

/**
 *      标题label，用于显示大标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

/**
 *      小标题lebel，用于显示更详细的提示内容
 */
@property (weak, nonatomic) IBOutlet UILabel *detailedLabel;

/**
 *      时长label，用于显示音频的时长
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


+(instancetype)initwhitcell;
@end
