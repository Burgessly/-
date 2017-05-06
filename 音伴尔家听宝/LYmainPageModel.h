//
//  LYmainPageModel.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/18.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYmainPageModel : NSObject
// 书id
//@property (nonatomic, copy) NSString *bookId;

// 书名称
@property (nonatomic, copy) NSString *name;

// 商品图片url
@property (nonatomic, copy) NSString * mob_large_img;

@property (nonatomic, copy) NSString * logo;

@property (nonatomic, copy) NSString * web_large_img;

// url
//@property (nonatomic, copy) NSString * bookUrl;
//
//// cat_id
//@property (nonatomic, assign) double cat_id;
//
//// cat_tag_name
//@property (nonatomic, assign) double cat_tag_name;
//
//// 课程id
//@property (nonatomic, assign) double course_id;
//
//// adverse_type
//@property (nonatomic, assign) double adverse_type;
//
//// activity_id
//@property (nonatomic, assign) double activity_id;



//+ (NSArray *)loadOrderInfoFromJson:(NSArray *)array;
@end
