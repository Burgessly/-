//
//  LYCollectionviewOnTableviewCell.h
//  音伴尔家听宝
//
//  Created by Burgess on 2017/5/2.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYmainPageModel.h"

@interface LYCollectionviewOnTableviewCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong , nonatomic)   UICollectionView * collectionview;

@property (strong , nonatomic)   UIViewController * vc;

/**   标题标签    */
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel2;
/**   collectionview2    */
@property (strong, nonatomic) IBOutlet UICollectionView *CollectionView2;
/**   模型数组    */
@property (strong, nonatomic)  NSArray * arraymodel;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier null:(NSString *)null;

-(void)setvaluetoarraymodel:(NSArray *)array tableviewcell:(LYCollectionviewOnTableviewCell *)cell viewcontroller:(UIViewController *)vc;

@end
