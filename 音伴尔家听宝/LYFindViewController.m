//
//  LYFindViewController.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYCollectionviewOnTableviewCell.h"
#import "LYFindViewController.h"
#import "LYcloudsclassview.h"
#import "LYPageView.h"
#import "LYtabelview.h"
#import "LYcellview.h"
#import "LYcourseview.h"
#import "LYTabbarHeadbutton.h"
#import "LYTableViewController.h"
#import "LYmainPageModel.h"
#import "LYCatListModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import <UIImage+AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "LYdownCellView.h"
#import "LYMusicBtnWindowSingleton.h"
#import "LYCollectionCell.h"
#import "LYcloudTableViewController.h"
#import <MJRefresh.h>
#import <UIButton+WebCache.h>
#import <UIImageView+WebCache.h>


@interface LYFindViewController () <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
//  接口数据
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *interfaceData1;
@property (nonatomic, strong) NSArray *interfaceData2;
@property (nonatomic, strong) NSArray *interfaceData3;
@property (nonatomic, strong) NSArray *interfaceData4;
@property (nonatomic, strong) NSArray *interfaceData5;

@property (nonatomic, strong) NSArray *catlistmodel;

@property (strong,nonatomic) LYmainPageModel * model;
//  self.view上面的scroolview
@property (strong ,nonatomic) UIScrollView * downscroll;
//  downscroll视图下面的三个视图
@property (strong ,nonatomic) LYtabelview * tabelview;
@property (strong ,nonatomic) UICollectionView *collections;
@property (strong ,nonatomic) UIScrollView *sc3;

@property (strong , nonatomic) LYMusicBtnWindowSingleton * windowly;
@end

@implementation LYFindViewController
{

    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    
    UIView * littleredview;
    UIView * headviews;
    UIScrollView * littlescrollview;
}


-(void)mainPageModel{

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager * manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
    [manager GET:@"http://api.fcloudclass.com/courseapp/?service=Index.getMainPage" parameters:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.interfaceData1 = [LYmainPageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"adverseList"]];
        self.interfaceData2 = [LYmainPageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"recommendList"]];
        self.interfaceData3 = [LYmainPageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"newList"]];
        self.interfaceData4 = [LYmainPageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"hotList"]];
        self.interfaceData5 = [LYmainPageModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"radioList"]];
        self.data = @[self.interfaceData1,self.interfaceData2,self.interfaceData3,self.interfaceData4,self.interfaceData5];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tabelview reloadData];
            [self.tabelview.mj_header endRefreshing];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}
-(void)CatListModel{
    //?service=Cat.getCatList
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"service"] = @"Cat.getCatList";
    [manager GET:@"http://api.fcloudclass.com/courseapp/" parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.catlistmodel = [LYCatListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collections reloadData];
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  状态栏的颜色是透明的，所以设置view的颜色即可设置状态栏，剩下的问题就是设置状态栏字体颜色的问题了
    self.view.backgroundColor = [UIColor whiteColor];
    
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbarbeijing"] forBarMetrics:UIBarMetricsDefault];
    
    //   背景图片设置为没有的话，控制器的view会上移64
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //开启子线程到网络上获取数据
    NSThread * myFirstThread = [[NSThread alloc]initWithTarget:self selector:@selector(mainPageModel) object:nil];
    [myFirstThread start];
    NSThread * FirstThread = [[NSThread alloc]initWithTarget:self selector:@selector(CatListModel) object:nil];
    [FirstThread start];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"find_no"] style:UIBarButtonItemStylePlain target:NULL action:NULL] ;
    [self addheadview];
    [self adddownscrollview];
    [self addviewthree];
    [self addviewtwo];
    [self addviewone];

    self.windowly = [LYMusicBtnWindowSingleton sharedMusicBtnWindowSingleton:self];
    self.windowly.windowLevel = UIWindowLevelNormal+3;
    self.windowly.frame = CGRectMake(150, 600, 75, 75);
    self.windowly.backgroundColor = [UIColor clearColor];
    self.windowly.hidden = NO;
    
    
}

/**
 *添加上面的视图，其中有三个按钮
 *
 *
 */
