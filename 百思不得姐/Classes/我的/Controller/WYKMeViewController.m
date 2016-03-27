//
//  WYKMeViewController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/26.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKMeViewController.h"

@interface WYKMeViewController ()

@end

@implementation WYKMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的"];

    self.navigationItem.rightBarButtonItems = @[
                                                [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)],
                                                [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(nightModeClick)]
                                                ];
    self.view.backgroundColor = WYKGlobalColor;

}


- (void)settingClick{
    WYKLogFUNC;
}

- (void)nightModeClick{
    WYKLogFUNC;
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
