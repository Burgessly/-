//
//  LYCloudtableviewcell.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYCloudtableviewcell : UITableViewCell

/**   图片    */
@property (weak, nonatomic) IBOutlet UIImageView *image;

/**   标题    */
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

/**   作者    */
@property (weak, nonatomic) IBOutlet UILabel *authorlabel;

/**   音乐时长    */
@property (weak, nonatomic) IBOutlet UILabel *timelabel;

/**   听过人数   */
@property (weak, nonatomic) IBOutlet UILabel *listenlabel;

/**   点赞人数    */
@property (weak, nonatomic) IBOutlet UILabel *lovelabel;

@end
