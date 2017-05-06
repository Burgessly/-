//
//  LYcellview.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/12.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYcellview.h"
#import <UIImageView+AFNetworking.h>
#import "LYmainPageModel.h"
#import <UIImage+AFNetworking.h>
#import <UIButton+WebCache.h>

@interface LYcellview()

@property (weak, nonatomic) IBOutlet UIButton *image1;
@property (weak, nonatomic) IBOutlet UIButton *image2;
@property (weak, nonatomic) IBOutlet UIButton *image3;
@property (weak, nonatomic) IBOutlet UIButton *hidebool;

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIButton *label;

@property (strong, nonatomic) LYmainPageModel * models;

@end


@implementation LYcellview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+(instancetype)initWithimage:(NSArray * )images labels:(NSArray *)labels index:(NSInteger ) index array:(NSArray *)arry model:(LYmainPageModel * )model{
    
    LYcellview *cell = [[[NSBundle mainBundle]loadNibNamed:@"LYcellview" owner:nil options:NULL]firstObject];

    
    if (index== 0) {
        cell.hidebool.hidden = YES;
        cell.image1.frame = CGRectMake(cell.image1.frame.origin.x, cell.image1.frame.origin.y-53, cell.image1.bounds.size.width, cell.image1.bounds.size.height);
        cell.image2.frame = CGRectMake(cell.image2.frame.origin.x, cell.image2.frame.origin.y-53, cell.image2.bounds.size.width, cell.image2.bounds.size.height);
        cell.image3.frame = CGRectMake(cell.image3.frame.origin.x, cell.image3.frame.origin.y-53, cell.image3.bounds.size.width, cell.image3.bounds.size.height);
        cell.label1.frame = CGRectMake(cell.label1.frame.origin.x, cell.label1.frame.origin.y-70, cell.label1.bounds.size.width, cell.label1.bounds.size.height);
        UIFont *font = [UIFont systemFontOfSize:12];
        
        UIColor *myUIColor = [UIColor colorWithRed: (0./255.0 ) green: (191.0/255.0) blue: (255.0/255.0) alpha:1.0];
        [cell.label1 setTextColor:myUIColor];
        [cell.label1 setFont:font];
        [cell.label2 setFont:font];
        [cell.label3 setFont:font];
        cell.label1.textAlignment = NSTextAlignmentCenter;
        cell.label2.textAlignment = NSTextAlignmentCenter;
        cell.label3.textAlignment = NSTextAlignmentCenter;
        cell.label2.frame = CGRectMake(cell.label2.frame.origin.x, cell.label2.frame.origin.y-70, cell.label2.bounds.size.width, cell.label2.bounds.size.height);
        [cell.label2 setTextColor:[UIColor redColor]];
        cell.label3.frame = CGRectMake(cell.label3.frame.origin.x, cell.label3.frame.origin.y-70, cell.label3.bounds.size.width, cell.label3.bounds.size.height);
        [cell.label3 setTextColor:[UIColor grayColor]];
        
        cell.label1.text = labels[0];
        cell.label2.text = labels[1];
        cell.label3.text = labels[2];
        [cell.image1 setImage:[UIImage imageNamed:images[0]] forState:UIControlStateNormal];
        [cell.image2 setImage:[UIImage imageNamed:images[1]] forState:UIControlStateNormal];
        [cell.image3 setImage:[UIImage imageNamed:images[2]] forState:UIControlStateNormal];
        [cell.label setTitle:labels[3] forState:UIControlStateNormal];
    }else{
        
        LYmainPageModel *model1 = arry[0];
        LYmainPageModel *model2 = arry[1];
        LYmainPageModel *model3 = arry[2];

        [cell.image1 sd_setImageWithURL:(NSURL *)model1.mob_large_img forState:UIControlStateNormal];
        [cell.image2 sd_setImageWithURL:(NSURL *)model2.mob_large_img forState:UIControlStateNormal];
        [cell.image3 sd_setImageWithURL:(NSURL *)model3.mob_large_img forState:UIControlStateNormal];
    cell.label1.text = model1.name;
    cell.label2.text = model2.name;
    cell.label3.text = model3.name;
    [cell.label setTitle:labels[3] forState:UIControlStateNormal];
    }
    return cell;
}
@end