-(void)addheadview{

    NSUInteger num = 3;
    
    headviews = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    headviews.backgroundColor = [UIColor whiteColor];
    int width = headviews.bounds.size.width/num;
    int hight = headviews.bounds.size.height-10;
    
    for (int i =0 ; i<num; i++) {
        CGRect rect = CGRectMake(width*i, 0, width, hight);
        if (i == 0) {
            btn1 = [[UIButton alloc]initWithFrame:rect];
        }else if (i == 1){
            btn2 = [[UIButton alloc]initWithFrame:rect];
        }else{
            btn3 = [[UIButton alloc]initWithFrame:rect];
            
        }
    }
    
    [btn1 addTarget:self action:@selector(clickshouye:) forControlEvents:UIControlEventTouchDown];
    [btn2 addTarget:self action:@selector(clickshouye:) forControlEvents:UIControlEventTouchDown];
    [btn3 addTarget:self action:@selector(clickshouye:) forControlEvents:UIControlEventTouchDown];
    
    [btn1 setTitle:@"首页" forState: UIControlStateNormal ];
    [btn2 setTitle:@"云课堂" forState: UIControlStateNormal ];
    [btn3 setTitle:@"定时课程" forState: UIControlStateNormal ];
    
    UIColor * c1 =[UIColor blackColor];
    [btn1 setTitleColor:LySystemColor forState:UIControlStateNormal];
    [btn2 setTitleColor:c1 forState:UIControlStateNormal];
    [btn3 setTitleColor:c1 forState:UIControlStateNormal];
    
    
    littlescrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 35, 375, 5)];
    littlescrollview.contentSize = CGSizeMake(375, 0);
    littlescrollview.bounces = NO;
    littleredview = [[UIView alloc]initWithFrame:CGRectMake(20, 2, 85,3)];
    littleredview.backgroundColor = LySystemColor;
    
    [headviews addSubview:btn1];
    [headviews addSubview:btn2];
    [headviews addSubview:btn3];
    [headviews addSubview:littlescrollview];
    [littlescrollview addSubview:littleredview];
    
    [self.view addSubview:headviews];
}

/**
 *添加下面的scrollview
 *
 *
 */
-(void)adddownscrollview{
    
    CGRect rect = CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height-153);
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width*3,  self.view.bounds.size.height-153);
    _downscroll = [[UIScrollView alloc]initWithFrame:rect];
    _downscroll.delegate = self;
    _downscroll.contentSize = size;
    _downscroll.showsHorizontalScrollIndicator = NO;
    _downscroll.pagingEnabled = YES;
    _downscroll.bounces = NO;
    
    CGRect rect1 = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _downscroll.bounds.size.height);
    CGRect rect2 = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, _downscroll.bounds.size.height);
    CGRect rect3 = CGRectMake([UIScreen mainScreen].bounds.size.width*2, 0, [UIScreen mainScreen].bounds.size.width, _downscroll.bounds.size.height);
    
    UICollectionViewFlowLayout * flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(70, 130);
    flow.headerReferenceSize = CGSizeMake(375, 80);
    flow.minimumInteritemSpacing = 15;
    flow.minimumLineSpacing = 15;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //     设置下面三个滚动视图的frame
    _tabelview = [[LYtabelview alloc]initWithFrame:rect1 style:UITableViewStyleGrouped];
    _collections = [[UICollectionView alloc]initWithFrame:rect2 collectionViewLayout:flow];
    _sc3 = [[UIScrollView alloc]initWithFrame:rect3];
    
    //     把下面的三个滚动视图加入到downscroll中
    [_downscroll addSubview:_tabelview];
    [_downscroll addSubview:_collections];
    [_downscroll addSubview:_sc3];
    
    [self.view addSubview: _downscroll];
    
    
    
}


#pragma mark - sc1
-(void)addviewone {
        _tabelview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self mainPageModel];
        }];
        _tabelview.dataSource = self;
        _tabelview.delegate = self;
        _tabelview.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - sc2
