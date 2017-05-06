//
//  LYcloudsclassview.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/8.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYcloudsclassview.h"

#import <UIImageView+AFNetworking.h>


@interface LYcloudsclassview()


@property (strong, nonatomic) NSArray * modelArray;


@end

@implementation LYcloudsclassview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
{
    UIView * littleview;    //定义各个单位的小view
    UIView * picview;
}
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    
//}
+(instancetype)initwitharray:(NSArray *)array frames:(CGRect )rect{
    LYcloudsclassview * bigview = [[LYcloudsclassview alloc]init];
    
    if (!(array.count == 0)) {
        int col = 4;
        UIImageView * view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 80)];
        view.image = [UIImage imageNamed:@"ding"];
        [bigview addSubview:view];
        for (int i = 0; i<array.count; i++) {
            LYCatListModel * model = [[LYCatListModel alloc]init];
            model = array[i];
            CGFloat x = i%col;
            CGFloat y = i/col;
            CGFloat width = (rect.size.width-10)/col-10;
            CGFloat hight = (rect.size.height-400)/col-10;
            
            CGRect rect1 = CGRectMake(x*(width+10)+10, y*(hight+10)+90, width, hight);
            CGSize sizee = CGSizeMake(width, hight);
            UIView *views = [bigview initlittleview:sizee imagename:model.mob_icon_120 labell:model.cat_name];
            views.frame = rect1;
            [bigview addSubview:views];
            
        }
    }
    
    
    return bigview;
}



/*
 *初始化littleview
 *   size。 littleview的size
 *   image。 图片的名字
 *   lab。   标签的文字
 */
-(UIView *)initlittleview:(CGSize ) size  imagename:(NSString *)image labell:(NSString *) lab{
    
    littleview = [[UIView alloc]init];
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    littleview.bounds = rect;
    
    CGRect rect1 = CGRectMake(0, 0, size.width, size.height*0.7);
    CGRect rect2 = CGRectMake(0, size.height*0.7, size.width, size.height*0.3);
    UIButton *imageview = [[UIButton alloc]initWithFrame:rect1];
    [imageview setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image]]] forState:UIControlStateNormal ] ;
    UILabel *label = [[UILabel alloc]initWithFrame:rect2];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = lab;
    [label setFont:[UIFont systemFontOfSize:13.0]];
    
    [imageview addTarget:self action:@selector(lyshow) forControlEvents:UIControlEventTouchDown];
    
    
    [littleview addSubview:imageview];
    [littleview addSubview:label];
    return littleview;
}
-(void)lyshow{
    NSLog(@"%s",__func__);
}

/*
 *初始化littleview的frame和image和label
 *
 *
 *
 */


@end
