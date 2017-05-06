//
//  LYTabBarController.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYTabBarController.h"

#import "LYFindViewController.h"
#import "LYshebeiViewController.h"
#import "LYchatViewController.h"
#import "LYmineViewController.h"
#import "LYmusicViewController.h"
#import "LYMusicBtnWindowSingleton.h"

#import "LYnavigationController.h"


@interface LYTabBarController ()

@end

@implementation LYTabBarController

- (void)viewDidLoad
{
         [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
         //添加四个子控制器
         LYFindViewController *home=[[LYFindViewController alloc]init];
         [self addOneChildVc:home title:@"发现" imageName:@"find_no" selectedImageName:@"find_light"];
    
    
         LYshebeiViewController *message=[[LYshebeiViewController alloc]init];
         [self addOneChildVc:message title:@"设备" imageName:@"devise_no" selectedImageName:@"devise_light"];
    
         LYchatViewController *discover=[[LYchatViewController alloc]init];
         [self addOneChildVc:discover title:@"消息" imageName:@"chat_no" selectedImageName:@"chat_light"];
    
         LYmineViewController *profile=[[LYmineViewController alloc]init];
         [self addOneChildVc:profile title:@"用户" imageName:@"men_no" selectedImageName:@"men_light"];
    
        // 调整tabbar
         LYtabBar *customTabBar = [[LYtabBar alloc] init];
//         customTabBar.backgroundImage = [UIImage imageNamed:@"vip"];
//         customTabBar.selectionIndicatorImage = [UIImage imageNamed:@"vip"];
         // 更换系统自带的tabbar
        customTabBar.delegate = self;
         [self setValue:customTabBar forKeyPath:@"tabBar"];
    
         // 设置代理（监听控制器的切换， 控制器一旦切换了子控制器，就会调用代理的tabBarController:didSelectViewController:）
         self.delegate = self;
    
     }

 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
 {
         // 强制重新布局子控件（内部会调用layouSubviews）
         [self.tabBar setNeedsLayout];
     }

 /**
      *  添加一个子控制器
      *
      *  @param childVc           子控制对象
      *  @param title             标题
      *  @param imageName         图标
      *  @param selectedImageName 选中时的图标
      */
 -(void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
 {
         //随机设置子控制器的背景颜色
     //    childVc.view.backgroundColor=YYRandomColor;
    
     if ([title isEqualToString: @"用户"]|| [title isEqualToString: @"聊天"]) {
         childVc.tabBarItem.title=title;//设置tabbar上面的标题
         //设置图标
         childVc.tabBarItem.image=[UIImage imageNamed:imageName];
         UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
         childVc.tabBarItem.selectedImage = selectedImage;

         [self addChildViewController:childVc];
     }else
     {
         //设置标题
         childVc.title=title;  //相当于设置了后两者的标题
     //    childVc.navigationItem.title=title;//设置导航栏的标题
     //    childVc.tabBarItem.title=title;//设置tabbar上面的标题
    
         //设置图标
     childVc.tabBarItem.image=[UIImage imageNamed:imageName];
         //设置选中时的图标
         UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
    
    
         if (NSFoundationVersionNumber_iOS_9_3) {
                 // 声明这张图片用原图(别渲染)
                 selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
             }
         childVc.tabBarItem.selectedImage = selectedImage;
     
          // 添加为tabbar控制器的子控制器
         LYnavigationController *nav=[[LYnavigationController alloc]initWithRootViewController:childVc];
         nav.navigationBar.backgroundColor = [UIColor whiteColor];
//         nav.navigationBar.barTintColor = [UIColor whiteColor];
         nav.navigationBar.tintColor = [UIColor whiteColor];
         nav.navigationBar.alpha = 1.0;
         [nav.navigationBar setShadowImage:[[UIImage alloc]init]];
         [self addChildViewController:nav];
     
     
     }
     
     }

//#pragma mark-YYTabBarDelegate
// -(void)tabBarDidClickedPlusButton
//{
//        //弹出发微博的控制器
//        LYmusicViewController *compose=[LYmusicViewController initwithinstans];
//        LYnavigationController *nav=[[LYnavigationController alloc]initWithRootViewController:compose];
//        [self presentViewController:nav animated:YES completion:nil];
//    [LYMusicBtnWindowSingleton sharedMusicBtnWindowSingleton:self].hidden = NO;
//    }

@end
