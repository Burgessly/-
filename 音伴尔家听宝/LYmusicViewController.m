//
//  LYmusicViewController.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYmusicViewController.h"
#import "LYmusicCell.h"
#import "LYMusicBtnWindowSingleton.h"

@interface LYmusicViewController ()

//  中间视图的背景三要素
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UIImageView *contentimage;
@property (strong,nonatomic) UILabel * littlelabel;

//  播放、上一首、下一首视图
@property (strong,nonatomic) UIView *DownView;

//  中间视图的滚动视图
@property (strong,nonatomic) UIScrollView * ScrollView;

//  点击中间视图的scrollerview上面的透明按钮，弹出popup视图
@property (strong,nonatomic) UIView * popup;

//  中间视图的scrollerview上面的tableview
@property (strong,nonatomic) UITableView *scrolltableview;

@end

@implementation LYmusicViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  设置导航栏的背景为透明的
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    //  去掉导航栏的分割线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    //  界面的基本配置函数
    [self BasicSetup];
}




//     dissmiss模式控制器
-(void)back{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LYMusicBtnWindowSingleton sharedMusicBtnWindowSingleton:self].hidden = NO;
    });
}


#pragma mark - 点击播发界面的中间部分
/**
 * 点击播发界面的中间部分
 *
 */
-(void)clickTheBackground{
    static int i = 1;
    if (i%2 == 1) {
        [UIView animateWithDuration:0.5 animations:^{
            self.popup.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-186, [UIScreen mainScreen].bounds.size.width, 186);
        }];
        i++;
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.popup.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 186);
        }];
        i++;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - 中间scrollview列表的数据源方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //  多个scrollerview或者scrollerview的子类进行嵌套使用的时候，在代理方法中做事情时，需要区分时哪个scrollview，不然会出现bug
    if (!([scrollView class] == [UITableView class])) {
        CGFloat x = scrollView.contentOffset.x;
        self.titleLabel.alpha = 1-x/375;
        self.littlelabel.alpha = 1-x/375;
        self.contentimage.alpha = 1-x/375;
        if (x>= 0.5) {
            self.navigationItem.title = @"播放列表";
        }else
            self.navigationItem.title = @"播放详情";
    }
}



#pragma mark - 中间scrollerview上的tableview列表的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYmusicCell *musicCell = [tableView dequeueReusableCellWithIdentifier:@"musiccell"];
    musicCell.indicatorView.hidden = YES;
    musicCell.backgroundColor = [UIColor clearColor];
    musicCell.selectionStyle = UITableViewCellEditingStyleNone;
    return musicCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LYmusicCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.indicatorView.hidden = NO;
    NSLog(@"didDeselectRowAtIndexPath");
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    LYmusicCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.indicatorView.hidden = YES;
}


#pragma mark - 界面的基本配置
/**
 *      界面的基本配置
 *
 *
 */
-(void)BasicSetup{
    
    //      上面标题label的添加设置
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 85, [UIScreen mainScreen].bounds.size.width, 45)];
    self.titleLabel.text = @"明志系列故事";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [self.view addSubview:self.titleLabel];
    
    //      中间播放大图片的添加
    self.contentimage = [[UIImageView alloc]initWithFrame:CGRectMake(87.5, 180, 200, 200)];
    self.contentimage.layer.cornerRadius = self.contentimage.bounds.size.width*0.5;
    self.contentimage.clipsToBounds = YES;
    [self.contentimage setImage:[UIImage imageNamed:@"middlepic"]];
    [self.view addSubview:self.contentimage];
    
    //      下端label的添加设置
    self.littlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 470, [UIScreen mainScreen].bounds.size.width, 30)];
    self.littlelabel.text = @"01 周易 上经。屯卦第三";
    self.littlelabel.textAlignment = NSTextAlignmentCenter;
    [self.littlelabel setFont:[UIFont systemFontOfSize:14]];
    [self.view addSubview:self.littlelabel];
    
    //      下端播放控制的view的添加
    self.DownView = [[[NSBundle mainBundle]loadNibNamed:@"LYDownView" owner:NULL options:NULL]firstObject];
    self.DownView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-113, [UIScreen mainScreen].bounds.size.width, 113);
    self.DownView.backgroundColor= LyBackgroundColor;
    [self.view addSubview:self.DownView];
    
    //      导航条的设置
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"musicdown"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.title = @"播放详情";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ellipses"] landscapeImagePhone:[UIImage imageNamed:@"ellipses"]  style:UIBarButtonItemStylePlain target:self action:@selector(clickTheBackground)];
    self.view.backgroundColor = LyBackgroundColor;
    
    //      scrollview的初始化
    NSInteger MiddleHeight = [UIScreen mainScreen].bounds.size.height-113-64;
    self.ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, MiddleHeight)];
    self.ScrollView.delegate = self;
    self.ScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.showsHorizontalScrollIndicator = NO;
    
    //      scrollerview上面透明button的设置
    UIButton * ClearButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, MiddleHeight)];
    ClearButton.backgroundColor = [UIColor clearColor];
    [ClearButton addTarget:self action:@selector(clickTheBackground) forControlEvents:UIControlEventTouchDown];
    [self.ScrollView addSubview:ClearButton];
    
    //      scrollerview上面的tableview的配置
    self.scrolltableview = [[UITableView alloc]initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, MiddleHeight) style:UITableViewStylePlain];
    self.scrolltableview.dataSource = self;
    self.scrolltableview.delegate = self;
    self.scrolltableview.backgroundColor = [UIColor clearColor];
    [self.scrolltableview registerClass:[LYmusicCell class] forCellReuseIdentifier:@"musiccell"];
    [self.ScrollView addSubview:self.scrolltableview];
    [self.view addSubview:self.ScrollView];
    
    //     添加下方的弹出视图，等待点击透明button时响应
    self.popup = [[[NSBundle mainBundle] loadNibNamed:@"LYDownView" owner:self options:NULL]lastObject];
    self.popup.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 186);
    [self.view addSubview:self.popup];
}


@end
