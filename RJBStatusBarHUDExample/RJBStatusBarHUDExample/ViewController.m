//
//  ViewController.m
//  RJBStatusBarHUDExample
//
//  Created by 茹 on 2018/1/16.
//  Copyright © 2018年 kkx. All rights reserved.
//

#import "ViewController.h"
#import "RJBStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)successClick:(id)sender {
    
    [RJBStatusBarHUD showSuccess:@"加载成功"];
    
}
- (IBAction)faildClick:(id)sender {
    [RJBStatusBarHUD showError:@"加载失败"];
}
- (IBAction)displayTextClick:(id)sender {
    [RJBStatusBarHUD showMassage:@"还是什么"];
}
- (IBAction)loadingClick:(id)sender {
    
    [RJBStatusBarHUD showLoading:@"还是什么"];
}
- (IBAction)hidenClick:(id)sender {
    
    [RJBStatusBarHUD hide];
}


@end
