//
//  Tools.m
//  CarModelHeadlines
//
//  Created by 宋元明 on 16/8/29.
//  Copyright © 2016年 宋元明. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+ (void)addJavaScriptWithWebView:(UIWebView *)webView {
    NSString *clickGirl = [[NSBundle mainBundle] pathForResource:@"webjs" ofType:@"js"];
    clickGirl = [NSString stringWithContentsOfFile:clickGirl encoding:NSUTF8StringEncoding error:nil];
    [webView stringByEvaluatingJavaScriptFromString:clickGirl];
}


@end
