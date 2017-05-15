//
//  LYHeadCloudDetailView.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/14.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYHorizontalButton.h"

@interface LYHeadCloudDetailView : UIView

/**    封面大图片    */
@property (weak, nonatomic) IBOutlet UIImageView *bigimage;

/**   作者的头像    */
@property (weak, nonatomic) IBOutlet UIImageView *littleimage;

/**   标题文字       */
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

/**   简介内容    */
@property (weak, nonatomic) IBOutlet UILabel *introducelabel;

/**   属于的类别    */
@property (weak, nonatomic) IBOutlet UILabel *category;

/**   透明的大按钮    */
@property (weak, nonatomic) IBOutlet UIButton *clearbtn;

/**   播放按钮    */
@property (weak, nonatomic) IBOutlet LYHorizontalButton *starbtn;

/**   分享按钮    */
@property (weak, nonatomic) IBOutlet LYHorizontalButton *sharebtn;

/**   添加到书包按钮    */
@property (weak, nonatomic) IBOutlet LYHorizontalButton *addbagbtn;

@end
