//
//  RJBStatusBarHUD.m
//  状态栏指示器
//
//  Created by 茹 on 2018/1/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "RJBStatusBarHUD.h"
#import <UIKit/UIKit.h>

@implementation RJBStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;
//消息的停留时间
static CGFloat const RJBMessageDuration = 2.0;
//动画的显示 隐藏时间
static CGFloat const RJBAnimationDuration = 0.25;


+ (void )showWindow {
    
    CGFloat windowH = 20;
    CGRect tempFrame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    //解决点的快有残留窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = tempFrame;
    window_.hidden = NO;
    tempFrame.origin.y = 0;
    [UIView animateWithDuration:RJBAnimationDuration animations:^{
        window_.frame = tempFrame;
    }];

    
    
}

//显示成功信息
+ (void)showSuccess:(NSString *)msg {
    
    //销毁定时器
    [timer_ invalidate];
    [self showWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"RJBStatusBarHUD.bundle/checkSuccess"] forState:UIControlStateNormal];
    [window_ addSubview:btn];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:RJBMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


//显示文字
+ (void)showMassage:(NSString *)msg {
    [self showWindow];
    [timer_ invalidate];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setTitle:msg forState:UIControlStateNormal];
    [window_ addSubview:btn];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:RJBMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
//显示失败信息
+ (void)showError:(NSString *)msg {
    [self showWindow];
    [timer_ invalidate];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"RJBStatusBarHUD.bundle/checkError"] forState:UIControlStateNormal];
    [window_ addSubview:btn];
    
   timer_ = [NSTimer scheduledTimerWithTimeInterval:RJBMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

//显示loading信息
+ (void)showLoading:(NSString *)msg {
    [self showWindow];
    [timer_ invalidate];
    timer_ = nil;
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.text = msg;
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.frame = window_.bounds;
    [window_ addSubview:tipLabel];
    
    UIActivityIndicatorView *activiey = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activiey startAnimating];
    //文字的宽度
    CGFloat textW = [tipLabel.text boundingRectWithSize:CGSizeMake(300, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width;
    CGFloat centerX = (window_.bounds.size.width - textW) * 0.5 - 20;
    CGFloat centerY = 10;
    activiey.center = CGPointMake(centerX, centerY);
    [window_ addSubview:activiey];
    
    
    
}

//隐藏
+ (void)hide {
    
    CGRect tempFrame = window_.frame;
    tempFrame.origin.y = -tempFrame.size.height;
    [UIView animateWithDuration:RJBAnimationDuration animations:^{
        window_.frame = tempFrame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
        
    }];
    
}




@end
