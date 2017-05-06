//
//  LYMusicBtnWindowSingleton.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/19.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYMusicBtnWindowSingleton.h"
#import "LYMusicBtnVCSingleton.h"
#import "LYmusicViewController.h"

@interface LYMusicBtnWindowSingleton()
@property (strong,nonatomic) UIViewController * lyvc;
@end

@implementation LYMusicBtnWindowSingleton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
static LYMusicBtnWindowSingleton *manager = nil;
+(LYMusicBtnWindowSingleton *)sharedMusicBtnWindowSingleton:(UIViewController *)viewc{
    
    static LYMusicBtnWindowSingleton *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(manager == nil){
            manager = [[LYMusicBtnWindowSingleton alloc]init];
            LYMusicBtnVCSingleton * vc = [LYMusicBtnVCSingleton initwithvc:viewc];
            manager.lyvc = viewc;
            [manager setRootViewController:vc];
            manager.windowLevel = UIWindowLevelNormal+2;
        }
    } );
    manager.hidden = NO;
    return manager;
}
//+(id)allocWithZone:(NSZone *)zone{
//    @synchronized(self){
//        if (!manager) {
//            manager = [super allocWithZone:zone]; //确保使用同一块内存地址
//            LYMusicBtnVCSingleton * vc = [LYMusicBtnVCSingleton initwithvc:manager.lyvc];
//            [manager setRootViewController:vc];
//            manager.windowLevel = UIWindowLevelNormal+2;            return manager;
//        }
//        return nil;
//    }
//}
//- (id)init;
//{
//    @synchronized(self) {
//        if (self = [super init]){
//            LYMusicBtnVCSingleton * vc = [LYMusicBtnVCSingleton initwithvc:manager.lyvc];
//            [self setRootViewController:vc];
//            self.windowLevel = UIWindowLevelNormal+2;
//            return self;
//        }
//        return nil;
//    }
//}



@end
