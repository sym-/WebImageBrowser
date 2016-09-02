//
//  ViewController.m
//  photo
//
//  Created by 宋元明 on 16/8/29.
//  Copyright © 2016年 宋元明. All rights reserved.
//

#import "ViewController.h"
#import "DWWebViewVC.h"
#import "DWTableViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}
- (IBAction)webClick:(id)sender {
    
    DWWebViewVC *webVC = [[DWWebViewVC alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}
- (IBAction)imageClick:(id)sender {
    
    DWTableViewController *tableVC = [[DWTableViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
