//
//  ViewController.m
//  photo
//
//  Created by David on 16/6/20.
//  Copyright © 2016年 David. All rights reserved.
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
