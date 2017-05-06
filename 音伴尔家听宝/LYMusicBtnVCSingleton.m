//
//  LYMusicBtnVCSingleton.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/21.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYMusicBtnVCSingleton.h"
#import "LYmusicViewController.h"


@interface LYMusicBtnVCSingleton ()
@property (strong,nonatomic) UIViewController * lyvc;
@end

@implementation LYMusicBtnVCSingleton

+(instancetype)initwithvc: ( UIViewController *)vcc{
    LYMusicBtnVCSingleton * musicvc = [[LYMusicBtnVCSingleton alloc]init];
    musicvc.lyvc = vcc;
    return musicvc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 55, 55)];
    [btn setImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
    UIView * viewd = [[UIView alloc]initWithFrame:CGRectMake(10, 27.5, 55, 49)];
    viewd.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:viewd];
    [btn setBackgroundImage:[UIImage imageNamed:@"vip"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(music) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}
-(void)music{
    LYmusicViewController *compose=[[LYmusicViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:compose];
    [self.lyvc presentViewController:nav animated:YES completion:nil];
    [LYMusicBtnWindowSingleton sharedMusicBtnWindowSingleton:NULL].hidden = YES;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
