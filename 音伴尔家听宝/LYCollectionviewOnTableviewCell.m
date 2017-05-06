//
//  LYCollectionviewOnTableviewCell.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/2.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYCollectionviewOnTableviewCell.h"
#import "LYCollectionCell.h"
#import <UIButton+WebCache.h>
#import "LYTableViewController.h"


@interface LYCollectionviewOnTableviewCell() 

@end

@implementation LYCollectionviewOnTableviewCell

-(void)setvaluetoarraymodel:(NSArray *)array tableviewcell:(LYCollectionviewOnTableviewCell *)cell viewcontroller:(UIViewController *)vc{
    cell.arraymodel = array;
    cell.vc = vc;
    [cell.collectionview reloadData];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier null:(NSString *)null {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"LYCollectionviewOnTableviewCell" owner:NULL options:NULL]firstObject];
        [self setValue:reuseIdentifier forKey:@"reuseIdentifier"];
        CGRect rect = CGRectMake(0, 29, 375, 161);
        UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
        flow.itemSize = CGSizeMake(110, 145);
        self.collectionview = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flow];
        self.collectionview.dataSource = self;
        self.collectionview.delegate   = self;
        self.collectionview.bounces = NO;
        self.collectionview.backgroundColor = [UIColor whiteColor];
        [self.collectionview registerClass:[LYCollectionCell class] forCellWithReuseIdentifier:@"cellname"];
        
        [self addSubview:self.collectionview];

    }
    return self;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGRect rect = CGRectMake(0, 0, 375, 95);
        UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
        flow.itemSize = CGSizeMake(60, 80);
        self.collectionview = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flow];
        self.collectionview.dataSource = self;
        self.collectionview.delegate   = self;
        self.collectionview.bounces = NO;
        self.collectionview.backgroundColor = [UIColor whiteColor];
        [self.collectionview registerClass:[LYCollectionCell class] forCellWithReuseIdentifier:@"cellname"];
        [self addSubview:self.collectionview];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.arraymodel.count;
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
        LYCollectionCell  * cell11 = [self.collectionview dequeueReusableCellWithReuseIdentifier:@"cellname" forIndexPath:indexPath];
    
        if(cell11 == NULL){
            cell11 = [[[NSBundle mainBundle]loadNibNamed:@"LYCorseCell" owner:NULL options:NULL]firstObject];
            [cell11 setValue:@"cellname" forKey:@"reuseIdentifier"];
        }
    
    if (self.collectionview.bounds.size.height <=100) {
        NSArray * images = @[@"xinshou",@"bendi",@"jingqing"];
        NSArray * labels = @[@"新手指导",@"本地课程",@"敬请期待"];
        NSArray * color = @[LySystemColor ,[UIColor redColor],[UIColor grayColor]];
        [cell11.corseBtn setImage:[UIImage imageNamed:images[indexPath.item]] forState:UIControlStateNormal];
        [cell11.corseBtn setTitle:labels[indexPath.item] forState:UIControlStateNormal];
        [cell11.corseBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [cell11.corseBtn setTitleColor:color[indexPath.item] forState:UIControlStateNormal];
        cell11.corseBtn.userInteractionEnabled = NO;
        cell11.corseBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        return cell11;
    }else{
        LYmainPageModel  * models = [[LYmainPageModel alloc]init];
        models = self.arraymodel[indexPath.item];
        
        [cell11.corseBtn sd_setImageWithURL:(NSURL *)models.mob_large_img forState:UIControlStateNormal];
        [cell11.corseBtn setTitle:models.name forState:UIControlStateNormal];
        [cell11.corseBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [cell11.corseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        cell11.corseBtn.userInteractionEnabled = NO;
        return cell11;
    }

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LYTableViewController * two = [[LYTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.vc.navigationController pushViewController:two animated:YES];
}
//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (self.collectionview.frame.size.height >=100 ) {
        return 10;
    }
    return 44;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.collectionview.frame.size.height >=100 ) {
        return UIEdgeInsetsMake(10, 11, 5, 11);
    }
    return UIEdgeInsetsMake(10, 52, 5, 52);//分别为上、左、下、右
}

@end
