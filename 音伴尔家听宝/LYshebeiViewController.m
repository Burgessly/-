
//
//  LYshebeiViewController.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/7.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYshebeiViewController.h"
#import "LYdevise.h"

@interface LYshebeiViewController ()

@end

@implementation LYshebeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    scroll.backgroundColor = [UIColor whiteColor];
    scroll.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*1.3);
    
    [self.view addSubview:scroll];
    
    UIBarButtonItem * btn = [[UIBarButtonItem alloc]initWithTitle:@"添加设备" style:UIBarButtonItemStylePlain target:self action:NULL];
    [btn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
    btn.tintColor = LySystemColor;
    self.navigationItem.rightBarButtonItem = btn;
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(100, 180, 175, 25)];
    [label setText:@"····点击刷新设备·····"];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:14];
    [scroll addSubview:label];
//    LYdevise * devise = [[NSBundle mainBundle]loadNibNamed:@"LYdevise" owner:NULL options:NULL];
//    devise.frame = CGRectMake(0, 30, 375, 115);
//    [self.view addSubview:devise];
    
    scroll.backgroundColor = LyBackgroundColor;
    LYdevise * deviseview = [[[NSBundle mainBundle]loadNibNamed:@"LYdevise" owner:NULL options:NULL]firstObject];
    deviseview.frame = CGRectMake(8, 25, 358, 115);
    deviseview.layer.borderWidth = 2;
    deviseview.layer.borderColor = LySystemColor.CGColor;
    deviseview.layer.cornerRadius = 10.0;
    
    deviseview.nameLabel.textColor = LySystemColor;
    deviseview.devisebtn.backgroundColor = LySystemColor;
    deviseview.devisebtn.layer.cornerRadius = 10;
    [scroll addSubview:deviseview];

}



@end
