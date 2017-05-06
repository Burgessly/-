//
//  LYMusicBtnVc.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/17.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYMusicBtnVc.h"
#import "LYmusicViewController.h"

@interface LYMusicBtnVc ()

@end

@implementation LYMusicBtnVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 75, 75)];
    [btn setImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"vip"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
}

- (void)click {
    // Dispose of any resources that can be recreated.
    //弹出发微博的控制器
    LYmusicViewController *compose=[[LYmusicViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
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
