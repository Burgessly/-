//
//  LYPageView.m
//  音伴尔家听宝
//
//  Created by Burgess on 2017/4/12.
//  Copyright © 2017年 Burgess. All rights reserved.
//

#import "LYPageView.h"
#import <UIImageView+WebCache.h>

@interface LYPageView() <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 定时器 */
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LYPageView
#pragma mark - 初始化方法
/**
 * 当控件通过代码创建时，就会调用这个方法
 * 当控件通过代码创建时，想做一些初始化操作。应该在这个方法中执行
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
        
        // 添加子控件代码
    }
    return self;
}

/**
 * 当控件从xib\storyboard中创建完毕时，就会调用这个方法
 * 当控件从xib\storyboard中创建完毕后的初始化操作。应该在这个方法中执行
 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

/**
 * 初始化代码
 */
- (void)setup
{
    
    // 开启定时器
    [self startTimer];
}

+ (instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

/**
 * 当控件的尺寸发生改变的时候，会自动调用这个方法
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置scrollView的frame
    self.scrollView.frame = self.bounds;
    
    // 获得scrollview的尺寸
    CGFloat scrollW = self.scrollView.frame.size.width;
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    // 设置pageControl
    CGFloat pageW = 100;
    CGFloat pageH = 20;
    // CGFloat pageX = scrollW - pageW;
    CGFloat pageY = scrollH - pageH;
    self.pageControl.bounds = CGRectMake(0, 0, pageW, pageH);
    self.pageControl.center = CGPointMake(self.scrollView.center.x, pageY);
    
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(self.imageWebNames.count * scrollW, 0);
    
    // 设置所有imageView的frame
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
    }
}

#pragma mark - setter方法的重写
- (void)setImageWebNames:(NSArray *)imageWebNames
{
    _imageWebNames = imageWebNames;
    
    // 移除之前的所有imageView
    // 让subviews数组中的所有对象都执行removeFromSuperview方法
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 根据图片名创建对应个数的imageView
    for (int i = 0; i<imageWebNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:imageWebNames[i]];
        [self.scrollView addSubview:imageView];
    }
    
    // 设置总页数
    self.pageControl.numberOfPages = imageWebNames.count;
}
- (void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}

- (void)setOtherColor:(UIColor *)otherColor
{
    _otherColor = otherColor;
    
    self.pageControl.pageIndicatorTintColor = otherColor;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

#pragma mark - 定时器控制
- (void)startTimer
{
    // 创建一个定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

/**
 * 下一页
 */
- (void)nextPage
{
    NSInteger page = self.pageControl.currentPage + 1;
    if (page == self.pageControl.numberOfPages) {
        page = 0;
    }
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = page * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:offset animated:YES];   // animate at constant velocity to new offset
}
@end
