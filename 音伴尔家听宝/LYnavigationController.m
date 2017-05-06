//
//  LYnavigationController.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/22.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYnavigationController.h"

@interface LYnavigationController ()

@end

@implementation LYnavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //  设置在navigaitioncontroller第二次push控制器的时候，隐藏下面的tabbar
    if (self.childViewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    //  统一设置push控制器的返回按钮的样式
//    self.navigationBar.barStyle = UIStatusBarStyleDefault;
    viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.navigationBar setTintColor:[UIColor  blackColor]];
    
    
    [super pushViewController:viewController animated:YES];
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