-(void)addviewtwo{

        [self.collections registerNib:[UINib nibWithNibName:@"LYCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"crosecell"];
        self.collections.backgroundColor = [UIColor whiteColor];
        self.collections.dataSource = self;
        self.collections.delegate = self;
        [self.collections registerClass:[UICollectionReusableView class]   forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headview"];

}

#pragma mark - <UICollectionViewDataSource>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.catlistmodel.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LYCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"crosecell" forIndexPath:indexPath ];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"LYCollectionCell" owner:self options:NULL]firstObject];
    }
    LYCatListModel * model = self.catlistmodel[indexPath.item];
    
    [cell.corseBtn sd_setImageWithURL:(NSURL *)model.mob_icon_120 forState:UIControlStateNormal];
    [cell.corseBtn setTitle:model.cat_name forState:UIControlStateNormal];
    [cell.corseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cell.corseBtn.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
    [cell.corseBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    //  按钮的点击事件覆盖了item的点击事件
    cell.corseBtn.userInteractionEnabled = NO;
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}
//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headview" forIndexPath:indexPath];
        header.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 80);
        //添加头视图的内容
        UIImageView * ima = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ding"] highlightedImage:NULL];
        ima.frame = header.bounds;
        //头视图添加view
        [header addSubview:ima];
        return header;
    }
    return nil;
}

//   #warning 不响应  ，已解决：UICollectionViewCell上面的button的点击事件覆盖了item的点击事件，把button的用户交互设置为no问题就解决了
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%zd",indexPath.item);
#warning     后面优化可以把这个控制器的初始化放在别的地方防止，多次点击多次初始化
    LYcloudTableViewController * viewss = [[LYcloudTableViewController alloc]init];
    LYCollectionCell * cell = (LYCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    viewss.VcTitle = cell.corseBtn.titleLabel.text;
    [self.navigationController pushViewController:viewss animated:YES];
}



#pragma mark - sc3
-(void)addviewthree{
    if (!_sc3.subviews.count) {
        _sc3.contentSize = CGSizeMake(_sc3.bounds.size.width, _sc3.bounds.size.height*1.5);
//        UIView * view = [[UIView alloc]initWithFrame:sc3.bounds];
        
        //  添加按钮
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(55, 20, 265, 40)];
        [btn.layer setBorderWidth:2.0];
        [btn.layer setBorderColor:LySystemColor.CGColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:@"添加定时课程" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        UIFont * font = [UIFont systemFontOfSize:14.0];
        [btn.titleLabel setFont:font];
        [btn setTitleColor:LySystemColor forState:UIControlStateNormal];
        btn.layer.cornerRadius = btn.bounds.size.width*0.02;
        [btn addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchDown];
        
        _sc3.backgroundColor = LyBackgroundColor;
        [_sc3 addSubview:btn];
        
    }
}


- (void)clickbtn{
    static int i = 0;
    //  点击按钮添加视图
    if(i <7){
        LYcourseview *course = [[[NSBundle mainBundle]loadNibNamed:@"LYcourseview" owner:NULL options:NULL]firstObject];
        course.layer.cornerRadius = course.bounds.size.width* 0.01;
        course.frame = CGRectMake(15, 80+100*i, 347, 85);
        i++;
        [_sc3 addSubview:course];
    }
    
}

#pragma mark - UIScrollViewDelegate的可选方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(!([scrollView class] == [UICollectionView class])){
    CGFloat x = scrollView.contentOffset.x/3;
    CGPoint point = CGPointMake(x+62,3.5);
    littleredview.center = point;
    if (littleredview.center.x<=180) {
        [btn1 setTitleColor:LySystemColor forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if (181<= littleredview.center.x && littleredview.center.x <=300){
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitleColor:LySystemColor forState:UIControlStateNormal];
        [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else if (littleredview.center.x>=301){
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn3 setTitleColor:LySystemColor
         forState:UIControlStateNormal];
    }
    // 改变scrollView偏移量
    [littlescrollview scrollRectToVisible:littleredview.frame animated:YES];
    }
}
#pragma mark - 按钮按下的事件实现
- (void)clickshouye:(UIButton *)sender {
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    if ([sender.titleLabel.text isEqualToString:@"首页"]) {
        _downscroll.contentOffset  =CGPointMake(0, 0);
    } else if ([sender.titleLabel.text isEqualToString:@"云课堂"]) {
        _downscroll.contentOffset  =CGPointMake(375, 0);
    }else{
        _downscroll.contentOffset  =CGPointMake(750, 0);
    }
    [UIView commitAnimations];
    //   动画还没有实现呢！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
}

