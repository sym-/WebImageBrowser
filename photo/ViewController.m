//
//  ViewController.m
//  photo
//
//  Created by 宋元明 on 16/8/29.
//  Copyright © 2016年 宋元明. All rights reserved.
//

#import "ViewController.h"
#import "YMWebViewVC.h"
#import "YMTableViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}
- (IBAction)webClick:(id)sender {
    
    YMWebViewVC *webVC = [[YMWebViewVC alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}
- (IBAction)imageClick:(id)sender {
    
    YMTableViewController *tableVC = [[YMTableViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
