//
//  LYcellview.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/12.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYmainPageModel.h"

@interface LYcellview : UITableViewCell

/**   标题文字    */
@property (weak, nonatomic) IBOutlet UIButton *title;

/**   图片名字    */
@property (nonatomic, strong) NSArray *imageNames;

/**   文字    */
@property (nonatomic, strong) NSArray *labelNames;

/**
 *      初始化cell
 *
 *  @param images 图片数组
 *  @param labels 文字数组
 *  @param index cell的索引
 *  @param model 模型
 *
 *  @return cell实例
 */
+(instancetype)initWithimage:(NSArray * )images labels:(NSArray *)labels index:(NSInteger ) index array:(NSArray *)arry model:(LYmainPageModel * )model;
@end