#pragma mark - tabelview的数据源方法和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 4) {
        return 4;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section <= 3 ) {
        LYCollectionviewOnTableviewCell * cellll = [tableView dequeueReusableCellWithIdentifier:@"ddd"];
        if (cellll == NULL) {
            cellll = [[LYCollectionviewOnTableviewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ddd"  null:NULL];
        }
        if (indexPath.section == 1) {
            [cellll setvaluetoarraymodel:_interfaceData2 tableviewcell:cellll viewcontroller:self];
            return cellll;
        }else if (indexPath.section == 2){
            [cellll setvaluetoarraymodel:_interfaceData3 tableviewcell:cellll viewcontroller:self];
            return cellll;
        }else if (indexPath.section == 0){
            LYCollectionviewOnTableviewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"cellname"];
            if (cell1 == NULL) {
                cell1 = [[LYCollectionviewOnTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellname"];
            }
            [cell1 setvaluetoarraymodel:NULL tableviewcell:cell1 viewcontroller:self];
            return cell1;
        }else{
            [cellll setvaluetoarraymodel:_interfaceData4 tableviewcell:cellll viewcontroller:self];
            return cellll;
        }
    }else{
        if (indexPath.row<=2) {
            self.model = _interfaceData5[indexPath.row];
        }else
            self.model = NULL;

//            LYdownCellView * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        LYdownCellView * cell = [[[NSBundle mainBundle]loadNibNamed:@"LYdownCellView" owner:self options:NULL]firstObject];
        [cell.image sd_setImageWithURL:(NSURL *)self.model.logo];
            cell.label.text = self.model.name;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if(indexPath.row == 3){
            [cell.image setImage:[UIImage imageNamed:@"112"]];
            cell.label.text = @"喜马拉雅电台";
        }
            return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {

        LYPageView * pageview = [LYPageView pageView];

            LYmainPageModel* model1 = _interfaceData1[0];
            LYmainPageModel* model2 = _interfaceData1[1];

            pageview.imageWebNames = @[model1.web_large_img,model2.web_large_img];

        pageview.bounds = CGRectMake(0, 0, 375, 170);
 
        return pageview;
    }else if (section == 4){
        UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"LYtabelview" owner:NULL options:NULL]lastObject];
        UIButton * btn = [(UIButton *)view viewWithTag:100];
        [btn setTitle:@"  推荐电台" forState:UIControlStateNormal];

        return view;
    }else if (section == 5){
        UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"LYtabelview" owner:NULL options:NULL]lastObject];
        UIButton * btn = [(UIButton *)view viewWithTag:100];
        [btn setTitle:@"  热门活动" forState:UIControlStateNormal];
        
        return view;
    }else
        return NULL;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 170;
    }
    if(section ==4 || section == 5){
        return 25;
    }
    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section<=3) {
        if(indexPath.section == 0){
            return 96;
        }else
        return 190;
    }
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section >=3) {
        return 15;
    }else
    return 1;
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section <=3) {
        return NO;
    }else
        return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LYTableViewController *tableVc = [[LYTableViewController alloc]init];
    [self.navigationController pushViewController:tableVc animated:YES];
    
    
    
}

@end


//  可以设置到navigationBar的颜色但是它会吧状态栏的颜色一起改变
//    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];

/**  把没有真实图片的图片放上去，可以把navigationBar变成白色背景和去掉下面的分割线
 *   para:    forBarMetrics:（相当于按钮的status状态的意思）
 *1、UIBarMetricsDefault    默认状态下，横屏和竖屏都有这个效果
 *2、UIBarMetricsCompact    只有在横屏的状态下面次啊游这个效果
 */
/**   子控制器的矩形的边缘布局  edgesForExtendedLayout
 *  UIRectEdgeNone   = 0,
 *  UIRectEdgeTop    = 1 << 0,
 *  UIRectEdgeLeft   = 1 << 1,
 *  UIRectEdgeBottom = 1 << 2,
 *  UIRectEdgeRight  = 1 << 3,
 *  UIRectEdgeAll    = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight
 *
 *默认状态是UIRectEdgeAll，如果根控制器是UINavigaition控制器，则子控制器的view会被navigaitionbar所覆盖应下移44的高度
 */

//  这个不用啦。 为了能够去掉navigaitionbar的分割线后能设置好statusBar的背景色
//    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }

//导航栏底部线清楚
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//    self.navigationController.navigationBar.translucent = YES;
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
