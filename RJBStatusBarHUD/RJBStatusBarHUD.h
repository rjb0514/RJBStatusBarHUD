//
//  RJBStatusBarHUD.h
//  状态栏指示器
//
//  Created by 茹 on 2018/1/9.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJBStatusBarHUD : NSObject


//显示成功信息
+ (void)showSuccess:(NSString *)msg;

//显示失败信息
+ (void)showError:(NSString *)msg;

//显示文字
+ (void)showMassage:(NSString *)msg;

//显示loading信息
+ (void)showLoading:(NSString *)msg;

//隐藏
+ (void)hide;

@end
